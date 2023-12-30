package com.lms.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lms.entity.Userrole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
* @author JIALIANGLI
* @description 针对表【userrole】的数据库操作Mapper
* @createDate 2023-11-22 14:55:37
* @Entity com.lms.entity.Userrole
*/
public interface UserroleMapper extends BaseMapper<Userrole> {

    int addSelective(Userrole userrole);

    List<Userrole> selectByUserid(@Param("userid") Integer userid);

    int deleteByUserid(@Param("userid") Integer userid);

    @Override
    List<Userrole> selectByMap(Map<String, Object> columnMap);

    int updateSelective(Userrole userrole);

}




