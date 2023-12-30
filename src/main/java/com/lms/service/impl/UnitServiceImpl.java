package com.lms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lms.service.UnitService;
import com.lms.entity.Unit;
import com.lms.mapper.UnitMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【unit】的数据库操作Service实现
* @createDate 2023-11-19 16:07:41
*/
@Service
public class UnitServiceImpl extends ServiceImpl<UnitMapper, Unit>
    implements UnitService {

    @Autowired
    UnitMapper mapper;

    @Override
    public List<Unit> selectByMap(Map<String, Object> columnMap) {
        return mapper.selectByMap(columnMap);
    }

    @Override
    public List<Unit> selectByUnitid(Integer unitid) {
        return mapper.selectByUnitid(unitid);
    }

    @Override
    public List<Unit> selectByUnitname(String unitname) {
        return mapper.selectByUnitname(unitname);
    }

    @Override
    public int addSelective(Unit unit) {
        return mapper.addSelective(unit);
    }

    @Override
    public int deleteByUnitid(Integer unitid) {
        return mapper.deleteByUnitid(unitid);
    }

    @Override
    public int updateSelective(Unit unit) {
        return mapper.updateSelective(unit);
    }

}




