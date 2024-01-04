package paincare.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import paincare.dao.DAOFactory;
import paincare.dao.UserDao;
import paincare.dao.imp.UserDaoImp;
import paincare.entities.UserEntity;

import java.io.IOException;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=request.getServletPath();
        if (path.equals("/Signup")) {
            request.getRequestDispatcher("/SignUp.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  // Récupérer les données du formulaire
        String nom = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dateTimeStr = request.getParameter("dateTime");

        // Créer un objet UserEntity avec les données du formulaire
        UserEntity userEntity = new UserEntity();
        userEntity.setName(nom);
        userEntity.setEmail(email);
        userEntity.setPassword(password);
        userEntity.setDateTime(new java.sql.Timestamp(System.currentTimeMillis()));

        // Ajouter l'utilisateur à la base de données
        UserDao userDAO = new UserDaoImp(DAOFactory.getInstance()); // Remplacez DAOFactory.getInstance() par votre méthode pour obtenir une instance de DAOFactory
        try {
            boolean isExist = userDAO.isExist(email);
            if (isExist) {
                String message = "Cet email est déjà utilisé.Essayer un autre";
                request.setAttribute("message", message);
                this.getServletContext().getRequestDispatcher("/SignUp.jsp").forward(request, response);

            } else {
                userDAO.addUser(userEntity);
                this.getServletContext().getRequestDispatcher("/authuser.jsp").forward(request, response);

            }
        } catch (Exception e) {

            e.printStackTrace();
        }
       
	}

}
