package com.teleDx.controller.medcin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.teleDx.entity.Consultation;
import com.teleDx.entity.Enums.ConsulStatut;
import com.teleDx.entity.Enums.ExperPriorite;
import com.teleDx.entity.Enums.ExperStatut;
import com.teleDx.entity.Expertise;
import com.teleDx.entity.Medecin;
import com.teleDx.entity.Patient;
import com.teleDx.service.consultation.ConsultationService;
import com.teleDx.service.consultation.ConsultationServiceImpl;
import com.teleDx.service.creneau.CreneauService;
import com.teleDx.service.creneau.CreneauServiceImpl;
import com.teleDx.service.medecin.MedecinService;
import com.teleDx.service.medecin.MedecinServiceImpl;
import com.teleDx.service.expertise.ExpertiseService;
import com.teleDx.service.expertise.ExpertiseServiceImpl;
import com.teleDx.service.patient.PatientService;
import com.teleDx.service.patient.PatientServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "generalistController", urlPatterns = {
        "/dashboard/generalistDash",
        "/dashboard/generaliste/consultation/create",
        "/dashboard/generaliste/consultation/close",
        "/dashboard/generaliste/specialistes",
        "/dashboard/generaliste/specialistes/disponibles",
        "/dashboard/generaliste/patients",
        "/dashboard/generaliste/creneaux",
        "/dashboard/generaliste/creneaux/reserver",
        "/dashboard/generaliste/expertise/create",
        "/dashboard/generaliste/cout-total"
})
public class generalistController extends HttpServlet {

    private ConsultationService consultationService;
    private ExpertiseService expertiseService;
    private MedecinService medecinService;
    private CreneauService creneauService;
    private PatientService patientService;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void init() throws ServletException {
        this.consultationService = new ConsultationServiceImpl();
        this.expertiseService = new ExpertiseServiceImpl();
        this.medecinService = new MedecinServiceImpl();
        this.creneauService = new CreneauServiceImpl();
        this.patientService = new PatientServiceImpl();
        objectMapper.findAndRegisterModules();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        try {
            switch (path) {
                case "/dashboard/generalistDash" -> handleDefaultView(req, resp);
                case "/dashboard/generaliste/specialistes" -> handleListSpecialistes(req, resp);
                case "/dashboard/generaliste/specialistes/disponibles" -> handleListSpecialistesDisponibles(req, resp);
                case "/dashboard/generaliste/patients" -> handleListPatients(req, resp);
                case "/dashboard/generaliste/creneaux" -> handleListCreneaux(req, resp);
                case "/dashboard/generaliste/cout-total" -> handleCoutTotal(req, resp);
                default -> resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            handleError(resp, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        try {
            switch (path) {
                case "/dashboard/generaliste/consultation/create" -> handleCreateConsultation(req, resp);
                case "/dashboard/generaliste/consultation/close" -> handleCloseConsultation(req, resp);
                case "/dashboard/generaliste/creneaux/reserver" -> handleReserverCreneau(req, resp);
                case "/dashboard/generaliste/expertise/create" -> handleCreateExpertise(req, resp);
                default -> resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            handleError(resp, e);
        }
    }

    private void handleDefaultView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("contentPage", "/views/Dashboard/generalistDash.jsp");
        req.getRequestDispatcher("/views/main.jsp").forward(req, resp);
    }

    private void handleCreateConsultation(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String patientId = req.getParameter("patientId");
        String medecinId = req.getParameter("medecinId");
        String motif = req.getParameter("motif");
        String observations = req.getParameter("observations");

        Optional<Patient> patientOpt = patientService.findById(patientId);
        if (patientOpt.isEmpty()) throw new IllegalArgumentException("Patient not found");

        Medecin medecin = null;
        if (medecinId != null && !medecinId.isBlank()) {
            medecin = medecinService.findById(medecinId).orElse(null);
        }

        Consultation c = new Consultation();
        c.setPatient(patientOpt.get());
        if (medecin != null) c.setMedecin(medecin);
        if (motif != null) c.setMotif(motif);
        if (observations != null) c.setObservations(observations);
        c.setStatut(ConsulStatut.EN_ATTENTE_AVIS_SPECIALISTE); // default open state; can be closed later

        consultationService.save(c);

        resp.setStatus(HttpServletResponse.SC_CREATED);
        resp.getWriter().write("Consultation created with id: " + c.getId());
    }

    private void handleCloseConsultation(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String consultationId = req.getParameter("consultationId");
        Consultation c = consultationService.findById(consultationId)
                .orElseThrow(() -> new IllegalArgumentException("Consultation not found"));
        c.setStatut(ConsulStatut.TERMINEE);
        consultationService.update(c);
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write("Consultation closed");
    }

    private void handleListSpecialistes(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String specialite = req.getParameter("specialite");
        List<Medecin> medecins = medecinService.findBySpecialiteSortedByTarif(specialite);
        String json = objectMapper.writeValueAsString(medecins);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    private void handleListCreneaux(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String specialisteId = req.getParameter("specialisteId");
        boolean onlyDisponibles = Boolean.parseBoolean(req.getParameter("disponibles"));
        var list = onlyDisponibles
                ? creneauService.listDisponiblesForSpecialiste(specialisteId)
                : creneauService.listForSpecialiste(specialisteId);
        String json = objectMapper.writeValueAsString(list);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    private void handleListPatients(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            List<Patient> patients = patientService.findAll()
                    .stream()
                    .filter(Patient::isEnAttenteMedecin)
                    .collect(Collectors.toList());
            String json = objectMapper.writeValueAsString(patients);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
        } catch (SQLException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load patients");
        }
    }

    private void handleListSpecialistesDisponibles(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String specialite = req.getParameter("specialite");
        List<Medecin> medecins = medecinService.findBySpecialiteSortedByTarif(specialite);
        // Stream API: filter only specialists having au moins un créneau disponible, then sort by tarif
        List<Medecin> disponibles = medecins.stream()
                .filter(m -> !creneauService.listDisponiblesForSpecialiste(m.getId()).isEmpty())
                .sorted((m1, m2) -> m1.getTarif().compareTo(m2.getTarif()))
                .collect(Collectors.toList());
        String json = objectMapper.writeValueAsString(disponibles);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    private void handleReserverCreneau(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String creneauId = req.getParameter("creneauId");
        if (creneauId == null || creneauId.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "creneauId is required");
            return;
        }
        creneauService.reserver(creneauId);
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write("Creneau reserved");
    }

    private void handleCoutTotal(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Fixed consultation cost
        BigDecimal consultationCost = new BigDecimal("150");

        // Optional expertise cost: resolve by consultation's expertise specialiste tarif if present or provided
        String expertiseTarifParam = req.getParameter("expertiseTarif");
        BigDecimal expertiseCost = BigDecimal.ZERO;
        if (expertiseTarifParam != null && !expertiseTarifParam.isBlank()) {
            expertiseCost = new BigDecimal(expertiseTarifParam);
        }

        // Acts technical costs as comma-separated numbers: e.g., acts=100,50,20
        String actsParam = req.getParameter("acts");
        BigDecimal actsTotal = BigDecimal.ZERO;
        if (actsParam != null && !actsParam.isBlank()) {
            actsTotal = Arrays.stream(actsParam.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .map(BigDecimal::new)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
        }

        BigDecimal total = consultationCost.add(expertiseCost).add(actsTotal);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write('{'+"\"consultation\":"+ '"'+consultationCost.toPlainString()+'"'+","+
                "\"expertise\":"+ '"'+expertiseCost.toPlainString()+'"'+","+
                "\"acts\":"+ '"'+actsTotal.toPlainString()+'"'+","+
                "\"total\":"+ '"'+total.toPlainString()+'"'+'}');
    }

    private void handleCreateExpertise(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String consultationId = req.getParameter("consultationId");
        String specialisteId = req.getParameter("specialisteId");
        String question = req.getParameter("question");
        String prioriteParam = req.getParameter("priorite"); // URGENTE / NORMALE / NON_URGENTE
        String creneauId = req.getParameter("creneauId");

        Consultation consultation = consultationService.findById(consultationId)
                .orElseThrow(() -> new IllegalArgumentException("Consultation not found"));

        Expertise expertise = new Expertise();
        expertise.setQuestion(question);
        expertise.setConsultation(consultation);
        expertise.setStatut(ExperStatut.EN_ATTENTE);
        expertise.setPriorite(parsePriorite(prioriteParam));

        if (specialisteId != null && !specialisteId.isBlank()) {
            Medecin specialiste = medecinService.findById(specialisteId)
                    .orElseThrow(() -> new IllegalArgumentException("Specialiste not found"));
            expertise.setSpecialiste(specialiste);
        }

        if (creneauId != null && !creneauId.isBlank()) {
            // reserve selected creneau
            creneauService.reserver(creneauId);
        }

        expertiseService.save(expertise);

        consultation.setStatut(ConsulStatut.EN_ATTENTE_AVIS_SPECIALISTE);
        consultationService.update(consultation);

        resp.setStatus(HttpServletResponse.SC_CREATED);
        resp.getWriter().write("Expertise created with id: " + expertise.getId());
    }

    private ExperPriorite parsePriorite(String value) {
        if (value == null) return ExperPriorite.NORMALE;
        try {
            return ExperPriorite.valueOf(value);
        } catch (IllegalArgumentException ex) {
            return ExperPriorite.NORMALE;
        }
    }

    private void handleError(HttpServletResponse resp, Exception e) throws IOException {
        e.printStackTrace();
        resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        resp.getWriter().write("An error occurred: " + e.getMessage());
    }
}

