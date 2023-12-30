package com.lms.mapper;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.lms.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
* @author JIALIANGLI
* @description 针对表【user】的数据库操作Mapper
* @createDate 2023-11-19 16:26:11
* @Entity com.lms.entity.User
*/
public interface UserMapper extends BaseMapper<User> {

    int addSelective(User user);

    int addBatch(@Param("userCollection") Collection<User> userCollection);

    List<User> selectByUsername(@Param("username") String username);

    List<User> selectByMap(@Param("map")Map<String, Object> map);
//    @Override
//    List<User> selectByMap(Map<String, Object> columnMap);

    int deleteByUserid(@Param("userid") Integer userid);

    List<User> selectByUserid(@Param("userid") Integer userid);

    int updateSelective(User user);

}




