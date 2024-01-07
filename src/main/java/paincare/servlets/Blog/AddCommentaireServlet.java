package paincare.servlets.Blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import paincare.dao.BlogDao;
import paincare.dao.CommentaireDao;
import paincare.dao.DAOFactory;
import paincare.dao.imp.BlogDaoImp;
import paincare.dao.imp.CommentaireDaoImp;
import paincare.entities.BlogEntity;
import paincare.entities.CommentaireEntity;
import paincare.entities.UserEntity;

import java.io.IOException;

/**
 * Servlet implementation class AddCommentaireServlet
 */
public class AddCommentaireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommentaireServlet() {
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
		String blogid = request.getParameter("blogid");
        String content = request.getParameter("commentaire_saisie");
        
     // Créer un objet CommentaireEntity avec les données du formulaire
        CommentaireEntity newCommentaire = new CommentaireEntity();
        newCommentaire.setUser_id(sessionUser.getIdUser());
        newCommentaire.setBlog_id(Integer.parseInt(blogid));
        newCommentaire.setContent(content);
        newCommentaire.setDate(new java.sql.Timestamp(System.currentTimeMillis()));
        
        commentaireDao.create(newCommentaire);
        
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
