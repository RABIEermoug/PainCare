package paincare.servlets.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import paincare.dao.DAOFactory;
import paincare.dao.UserDao;
import paincare.dao.imp.UserDaoImp; 
import paincare.entities.UserEntity;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=request.getServletPath();
        if (path.equals("/Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   HttpSession session = request.getSession();

	        String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        UserEntity userEntity = null;
	        UserDao userDAO = new UserDaoImp(DAOFactory.getInstance()); // Remplacez DAOFactory.getInstance() par votre méthode pour obtenir une instance de DAOFactory

	        try {
	            userEntity = userDAO.isValidUser(email, password);
	        } catch (SQLException e) {

	            e.printStackTrace(); 
	        }
	        if(userEntity != null){

	            session.setAttribute("sessionuser",userEntity);

	            //Vérifiez si est un médecin ou patient et dirige chacun vers sa espace
	          
	                request.setAttribute("user",userEntity);
	                response.sendRedirect("http://localhost:8080/PainCare/Home");
	        } else {
	            String message = "Email et/ou Mot de passe incorrect(s)";
	            request.setAttribute("message", message);
	            doGet(request, response);
	        }

	}

}
