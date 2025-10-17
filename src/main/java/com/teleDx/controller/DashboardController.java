package com.teleDx.controller;

import com.teleDx.entity.Enums.RoleName;
import com.teleDx.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "DashboardController", urlPatterns = {"/dashboard"})
public class DashboardController extends HttpServlet {

    // Define allowed medical roles for dashboard access
    private static final List<RoleName> MEDICAL_ROLES = Arrays.asList(
            RoleName.INFIRMIER,
            RoleName.GENERALISTE,
            RoleName.SPECIALISTE
    );

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Check if user has a medical role
        if (!isMedicalRole(user.getRole().getNom())) {
            req.setAttribute("error", "Access denied. Dashboard is only for medical professionals.");
            resp.sendRedirect(req.getContextPath() + "/?error=access_denied");
            return;
        }

        req.setAttribute("user", user);

        // Route to appropriate dashboard based on role
        String dashboardPath = getDashboardControllerPath(user.getRole().getNom());
        resp.sendRedirect(req.getContextPath() + dashboardPath);
    }

    private boolean isMedicalRole(RoleName roleName) {
        return MEDICAL_ROLES.contains(roleName);
    }

    private String getDashboardControllerPath(RoleName roleName) {
        switch (roleName) {
            case INFIRMIER:
                return "/dashboard/infirmier";
            case GENERALISTE:
                return "/dashboard/generalistDash";
            case SPECIALISTE:
                return "/dashboard/specialistDash";
            default:
                // Fallback to infirmier if role doesn't match
                return "/dashboard/infirmierDash";
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Handle any POST requests if needed
        doGet(req, resp);
    }
}