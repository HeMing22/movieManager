package service;

import dao.typeMapper;
import pojo.Type;
import java.util.List;

public class typeServiceImpl implements typeService{

    private typeMapper typeMapper;
    public void setTypeMapper(dao.typeMapper typeMapper) {
        this.typeMapper = typeMapper;
    }

    @Override
    public int addType(Type type) {
        return typeMapper.addType(type);
    }

    @Override
    public int deleteTypeById(int id) {
        return typeMapper.deleteTypeById(id);
    }

    @Override
    public int updateType(Type type) {
        return typeMapper.updateType(type);
    }

    @Override
    public Type queryTypeById(int id) {
        return typeMapper.queryTypeById(id);
    }

    @Override
    public List<Type> getAllType() {
        return typeMapper.getAllType();
    }
}
