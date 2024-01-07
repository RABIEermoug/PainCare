package paincare.servlets.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import paincare.dao.BlogDao;
import paincare.dao.DAOFactory;
import paincare.dao.UserDao;
import paincare.dao.imp.BlogDaoImp;
import paincare.dao.imp.UserDaoImp;
import paincare.entities.UserEntity;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

/**
 * Servlet implementation class EditUserServlet
 */
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
  private UserDao userDao;
    
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDao = new UserDaoImp(daoFactory);
        
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	HttpSession session = request.getSession();
		
		UserEntity sessionUser = (UserEntity) session.getAttribute("sessionuser");

		request.setAttribute("user", sessionUser);
		request.getRequestDispatcher("/profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			
			UserEntity sessionUser = (UserEntity) session.getAttribute("sessionuser");
			  // Récupérer les paramètres du formulaire
            String name = request.getParameter("username");
            String birthday = request.getParameter("birthday");
            String email = request.getParameter("email");
            
            UserEntity newInfo = new UserEntity();
	
            newInfo.setName(name);
            newInfo.setEmail(email);
            newInfo.setBirthday(Date.valueOf(birthday));
            newInfo.setIdUser(sessionUser.getIdUser());
            // Ajouter l'utilisateur à la base de données
            UserDao userDAO = new UserDaoImp(DAOFactory.getInstance());  // Remplacez DAOFactory.getInstance() par votre méthode pour obtenir une instance de DAOFactory
            try {
                boolean isExist = userDAO.isExist(email);
                if (isExist) {
                    String message = "Cet email est déjà utilisé.Essayer un autre";
                    request.setAttribute("message", message);
                    this.getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);

                } else {
                	userDao.updateUser(newInfo);	
                    this.getServletContext().getRequestDispatcher("/Home").forward(request, response);
                }
            } catch (Exception e) {

                e.printStackTrace();
            }
            
            System.out.println("gnooooooooooooooooooooooooooooooooooooooo");
            
            
            // Rediriger vers une page de confirmation ou autre
            response.sendRedirect("http://localhost:8080/PainCare/EditUser");
		  } catch (Exception e) {
	            // Gérer les erreurs
	            e.printStackTrace();
	            System.out.println("taille de l'image   nooooooooooooooooooooooooooooooooooooooo");

	            response.sendRedirect("http://localhost:8080/PainCare/EditUser");
	        }
		}

}
