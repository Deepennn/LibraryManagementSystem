package com.lms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lms.entity.Userrole;
import com.lms.service.UserroleService;
import com.lms.mapper.UserroleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【userrole】的数据库操作Service实现
* @createDate 2023-11-22 14:55:37
*/
@Service
public class UserroleServiceImpl extends ServiceImpl<UserroleMapper, Userrole>
    implements UserroleService{

    @Autowired
    UserroleMapper mapper;

    @Override
    public int addSelective(Userrole userrole) {
        return mapper.addSelective(userrole);
    }

    @Override
    public List<Userrole> selectByUserid(Integer userid) {
        return mapper.selectByUserid(userid);
    }

    @Override
    public int deleteByUserid(Integer userid) {
        return mapper.deleteByUserid(userid);
    }

    @Override
    public List<Userrole> selectByMap(Map<String, Object> columnMap) {
        return mapper.selectByMap(columnMap);
    }

    @Override
    public int updateSelective(Userrole userrole) {
        return mapper.updateSelective(userrole);
    }

}




