//package control;
//
//import dao.DAO;
//import entity.Account;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet("/login")
//public class LoginControl extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        String username = req.getParameter("user");
//        String password = req.getParameter("pass");
//        DAO dao = new DAO();
//
//
//    Account a = dao.login(username, password);
//        if (a == null) {
//            String errorString = "Invalid userName or Password";
//            req.setAttribute("errorString", errorString);
//            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login.jsp");
//            dispatcher.forward(req, resp);
//        } else {
//            HttpSession session =req.getSession();
//            session.setAttribute("acc",a);
//            session.setMaxInactiveInterval(100);
////            thời gian session tồn tại 100s
//            resp.sendRedirect("/");
//
//        }
//}}
