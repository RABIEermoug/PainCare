package paincare.servlets.painreport;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import paincare.dao.BlogDao;
import paincare.dao.CommentaireDao;
import paincare.dao.DAOFactory;
import paincare.dao.PainReportDao;
import paincare.dao.imp.BlogDaoImp;
import paincare.dao.imp.CommentaireDaoImp;
import paincare.dao.imp.PainReportDaoImp;
import paincare.entities.PainReportEntity;
import paincare.entities.UserEntity;

import java.io.IOException;

/**
 * Servlet implementation class ProcessPainReportServlet
 */
public class ProcessPainReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcessPainReportServlet() {
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
		request.setAttribute("user", sessionUser);
		  // Récupérer les valeurs du formulaire
        int painLevel = Integer.parseInt(request.getParameter("pain_level"));
        String[] painLocations = request.getParameterValues("pain_location");
        String[] symptoms = request.getParameterValues("symptoms");
        String[] worsePain = request.getParameterValues("worse_pain");
        String[] feelings = request.getParameterValues("feelings");

        // Construire une chaîne unique pour chaque tableau de valeurs
        String painLocationsStr = (painLocations != null) ? String.join(", ", painLocations) : null;
        String symptomsStr = (symptoms != null) ? String.join(", ", symptoms) : null;
        String worsePainStr = (worsePain != null) ? String.join(", ", worsePain) : null;
        String feelingsStr = (feelings != null) ? String.join(", ", feelings) : null;
        
        // Créer une instance de PainReportEntity avec les valeurs du formulaire
        PainReportEntity painReport = new PainReportEntity();
        painReport.setUserId(sessionUser.getIdUser());
        painReport.setPainLevel(painLevel);
        painReport.setPainLocation(painLocationsStr);
        painReport.setSymptoms(symptomsStr);
        painReport.setWorsePain(worsePainStr);
        painReport.setFeelings(feelingsStr);
        painReport.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));


        painreportDao.addPainReport(painReport);

        // Rediriger vers une page de confirmation ou une autre page appropriée
        response.sendRedirect("http://localhost:8080/PainCare/EvolutionPain");
        
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
