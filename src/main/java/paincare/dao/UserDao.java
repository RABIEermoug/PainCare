package paincare.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import paincare.entities.UserEntity;

public interface UserDao {
    void addUser(UserEntity user);
    UserEntity getUserById(int userId);
    ArrayList<UserEntity> getAllUsers();
    void updateUser(UserEntity user);
    void deleteUser(Long userId);
    UserEntity isValidUser(String email, String password) throws SQLException;
    public boolean isExist(String email) throws SQLException;
}
