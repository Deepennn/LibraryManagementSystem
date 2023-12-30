package com.lms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lms.service.UserService;
import com.lms.entity.User;
import com.lms.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【user】的数据库操作Service实现
* @createDate 2023-11-19 16:26:11
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService {

    @Autowired
    UserMapper mapper;

    @Override
    public int addSelective(User user) {
        return mapper.addSelective(user);
    }

    @Override
    public int addBatch(Collection<User> userCollection) {
        return mapper.addBatch(userCollection);
    }

    @Override
    public List<User> selectByUsername(String username) {
        return mapper.selectByUsername(username);
    }

    @Override
    public List<User> selectByMap(Map<String, Object> map) {
        return mapper.selectByMap(map);
    }

    @Override
    public int deleteByUserid(Integer userid) {
        return mapper.deleteByUserid(userid);
    }

    @Override
    public List<User> selectByUserid(Integer userid) {
        return mapper.selectByUserid(userid);
    }

    @Override
    public int updateSelective(User user) {
        return mapper.updateSelective(user);
    }

}




