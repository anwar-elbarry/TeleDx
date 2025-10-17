package com.teleDx.controller;

import com.teleDx.dao.user.UserDAOImpl;
import com.teleDx.entity.User;
import com.teleDx.service.user.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static java.lang.System.out;

@WebServlet(name = "AuthController", urlPatterns = {"/login", "/logout"})
public class AuthController extends HttpServlet {

    private final UserServiceImpl userService = new UserServiceImpl(new UserDAOImpl());


    @Override
    protected void doGet(HttpServletRequest req , HttpServletResponse resp)throws ServletException , IOException{
        String action  = req.getServletPath();
        if("/logout".equals(req.getServletPath())){
            logout(req,resp);
        }
        else{
            req.getRequestDispatcher("/views/login.jsp").forward(req,resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req , HttpServletResponse resp)throws ServletException , IOException{
        if("/login".equals(req.getServletPath())){
            login(req,resp);
        }
    }



    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if(username == null || password == null || username.isEmpty() || password.isEmpty()){
            req.setAttribute("error","Username and password are required");
            req.getRequestDispatcher("/views/login.jsp").forward(req,resp);
            return;
        }
        if(userService.authenticate(username,password)){
            HttpSession session = req.getSession();
            session.setAttribute("user",userService.findByUsername(username).orElse(null));
            resp.sendRedirect(req.getContextPath()+"/dashboard");
        }else {
            out.println("{\"error" + ":" + "Invalid username or password\"}");
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        resp.sendRedirect(req.getContextPath() + "/");
    }
    }

