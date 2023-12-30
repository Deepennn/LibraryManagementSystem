package com.lms.service.impl;

import com.lms.entity.Statistics;
import com.lms.mapper.StatisticsMapper;
import com.lms.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatisticsServiceImpl implements StatisticsService {

    @Autowired
    StatisticsMapper mapper;

    public List<Statistics> selectByUnitidMonthly(Integer unitid) {
        return mapper.selectByUnitidMonthly(unitid);
    }

    @Override
    public List<Statistics> selectByUnitidYearly(Integer unitid) {
        return mapper.selectByUnitidYearly(unitid);
    }

    public List<Statistics> selectByUnitid(Integer unitid){
        return  mapper.selectByUnitid(unitid);
    }

}
