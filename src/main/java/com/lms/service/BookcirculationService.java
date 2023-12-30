package com.lms.service;

import com.lms.entity.Bookcirculation;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookcirculation】的数据库操作Service
* @createDate 2023-11-23 12:50:42
*/
public interface BookcirculationService extends IService<Bookcirculation> {

    int addSelective(Bookcirculation bookcirculation);

    List<Bookcirculation> selectByMap(Map<String, Object> columnMap);

    int deleteByCirculationid(@Param("circulationid") Integer circulationid);

    List<Bookcirculation> selectByCirculationid(@Param("circulationid") Integer circulationid);

    int updateSelective(Bookcirculation bookcirculation);

}
