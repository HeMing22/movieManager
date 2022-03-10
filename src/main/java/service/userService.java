package service;

import pojo.User;
import java.util.List;
import java.util.Map;

public interface userService {
    List<User> queryAllUser();
    int addUser(User user);
    int deleteUserById(int id);
    int updateUser(User user);
    User queryUserById(int id);
}
