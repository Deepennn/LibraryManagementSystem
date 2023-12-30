package com.lms.mapper;

import com.lms.entity.Bookborrowing;
import com.lms.entity.Bookcirculation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookcirculation】的数据库操作Mapper
* @createDate 2023-11-23 12:50:42
* @Entity com.lms.entity.Bookcirculation
*/
public interface BookcirculationMapper extends BaseMapper<Bookcirculation> {

    int addSelective(Bookcirculation bookcirculation);
    
    List<Bookcirculation> selectByMap(@Param("map") Map<String, Object> map);

    int deleteByCirculationid(@Param("circulationid") Integer circulationid);

    List<Bookcirculation> selectByCirculationid(@Param("circulationid") Integer circulationid);

    int updateSelective(Bookcirculation bookcirculation);

}




