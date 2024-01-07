package paincare.servlets.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import paincare.dao.DAOFactory;
import paincare.dao.UserDao;
import paincare.dao.imp.UserDaoImp;
import paincare.entities.BlogEntity;
import paincare.entities.UserEntity;

import java.io.IOException;
import java.io.InputStream;

/**
 * Servlet implementation class EditImageServlet
 */
@MultipartConfig(maxFileSize = 1617721500) // Taille maximale de la photo (en octets)
public class EditImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditImageServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			
			UserEntity sessionUser = (UserEntity) session.getAttribute("sessionuser");
			
			  // Récupérer le fichier image
            Part imagePart = request.getPart("image");
            InputStream imageInputStream = imagePart.getInputStream();
            // Créer un objet BlogEntity avec les données du formulaire
            UserEntity newImage = new UserEntity();
			
            // Convertir l'InputStream de l'image en tableau d'octets (byte[])
            byte[] imageBytes = imageInputStream.readAllBytes();
            newImage.setImage(imageBytes);
            newImage.setIdUser(sessionUser.getIdUser());
            
            userDao.updateImageUser(newImage);	
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
