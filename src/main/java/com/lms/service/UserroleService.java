package com.lms.service;

import com.lms.entity.Userrole;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【userrole】的数据库操作Service
* @createDate 2023-11-22 14:55:37
*/
public interface UserroleService extends IService<Userrole> {

    int addSelective(Userrole userrole);

    List<Userrole> selectByUserid(@Param("userid") Integer userid);

    int deleteByUserid(@Param("userid") Integer userid);

    List<Userrole> selectByMap(Map<String, Object> columnMap);

    int updateSelective(Userrole userrole);

}
