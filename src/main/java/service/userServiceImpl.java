package service;

import dao.userMapper;
import pojo.User;

import java.util.List;

public class userServiceImpl implements userService{
    private userMapper userMapper;
    public void setUserMapper(userMapper userMapper) {
        this.userMapper = userMapper;
    }
    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int deleteUserById(int id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

}
