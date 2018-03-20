/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bolsaempleo.ui;

/**
 *
 * @author pc
 */
import entidades.Oferente;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.model;

/**
 *
 * @author Escinf
 */
@WebServlet(name = "Login", urlPatterns = {"/Login", "/Logout"})
public class Login extends HttpServlet {
  protected void processRequest(HttpServletRequest request, 
                                HttpServletResponse response)
         throws ServletException, IOException {
    switch(request.getServletPath()){
        case "/Login":
            this.doLogin(request,response);
            break;
        case "/Logout":
            this.doLogout(request,response);
            break;
    }
  }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void doLogin(HttpServletRequest request, 
            
            
        HttpServletResponse response) throws ServletException, IOException {
      try{
          
          System.out.println("en do Login");
        HttpSession s =  request.getSession( true);
//<editor-fold defaultstate="collapsed" desc="...">
String identificacion   = request.getParameter("cedulaOferente");
String clave   = request.getParameter("clave");

Oferente oferente = new Oferente();
oferente.setCedulaOferente(identificacion);
oferente.setClave(clave);
//oferente.setCedulaOferente("554533243");
//oferente.setClave("sss");
//</editor-fold>
       oferente = model.instance().getOferente(oferente);
	//s.setAttribute("oferente",oferente);
	request.getRequestDispatcher("inicioEmpresa.jsp").
                forward( request, response);
      }
      catch(Exception e){	
	request.setAttribute("error","Credenciales incorrectas..");
	request.getRequestDispatcher("principal.jsp").
                forward( request, response);
      }		
    }
    protected void doLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.getSession().invalidate();
            request.getRequestDispatcher("Login.jsp").forward( request, response);          
    }    
}