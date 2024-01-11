package paincare.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import paincare.dao.DAOException;
import paincare.dao.DAOFactory;
import paincare.dao.PainReportDao;
import paincare.entities.PainReportEntity;

public class PainReportDaoImp implements PainReportDao {

	 private DAOFactory daoFactory;

	    public PainReportDaoImp(DAOFactory daoFactory) {
	        this.daoFactory = daoFactory;
	    }
	    public static PainReportEntity map(ResultSet resultSet) throws SQLException {
	    	PainReportEntity painReport = new PainReportEntity();
	        painReport.setId(resultSet.getInt("id"));
	        painReport.setUserId(resultSet.getInt("user_id"));
	        painReport.setPainLevel(resultSet.getInt("pain_level"));
	        painReport.setPainLocation(resultSet.getString("pain_location"));
	        painReport.setSymptoms(resultSet.getString("symptoms"));
	        painReport.setWorsePain(resultSet.getString("worse_pain"));
	        painReport.setFeelings(resultSet.getString("feelings"));
	        painReport.setCreatedAt(resultSet.getTimestamp("created_at"));

	        return painReport;
	    }
	    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
	        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
	        for ( int i = 0; i < objets.length; i++ ) {
	            preparedStatement.setObject( i + 1, objets[i] );
	        }
	        return preparedStatement;
	    }
	    
	@Override
	public void addPainReport(PainReportEntity painReport) {
		// TODO Auto-generated method stub
		  Connection connection = null;
		    PreparedStatement preparedStatement = null;

		    try {
		        connection = daoFactory.getConnection();
		        String sql = "INSERT INTO pain_report (user_id, pain_level, pain_location, symptoms, worse_pain, feelings, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
		        preparedStatement = connection.prepareStatement(sql);

		        preparedStatement.setInt(1, painReport.getUserId());
		        preparedStatement.setInt(2, painReport.getPainLevel());
		        preparedStatement.setString(3, painReport.getPainLocation());
		        preparedStatement.setString(4, painReport.getSymptoms());
		        preparedStatement.setString(5, painReport.getWorsePain());
		        preparedStatement.setString(6, painReport.getFeelings());
		        preparedStatement.setTimestamp(7, painReport.getCreatedAt());

		        preparedStatement.executeUpdate();
		    } catch (SQLException e) {
		        throw new DAOException("Error adding pain report to the database", e);
		    } finally {
		    	closeResources(null, preparedStatement, connection);
		    }
	}
	// Méthode utilitaire pour fermer les ressources JDBC
    private void closeResources(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Gérer les exceptions liées à la fermeture des ressources
        }
    }
	@Override
	public List<PainReportEntity> getPainReportsByUserId(int userId) {
		// TODO Auto-generated method stub
		  List<PainReportEntity> painReports = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = daoFactory.getConnection();
	            String sql = "SELECT * FROM pain_report WHERE user_id = ? ORDER BY created_at DESC LIMIT 10";
	            preparedStatement = initRequestPrepare(connection, sql, userId);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	                PainReportEntity painReport = map(resultSet);
	                painReports.add(painReport);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Gérer l'exception correctement (journalisation, etc.)
	        } finally {
	            closeResources(resultSet, preparedStatement, connection);
	        }

	        return painReports;
	}

}
