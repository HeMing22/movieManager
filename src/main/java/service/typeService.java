package service;

import pojo.Movie;
import pojo.Type;

import java.util.List;

public interface typeService {
    int addType(Type type);
    int deleteTypeById(int id);
    int updateType(Type type);
    Type queryTypeById(int id);
    List<Type> getAllType();
}
