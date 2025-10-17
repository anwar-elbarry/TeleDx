package com.teleDx.controller.medcin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.teleDx.entity.Patient;
import com.teleDx.service.patient.PatientServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;

@WebServlet(name = "infirmierController", urlPatterns = {
    "/dashboard/infirmier",
    "/dashboard/infirmier/save",
    "/dashboard/infirmier/update",
    "/dashboard/infirmier/patient/*",
    "/dashboard/infirmier/patient-json",
    "/dashboard/infirmier/edit",
    "/dashboard/infirmier/patients",
    "/dashboard/infirmier/queue",
    "/dashboard/infirmier/update-priority"
})
public class InfirmierController extends HttpServlet {

    private PatientServiceImpl patientService;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void init() throws ServletException {
        this.patientService = new PatientServiceImpl();
        objectMapper.findAndRegisterModules();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        String pathInfo = req.getPathInfo();

        try {
            switch (path) {
                case "/dashboard/infirmier/patient" -> handleGetPatient(req, resp, pathInfo);
                case "/dashboard/infirmier/patient-json" -> handleGetPatientJson(req, resp);
                case "/dashboard/infirmier/edit" -> handleEditView(req, resp);
                case "/dashboard/infirmier/patients" -> handleListPatients(req, resp);
                case "/dashboard/infirmier/queue" -> handleGetQueue(req, resp);
                default -> handleDefaultView(req, resp);
            }
        } catch (Exception e) {
            handleError(resp, e);
        }
    }

    private void handleListPatients(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        String q = req.getParameter("q");
        boolean todayOnly = Boolean.parseBoolean(req.getParameter("today"));
        LocalDate today = LocalDate.now();

        List<Patient> all = patientService.findAll();
        var filtered = all.stream()
            .filter(p -> {
                if (q == null || q.isBlank()) return true;
                String needle = q.toLowerCase();
                String nom = p.getNom() != null ? p.getNom().toLowerCase() : "";
                String prenom = p.getPrenom() != null ? p.getPrenom().toLowerCase() : "";
                String secu = p.getNum_securite_soc() != null ? p.getNum_securite_soc().toLowerCase() : "";
                return nom.contains(needle) || prenom.contains(needle) || secu.contains(needle);
            })
            .filter(p -> !todayOnly || (p.getDateArrivee() != null && p.getDateArrivee().toLocalDate().isEqual(today)))
            .sorted(Comparator.comparing(Patient::getDateArrivee))
            .collect(Collectors.toList());

        String json = objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
                .writeValueAsString(filtered);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        try {
            switch (path) {
                case "/dashboard/infirmier/save" -> handleSavePatient(req, resp);
                case "/dashboard/infirmier/update" -> handleUpdatePatient(req, resp);
                case "/dashboard/infirmier/queue/add" -> handleAddToQueue(req, resp);
                case "/dashboard/infirmier/update-priority" -> handleUpdatePriority(req, resp);
                default -> resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            handleError(resp, e);
        }
    }

    private void handleDefaultView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
        List<Patient> patients = patientService.findAll();
        req.setAttribute("patients",patients);
        req.setAttribute("contentPage", "/views/Dashboard/infirmierDash.jsp");
        req.getRequestDispatcher("/views/main.jsp").forward(req, resp);
        }catch (Exception e){
            throw new ServletException("Error retrieving patients: " + e.getMessage(), e);
        }
    }

    private void handleEditView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            if (id == null || id.isBlank()) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "id is required");
                return;
            }
            Patient patient = patientService.findById(id)
                .orElseThrow(() -> new ServletException("Patient not found"));
            req.setAttribute("patient", patient);
            req.setAttribute("contentPage", "/views/Dashboard/patientEdit.jsp");
            req.getRequestDispatcher("/views/main.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException("Error loading patient: " + e.getMessage(), e);
        }
    }

    private void handleGetPatient(HttpServletRequest req, HttpServletResponse resp, String pathInfo) 
            throws ServletException, IOException, SQLException {
        if (pathInfo != null && pathInfo.length() > 1) {
            String patientId = pathInfo.substring(1);
            Patient patient = patientService.findById(patientId)
                .orElseThrow(() -> new ServletException("Patient not found"));
            req.setAttribute("patient", patient);
            req.getRequestDispatcher("/views/Dashboard/patientDetails.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Patient ID is missing");
        }
    }

    private void handleGetQueue(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        List<Patient> queue = patientService.findAll().stream()
            .filter(Patient::isEnAttenteMedecin)
            .sorted(Comparator.comparing(Patient::getPriorite)
                .thenComparing(Patient::getDateArrivee))
            .collect(toList());
        
        String queueJson = objectMapper.writeValueAsString(queue);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(queueJson);
    }

    private void handleGetPatientJson(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        String id = req.getParameter("id");
        if (id == null || id.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "id is required");
            return;
        }
        Patient patient = patientService.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Patient not found"));
        String json = objectMapper.writeValueAsString(patient);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    private void handleSavePatient(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // Administrative Information
        String nom = req.getParameter("nom");
        String prenom = req.getParameter("prenom");
        LocalDate dateNaissance = LocalDate.parse(req.getParameter("dateNaissance"), DateTimeFormatter.ISO_LOCAL_DATE);
        String telephone = req.getParameter("telephone");
        String email = req.getParameter("email");
        String numSecu = req.getParameter("numSecu");
        String adresse = req.getParameter("adresse");
        String ville = req.getParameter("ville");
        String codePostal = req.getParameter("codePostal");
        String mutuelle = req.getParameter("mutuelle");
        String numMutuelle = req.getParameter("numMutuelle");

        // Medical Information
        String antecedents = req.getParameter("antecedents");
        String allergies = req.getParameter("allergies");
        String traitements = req.getParameter("traitements");
        String groupeSanguin = req.getParameter("groupeSanguin");

        // Vital Signs
        Double poids = parseDoubleOrNull(req.getParameter("poids"));
        Double taille = parseDoubleOrNull(req.getParameter("taille"));
        Double temperature = parseDoubleOrNull(req.getParameter("temperature"));
        String tension = req.getParameter("tension");
        Integer freqCardiaque = parseIntOrNull(req.getParameter("freqCardiaque"));
        Integer freqRespiratoire = parseIntOrNull(req.getParameter("freqRespiratoire"));
        
        // Priority calculation (simplified example)
        int priorite = calculatePriority(
            temperature, 
            tension, 
            freqCardiaque, 
            freqRespiratoire
        );

        // Create and save patient
        Patient patient = new Patient();
        patient.setNom(nom);
        patient.setPrenom(prenom);
        patient.setDate_naissance(dateNaissance);
        patient.setTelephone(telephone);
        patient.setEmail(email);
        patient.setNum_securite_soc(numSecu);
        patient.setAdresse(adresse);
        patient.setVille(ville);
        patient.setCodePostal(codePostal);
        patient.setMutuelle(mutuelle);
        patient.setNumMutuelle(numMutuelle);
        patient.setAntecedents(antecedents);
        patient.setAllergies(allergies);
        patient.setTraitementsEnCours(traitements);
        patient.setGroupeSanguin(groupeSanguin);
        patient.setPoids(poids);
        patient.setTaille(taille);
        patient.setTemperature(temperature);
        patient.setTensionArterielle(tension);
        patient.setFrequenceCardiaque(freqCardiaque);
        patient.setFrequenceRespiratoire(freqRespiratoire);
        patient.setPriorite(priorite);
        patient.setEnAttenteMedecin(true);
        patient.setDateArrivee(LocalDateTime.now());

        patientService.save(patient);
        
        // Redirect
        resp.sendRedirect(req.getContextPath() + "/dashboard/infirmier");
    }

    private void handleUpdatePatient(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String patientId = req.getParameter("id");
        if (patientId == null || patientId.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "id is required");
            return;
        }

        Patient patient = patientService.findById(patientId)
            .orElseThrow(() -> new IllegalArgumentException("Patient not found"));

        // Administrative Information
        String nom = req.getParameter("nom");
        String prenom = req.getParameter("prenom");
        String dateNaissanceStr = req.getParameter("dateNaissance");
        LocalDate dateNaissance = (dateNaissanceStr != null && !dateNaissanceStr.isBlank())
                ? LocalDate.parse(dateNaissanceStr, DateTimeFormatter.ISO_LOCAL_DATE) : patient.getDate_naissance();
        String telephone = req.getParameter("telephone");
        String email = req.getParameter("email");
        String numSecu = req.getParameter("numSecu");
        String adresse = req.getParameter("adresse");
        String ville = req.getParameter("ville");
        String codePostal = req.getParameter("codePostal");
        String mutuelle = req.getParameter("mutuelle");
        String numMutuelle = req.getParameter("numMutuelle");

        // Medical Information
        String antecedents = req.getParameter("antecedents");
        String allergies = req.getParameter("allergies");
        String traitements = req.getParameter("traitements");
        String groupeSanguin = req.getParameter("groupeSanguin");

        // Vital Signs
        Double poids = parseDoubleOrNull(req.getParameter("poids"));
        Double taille = parseDoubleOrNull(req.getParameter("taille"));
        Double temperature = parseDoubleOrNull(req.getParameter("temperature"));
        String tension = req.getParameter("tension");
        Integer freqCardiaque = parseIntOrNull(req.getParameter("freqCardiaque"));
        Integer freqRespiratoire = parseIntOrNull(req.getParameter("freqRespiratoire"));

        // Apply updates (only overwrite when provided)
        if (nom != null) patient.setNom(nom);
        if (prenom != null) patient.setPrenom(prenom);
        if (dateNaissance != null) patient.setDate_naissance(dateNaissance);
        if (telephone != null) patient.setTelephone(telephone);
        if (email != null) patient.setEmail(email);
        if (numSecu != null) patient.setNum_securite_soc(numSecu);
        if (adresse != null) patient.setAdresse(adresse);
        if (ville != null) patient.setVille(ville);
        if (codePostal != null) patient.setCodePostal(codePostal);
        if (mutuelle != null) patient.setMutuelle(mutuelle);
        if (numMutuelle != null) patient.setNumMutuelle(numMutuelle);
        if (antecedents != null) patient.setAntecedents(antecedents);
        if (allergies != null) patient.setAllergies(allergies);
        if (traitements != null) patient.setTraitementsEnCours(traitements);
        if (groupeSanguin != null) patient.setGroupeSanguin(groupeSanguin);
        if (poids != null) patient.setPoids(poids);
        if (taille != null) patient.setTaille(taille);
        if (temperature != null) patient.setTemperature(temperature);
        if (tension != null) patient.setTensionArterielle(tension);
        if (freqCardiaque != null) patient.setFrequenceCardiaque(freqCardiaque);
        if (freqRespiratoire != null) patient.setFrequenceRespiratoire(freqRespiratoire);

        patientService.update(patient);
        resp.sendRedirect(req.getContextPath() + "/dashboard/infirmier");
    }

    private void handleUpdatePriority(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        String patientId = req.getParameter("patientId");
        int newPriority = Integer.parseInt(req.getParameter("priority"));
        
        Patient patient = patientService.findById(patientId)
            .orElseThrow(() -> new IllegalArgumentException("Patient not found"));
        
        patient.setPriorite(newPriority);
        patientService.save(patient);
        
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write("Priority updated successfully");
    }

    private void handleAddToQueue(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String patientId = req.getParameter("patientId");
        if (patientId == null || patientId.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "patientId is required");
            return;
        }
        Patient patient = patientService.findById(patientId)
            .orElseThrow(() -> new IllegalArgumentException("Patient not found"));
        patient.setEnAttenteMedecin(true);
        patient.setDateArrivee(LocalDateTime.now());
        // keep existing priority; could recalc later if needed
        patientService.update(patient);
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write("Added to queue");
    }

    private int calculatePriority(Double temperature, String tension, Integer freqCardiaque, Integer freqRespiratoire) {
        int priority = 3; // Default priority
        
        // Simple priority calculation based on vital signs
        if (temperature != null && (temperature > 39 || temperature < 35)) priority--;
        if (freqCardiaque != null && (freqCardiaque > 100 || freqCardiaque < 50)) priority--;
        if (freqRespiratoire != null && (freqRespiratoire > 20 || freqRespiratoire < 10)) priority--;
        if (tension != null && tension.matches("^[1-9]\\d{1,2}/[1-9]\\d{1,2}$")) {
            String[] parts = tension.split("/");
            int systolic = Integer.parseInt(parts[0]);
            int diastolic = Integer.parseInt(parts[1]);
            if (systolic > 140 || diastolic > 90 || systolic < 90 || diastolic < 60) {
                priority--;
            }
        }
        
        return Math.max(1, Math.min(5, priority)); // Ensure priority is between 1 and 5
    }

    private Double parseDoubleOrNull(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private Integer parseIntOrNull(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private void handleError(HttpServletResponse resp, Exception e) throws IOException {
        e.printStackTrace();
        resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        resp.getWriter().write("An error occurred: " + e.getMessage());
    }
}