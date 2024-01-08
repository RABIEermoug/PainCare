package paincare.servlets.Blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import paincare.dao.BlogDao;
import paincare.dao.DAOFactory;
import paincare.dao.imp.BlogDaoImp;
import paincare.entities.BlogEntity;
import paincare.entities.UserEntity;

import java.io.IOException;
import java.io.InputStream;

/**
 * Servlet implementation class BlogServlet
 */
@MultipartConfig(maxFileSize = 1617721500) // Taille maximale de la photo (en octets)

public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    private BlogDao blogDao;
    
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.blogDao = new BlogDaoImp(daoFactory);
        
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	HttpSession session = request.getSession();
		
		UserEntity sessionUser = (UserEntity) session.getAttribute("sessionuser");
		
		request.setAttribute("user", sessionUser);
		request.getRequestDispatcher("/addBlog.jsp").forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
					try {
						HttpSession session = request.getSession();
						
						UserEntity sessionUser = (UserEntity) session.getAttribute("sessionuser");
					
			            // Récupérer les paramètres du formulaire
			            String title = request.getParameter("title");
			            String description = request.getParameter("description");
			            
			            // Récupérer le fichier image
			            Part imagePart = request.getPart("image");
			            InputStream imageInputStream = imagePart.getInputStream();
			
			            // Créer un objet BlogEntity avec les données du formulaire
			            BlogEntity newBlog = new BlogEntity();
			            newBlog.setUser_id(sessionUser.getIdUser());
			            newBlog.setTitle(title);
			            newBlog.setDescription(description);
			            // Convertir l'InputStream de l'image en tableau d'octets (byte[])
			            byte[] imageBytes = imageInputStream.readAllBytes();
			            newBlog.setImage(imageBytes);
			            newBlog.setDate(new java.sql.Timestamp(System.currentTimeMillis()));
			
			            // Appeler la méthode create de BlogDao pour ajouter le blog à la base de données
			            blogDao.create(newBlog);
			            System.out.println("bien faite goooooooooooooooooooooooooood");
			            // Rediriger vers une page de confirmation ou autre
			            response.sendRedirect("http://localhost:8080/PainCare/AllBlogs");
			
			        } catch (Exception e) {
			            // Gérer les erreurs
			            e.printStackTrace();
			            System.out.println("rencontre un problemé dans l'enregitrement  nooooooooooooooooooooooooooooooooooooooo");
			            System.out.println("taille de l'image   nooooooooooooooooooooooooooooooooooooooo");

			            response.sendRedirect("addBlog.jsp");
			        }
				}

}
