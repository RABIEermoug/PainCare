package paincare.servlets.Blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import paincare.dao.CommentaireDao;
import paincare.dao.DAOFactory;
import paincare.dao.imp.CommentaireDaoImp;
import paincare.entities.CommentaireEntity;
import paincare.entities.UserEntity;

import java.io.IOException;

/**
 * Servlet implementation class DeleteCommentaireServlet
 */
public class DeleteCommentaireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommentaireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
  private CommentaireDao commentaireDao;
    
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.commentaireDao = new CommentaireDaoImp(daoFactory);
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

			HttpSession session = request.getSession();
		
						UserEntity sessionUser = (UserEntity) session.getAttribute("sessionuser");
						try {
						 // Récupérer les paramètres du formulaire
						String commentid = request.getParameter("commentid");
				        
				     // Créer un objet CommentaireEntity avec les données du formulaire
				        CommentaireEntity newCommentaire = new CommentaireEntity();
				        newCommentaire.setId(Integer.parseInt(commentid));
			        
				        commentaireDao.delete(newCommentaire.getId());
				        
				        // Rediriger vers une page de confirmation ou autre
				        response.sendRedirect("http://localhost:8080/PainCare/AllBlogs");
					  } catch (Exception e) {
				          // Gérer les erreurs
				          e.printStackTrace();
				          System.out.println("error adding comment gggggggggg");
				         
				          response.sendRedirect("http://localhost:8080/PainCare/AllBlogs");
				          
					  }
			}

}
