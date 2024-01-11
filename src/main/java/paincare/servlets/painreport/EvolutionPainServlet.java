package paincare.servlets.painreport;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import paincare.dao.DAOFactory;
import paincare.dao.PainReportDao;
import paincare.dao.imp.PainReportDaoImp;
import paincare.entities.PainReportEntity;
import paincare.entities.UserEntity;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import com.google.gson.Gson;
/**
 * Servlet implementation class EvolutionPainServlet
 */
public class EvolutionPainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvolutionPainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	   private PainReportDao painreportDao;
	    
	    public void init() throws ServletException {
	        DAOFactory daoFactory = DAOFactory.getInstance();
	        this.painreportDao = new PainReportDaoImp(daoFactory);
	    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		UserEntity sessionUser = (UserEntity) session.getAttribute("sessionuser");

	    int userId = sessionUser.getIdUser();
		request.setAttribute("user", sessionUser);
	        
		 try {
	            // Supposons que vous avez une classe PainReportDao pour accéder aux données de la base de données
	            List<PainReportEntity> painReports = painreportDao.getPainReportsByUserId(userId); // Remplacez 1 par l'ID de l'utilisateur actuel

	            // Convertissez les données en format JSON
	            String jsonData = new Gson().toJson(painReports);

	            // Placez les données dans la session ou la requête
	            request.setAttribute("jsonData", jsonData);

	            System.out.println(jsonData);
	            // Redirigez vers la page JSP
	            request.getRequestDispatcher("evolution_pain.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la récupération des données");
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
