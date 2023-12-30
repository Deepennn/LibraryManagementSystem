package com.lms.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.lms.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
* @author JIALIANGLI
* @description 针对表【role】的数据库操作Mapper
* @createDate 2023-11-20 10:12:26
* @Entity com.lms.entity.Role
*/
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> selectByRoleid(@Param("roleid") Integer roleid);

}




