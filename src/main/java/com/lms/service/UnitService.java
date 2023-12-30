package com.lms.service;

import com.lms.entity.Unit;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【unit】的数据库操作Service
* @createDate 2023-11-19 16:07:41
*/
public interface UnitService extends IService<Unit> {

    List<Unit> selectByMap(Map<String, Object> columnMap);

    List<Unit> selectByUnitid(@Param("unitid") Integer unitid);

    List<Unit> selectByUnitname(@Param("unitname") String unitname);

    int addSelective(Unit unit);

    int deleteByUnitid(@Param("unitid") Integer unitid);

    int updateSelective(Unit unit);

}
