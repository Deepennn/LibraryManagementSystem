package com.lms.service;

import com.lms.entity.Statistics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatisticsService {

    List<Statistics> selectByUnitidMonthly(@Param("unitid") Integer unitid);

    List<Statistics> selectByUnitidYearly(@Param("unitid") Integer unitid);

    List<Statistics> selectByUnitid(@Param("unitid") Integer unitid);

}
