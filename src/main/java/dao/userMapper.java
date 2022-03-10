package dao;

import pojo.User;

import java.util.List;

public interface userMapper {
    List<User> queryAllUser();
    int addUser(User user);
    int deleteUserById(int id);
    int updateUser(User user);
    User queryUserById(int id);
}
