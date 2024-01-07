package paincare.servlets.Blog;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import paincare.dao.BlogDao;
import paincare.dao.CommentaireDao;
import paincare.dao.imp.CommentaireDaoImp;
import paincare.dao.DAOException; 
import paincare.dao.DAOFactory;
import paincare.dao.imp.BlogDaoImp;
import paincare.entities.BlogEntity;
import paincare.entities.CommentaireEntity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class AllBlogsServlet
 */
public class AllBlogsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBlogsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private BlogDao blogDao;
    private CommentaireDao commentaireDao;
    
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.blogDao = new BlogDaoImp(daoFactory);
        this.commentaireDao = new CommentaireDaoImp(daoFactory);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  try {
		 // Récupérer la liste de tous les blogs avec leurs utilisateurs
        List<BlogEntity> blogs = blogDao.getAllBlogs();

        // Récupérer la liste de tous les commentaires pour chaque blog avec leurs utilisateurs
        List<CommentaireEntity> allCommentaires = new ArrayList<>();

        for (BlogEntity blog : blogs) {
            int blogId = blog.getId();
            List<CommentaireEntity> commentaires = commentaireDao.getAllCommentsByBlogId(blogId);
            allCommentaires.addAll(commentaires);
        }

	        // Ajouter les listes à la requête pour les utiliser dans la JSP
	        request.setAttribute("blogs", blogs);
	        request.setAttribute("commentaires", allCommentaires);

            RequestDispatcher dispatcher = request.getRequestDispatcher("allBlogs.jsp");
            dispatcher.forward(request, response);
        } catch (DAOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la récupération des blogs.");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
