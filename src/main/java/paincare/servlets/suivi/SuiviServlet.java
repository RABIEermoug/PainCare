package paincare.servlets.suivi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/SuiviServlet")

public class SuiviServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String levelOfPain = request.getParameter("levelOfPain");
		// Retrieve checkbox values using getParameterValues
		String[] strongestPainLocations = request.getParameterValues("strongest");
		String[] symptoms = request.getParameterValues("prefer");
		String[] factorsWorseningPain = request.getParameterValues("work");
		String[] feelings = request.getParameterValues("size");

		// Set attributes in the request
		request.setAttribute("levelOfPain", levelOfPain);
		request.setAttribute("strongest", strongestPainLocations);
		request.setAttribute("prefer", symptoms);
		request.setAttribute("work", factorsWorseningPain);
		request.setAttribute("size", feelings);


       
        System.out.println("Level of Pain: " + levelOfPain);
        System.out.println("Strongest Pain Locations: " + arrayToString(strongestPainLocations));
        System.out.println("Symptoms: " + arrayToString(symptoms));
        System.out.println("Factors Worsening Pain: " + arrayToString(factorsWorseningPain));
        System.out.println("Feelings: " + arrayToString(feelings));

        request.getRequestDispatcher("/evolution.jsp").forward(request, response);
    }

    private String arrayToString(String[] array) {
        return (array != null) ? String.join(", ", array) : "";
    }
	        
}
