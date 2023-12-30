package com.lms.mapper;
import com.lms.entity.User;
import org.apache.ibatis.annotations.Param;

import com.lms.entity.Unit;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【unit】的数据库操作Mapper
* @createDate 2023-11-19 16:07:41
* @Entity com.lms.entity.Unit
*/
public interface UnitMapper extends BaseMapper<Unit> {

    List<Unit> selectByMap(@Param("map")Map<String, Object> map);
//    @Override
//    List<Unit> selectByMap(Map<String, Object> columnMap);

    List<Unit> selectByUnitid(@Param("unitid") Integer unitid);

    List<Unit> selectByUnitname(@Param("unitname") String unitname);

    int addSelective(Unit unit);

    int deleteByUnitid(@Param("unitid") Integer unitid);

    int updateSelective(Unit unit);

}




