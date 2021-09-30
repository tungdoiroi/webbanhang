//package control;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//
//@WebServlet(name = "LogOutControl", urlPatterns = {"/logout"})
//public class LogOutControl extends HttpServlet {
//
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        HttpSession session = request.getSession();
//        session.removeAttribute("acc");
//        response.sendRedirect("home");
//    }
//
//
//    }
//
