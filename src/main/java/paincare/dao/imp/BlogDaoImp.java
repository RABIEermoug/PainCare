package paincare.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import paincare.dao.BlogDao;
import paincare.dao.DAOException;
import paincare.dao.DAOFactory;
import paincare.entities.BlogEntity;

public class BlogDaoImp implements BlogDao {
	
	 private DAOFactory daoFactory;

	    public BlogDaoImp(DAOFactory daoFactory) {
	        this.daoFactory = daoFactory;
	    }
	    private static BlogEntity map(ResultSet resultSet) throws SQLException {
	        BlogEntity blog = new BlogEntity();
	        blog.setId(resultSet.getInt("id"));
	        blog.setUser_id(resultSet.getInt("user_id"));
	        blog.setTitle(resultSet.getString("titre"));
	        blog.setDescription(resultSet.getString("description"));
	        blog.setImage(resultSet.getBytes("image"));    
	        blog.setDate(resultSet.getTimestamp("timestamp"));

	        return blog;
	    }
	    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
	        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
	        for ( int i = 0; i < objets.length; i++ ) {
	            preparedStatement.setObject( i + 1, objets[i] );
	        }
	        return preparedStatement;
	    }

	@Override
	public void create(BlogEntity blog) {
		// TODO Auto-generated method stub
		 Connection connection = null;
	        PreparedStatement preparedStatement = null;

	        try {
	            connection = daoFactory.getConnection();
	            String sql = "INSERT INTO blog (user_id, title, description, image, date) VALUES (?, ?, ?, ?, ?)";
	            preparedStatement = connection.prepareStatement(sql);

	            preparedStatement.setInt(1, blog.getUser_id());
	            preparedStatement.setString(2, blog.getTitle());
	            preparedStatement.setString(3, blog.getDescription());
	            preparedStatement.setBytes(4, blog.getImage());
	            preparedStatement.setTimestamp(5, blog.getDate());

	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            throw new DAOException("Error adding data to the database", e);
	        } finally {
	            ResultSet resultSet = null;
	            closeResources(resultSet, preparedStatement, connection);
	        }
	}

	@Override
	public List<BlogEntity> getAllBlogs() {
		// TODO Auto-generated method stub
		 Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;

		    List<BlogEntity> blogs = new ArrayList<>();

		    try {
		        connection = daoFactory.getConnection();
		        String sql = "SELECT * FROM blog";
		        preparedStatement = connection.prepareStatement(sql);
		        resultSet = preparedStatement.executeQuery();

		        while (resultSet.next()) {
		            blogs.add(map(resultSet));
		        }
		    } catch (SQLException e) {
		        throw new DAOException("Error retrieving blogs from the database", e);
		    } finally {
		        closeResources(resultSet, preparedStatement, connection);
		    }

		    return blogs;
	}

	@Override
	public void update(BlogEntity blog) {
		// TODO Auto-generated method stub
		Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = daoFactory.getConnection();
	        String sql = "UPDATE blog SET user_id=?, title=?, description=?, image=?, date=? WHERE id=?";
	        preparedStatement = initRequestPrepare(connection, sql, blog.getUser_id(), blog.getTitle(), blog.getDescription(), blog.getImage(), blog.getDate(), blog.getId());

	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        throw new DAOException("Error updating blog in the database", e);
	    } finally {
	        closeResources(null, preparedStatement, connection);
	    }
	}

	@Override
	public void delete(Long Id) {
		// TODO Auto-generated method stub
		 Connection connection = null;
		    PreparedStatement preparedStatement = null;

		    try {
		        connection = daoFactory.getConnection();
		        String sql = "DELETE FROM blog WHERE id=?";
		        preparedStatement = initRequestPrepare(connection, sql, Id);

		        preparedStatement.executeUpdate();
		    } catch (SQLException e) {
		        throw new DAOException("Error deleting blog from the database", e);
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
