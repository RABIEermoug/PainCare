package paincare.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import paincare.dao.DAOException;
import paincare.dao.DAOFactory;
import paincare.dao.UserDao;
import paincare.entities.UserEntity;

public class UserDaoImp implements UserDao {
	
		private DAOFactory daoFactory;

	    public UserDaoImp(DAOFactory daoFactory) {

	        this.daoFactory = daoFactory;
	    }

	    private static UserEntity map( ResultSet resultSet ) throws SQLException {
	        UserEntity userEntity = new UserEntity();

	        userEntity.setIdUser(resultSet.getInt("iduser"));
	        userEntity.setName(resultSet.getString("name"));
	        userEntity.setEmail(resultSet.getString("email"));
	        userEntity.setPassword(resultSet.getString("password"));
	        userEntity.setDateTime(resultSet.getTimestamp("date_time"));
	        //System.out.println(userEntity);
	        return userEntity;
	    }
	    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
	        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
	        for ( int i = 0; i < objets.length; i++ ) {
	            preparedStatement.setObject( i + 1, objets[i] );
	        }
	        return preparedStatement;
	    }
	    
		@Override
		public void addUser(UserEntity user) {
			// TODO Auto-generated method stub
			  Connection connection = null;
		        PreparedStatement preparedStatement = null;

		        try {
		            // Récupérer une connexion depuis la DAOFactory
		            connection = daoFactory.getConnection();

		            // Requête SQL d'insertion
		            String sql = "INSERT INTO user (name , email, password, date_time ) " + "VALUES ( ?, ?, ?, ?)";

		            // Préparer la requête avec les valeurs de l'utilisateur
		            preparedStatement = connection.prepareStatement(sql);
		            preparedStatement.setString(1, user.getName());
		            preparedStatement.setString(2, user.getEmail());
		            preparedStatement.setString(3, user.getPassword());
		            preparedStatement.setTimestamp(4, user.getDateTime());
System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
		            // Exécuter la requête
		            preparedStatement.executeUpdate();
		        } catch (SQLException e) {
		            // Gérer les exceptions liées à la base de données
		            e.printStackTrace(); // Vous pouvez remplacer cela par une gestion plus appropriée des exceptions
		        } finally {
		            // Fermer les ressources
		            ResultSet resultSet = null;
		            closeResources(preparedStatement, connection);
		        }
		}
		private void closeResources(PreparedStatement preparedStatement, Connection connection) {
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
		public UserEntity getUserById(int userId) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public ArrayList<UserEntity> getAllUsers() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public void updateUser(UserEntity user) {
			// TODO Auto-generated method stub
			 Connection connection = null;
			    PreparedStatement preparedStatement = null;

			    try {
			        // Récupérer une connexion depuis la DAOFactory
			        connection = daoFactory.getConnection();

			        // Requête SQL de mise à jour
			        String sql = "UPDATE user SET name=?, email=?, password=?, date_time=? WHERE user_id=?";

			        // Préparer la requête avec les valeurs de l'utilisateur
			        preparedStatement = connection.prepareStatement(sql);
			        preparedStatement.setString(1, user.getName());
			        preparedStatement.setString(2, user.getEmail());
			        preparedStatement.setString(3, user.getPassword());
			        preparedStatement.setTimestamp(4, user.getDateTime());
			        preparedStatement.setLong(5, user.getIdUser()); // Assurez-vous d'avoir un identifiant utilisateur pour savoir quel utilisateur mettre à jour

			        // Exécuter la requête de mise à jour
			        preparedStatement.executeUpdate();
			    } catch (SQLException e) {
			        // Gérer les exceptions liées à la base de données
			        e.printStackTrace(); // Vous pouvez remplacer cela par une gestion plus appropriée des exceptions
			    } finally {
			        // Fermer les ressources
			        closeResources(preparedStatement, connection);
			    }
		}
		
	    private static final String SQL_DELETE_USER = "DELETE FROM user WHERE iduser = ?";
		@Override
		public void deleteUser(Long userId) {
			// TODO Auto-generated method stub
			  Connection connection = null;
		        PreparedStatement preparedStatement = null;

		        try {
		            connection = daoFactory.getConnection();
		            preparedStatement = connection.prepareStatement(SQL_DELETE_USER);
		            preparedStatement.setLong(1, userId);

		            preparedStatement.executeUpdate();
		        } catch (SQLException e) {
		            throw new DAOException("Error deleting user with ID: " + userId, e);
		        } finally {
		            closeResources(preparedStatement, connection);
		        }
		}

		@Override
		public UserEntity isValidUser(String email, String password) throws SQLException {
			// TODO Auto-generated method stub
			  Connection connection = null;
		        PreparedStatement preparedStatement = null;
		        UserEntity userEntity = null;
		        ResultSet resultSet = null;
		        try {
		            // Récupérer une connexion depuis la DAOFactory
		            connection = daoFactory.getConnection();

		            String sql = "SELECT * FROM user WHERE email = ? and password= ? ";
		            preparedStatement = connection.prepareStatement(sql);

		            preparedStatement.setString(1, email);
		            preparedStatement.setString(2, password);
		            resultSet = preparedStatement.executeQuery();
		            if (resultSet.next()) {
		                userEntity = map(resultSet);
		            }
		        } catch (SQLException e) {
		            throw new DAOException(e);
		        }
		        return userEntity;
		}

		@Override
		public boolean isExist(String email) throws SQLException {
			// TODO Auto-generated method stub
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;

	        boolean exist = true;
	        // Récupérer une connexion depuis la DAOFactory
	        connection = daoFactory.getConnection();

	        String sql = "SELECT iduser FROM user WHERE email = ? ";
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, email);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        exist = resultSet.next() ? true : false ;
	        preparedStatement.close();

	        return exist ;
	        }
	    
	    
}
