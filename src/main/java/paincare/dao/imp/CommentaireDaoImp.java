package paincare.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import paincare.dao.CommentaireDao;
import paincare.dao.DAOException;
import paincare.dao.DAOFactory;
import paincare.entities.CommentaireEntity;

public class CommentaireDaoImp implements CommentaireDao {

		    private DAOFactory daoFactory;
		
		    public CommentaireDaoImp(DAOFactory daoFactory) {
		        this.daoFactory = daoFactory;
		    }
		
		    public static CommentaireEntity map(ResultSet resultSet) throws SQLException {
		        CommentaireEntity commentaire = new CommentaireEntity();
		        commentaire.setId(resultSet.getInt("id"));
		        commentaire.setUser_id(resultSet.getInt("user_id"));
		        commentaire.setBlog_id(resultSet.getInt("blog_id"));
		        commentaire.setContent(resultSet.getString("content"));
		        commentaire.setDate(resultSet.getTimestamp("date"));
				
		        // Nouvelle propriété pour le nom de l'utilisateur
		        commentaire.setUserName(resultSet.getString("user_name"));
		     
		        
		        return commentaire;
		    }
		
		
		    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
		        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
		        for ( int i = 0; i < objets.length; i++ ) {
		            preparedStatement.setObject( i + 1, objets[i] );
		        }
		        return preparedStatement;
		    }
		
		    @Override
		    public void create(CommentaireEntity commentaire) {
		        Connection connection = null;
		        PreparedStatement preparedStatement = null;
		
		        try {
		            connection = daoFactory.getConnection();
		            String sql = "INSERT INTO commentaire (user_id, blog_id, content, date) VALUES (?, ?, ?, ?)";
		            preparedStatement = connection.prepareStatement(sql);
		
		            preparedStatement.setInt(1, commentaire.getUser_id());
		            preparedStatement.setInt(2, commentaire.getBlog_id());
		            preparedStatement.setString(3, commentaire.getContent());
		            preparedStatement.setTimestamp(4, commentaire.getDate());
		
		            preparedStatement.executeUpdate();
		        } catch (SQLException e) {
		            throw new DAOException("Error adding data to the database", e);
		        } finally {
		            closeResources(null, preparedStatement, connection);
		        }
		    }
		
		    @Override
		    public List<CommentaireEntity> getAllCommentsByBlogId(int blogId) {
		    	Connection connection = null;
		        PreparedStatement preparedStatement = null;
		        ResultSet resultSet = null;

		        List<CommentaireEntity> commentaires = new ArrayList<>();

		        try {
		            connection = daoFactory.getConnection();
		            String sql = "SELECT c.*, u.name AS user_name FROM commentaire c " +
		                         "JOIN user u ON c.user_id = u.iduser " +
		                         "WHERE blog_id=?";
		            preparedStatement = initRequestPrepare(connection, sql, blogId);
		            resultSet = preparedStatement.executeQuery();

		            while (resultSet.next()) {
		                CommentaireEntity commentaire = map(resultSet);
		                commentaire.setUserName(resultSet.getString("user_name"));
		                commentaires.add(commentaire);
		            }
		        } catch (SQLException e) {
		            throw new DAOException("Error fetching data from the database", e);
		        } finally {
		            closeResources(resultSet, preparedStatement, connection);
		        }

		        return commentaires;
		    }
		
		    @Override
		    public void update(CommentaireEntity commentaire) {
		        Connection connection = null;
		        PreparedStatement preparedStatement = null;
		
		        try {
		            connection = daoFactory.getConnection();
		            String sql = "UPDATE commentaire SET user_id=?, blog_id=?, content=?, date=? WHERE id=?";
		            preparedStatement = initRequestPrepare(connection, sql, commentaire.getUser_id(), commentaire.getBlog_id(),
		                    commentaire.getContent(), commentaire.getDate(), commentaire.getId());
		
		            preparedStatement.executeUpdate();
		        } catch (SQLException e) {
		            throw new DAOException("Error updating data in the database", e);
		        } finally {
		            closeResources(null, preparedStatement, connection);
		        }
		    }
		
		    @Override
		    public void delete(int id) {
		        Connection connection = null;
		        PreparedStatement preparedStatement = null;
		
		        try {
		            connection = daoFactory.getConnection();
		            String sql = "DELETE FROM commentaire WHERE id=?";
		            preparedStatement = initRequestPrepare(connection, sql, id);
		
		            preparedStatement.executeUpdate();
		        } catch (SQLException e) {
		            throw new DAOException("Error deleting data from the database", e);
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
			
}
