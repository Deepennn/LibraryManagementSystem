package com.lms.service;

import com.lms.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author JIALIANGLI
* @description 针对表【role】的数据库操作Service
* @createDate 2023-11-20 10:12:26
*/
public interface RoleService extends IService<Role> {

    List<Role> selectByRoleid(@Param("roleid") Integer roleid);

}
