package com.lms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lms.entity.Role;
import com.lms.service.RoleService;
import com.lms.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author JIALIANGLI
* @description 针对表【role】的数据库操作Service实现
* @createDate 2023-11-20 10:12:26
*/
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role>
    implements RoleService{

    @Autowired
    RoleMapper mapper;

    @Override
    public List<Role> selectByRoleid(Integer roleid) {
        return mapper.selectByRoleid(roleid);
    }

}




