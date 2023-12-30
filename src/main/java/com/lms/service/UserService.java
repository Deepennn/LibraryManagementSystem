package com.lms.service;

import com.lms.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.lms.mapper.UserMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【user】的数据库操作Service
* @createDate 2023-11-19 16:26:11
*/
public interface UserService extends IService<User> {

    int addSelective(User user);

    int addBatch(@Param("userCollection") Collection<User> userCollection);

    List<User> selectByUsername(@Param("username") String username);

    List<User> selectByMap(@Param("map") Map<String, Object> map);

    int deleteByUserid(@Param("userid") Integer userid);

    List<User> selectByUserid(@Param("userid") Integer userid);

    int updateSelective(User user);

}
