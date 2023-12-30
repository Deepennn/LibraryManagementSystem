package com.lms.mapper;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lms.entity.Bookinformation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
* @author JIALIANGLI
* @description 针对表【bookinformation】的数据库操作Mapper
* @createDate 2023-11-19 16:10:39
* @Entity com.lms.entity.Bookinformation
*/
public interface BookinformationMapper extends BaseMapper<Bookinformation> {

    int addSelective(Bookinformation bookinformation);

    int addBatch(@Param("bookinformationCollection") Collection<Bookinformation> bookinformationCollection);

    List<Bookinformation> selectByMap(@Param("map") Map<String, Object> map);

    int deleteByBookid(@Param("bookid") Integer bookid);

    List<Bookinformation> selectByBookid(@Param("bookid") Integer bookid);

    List<Bookinformation> selectByBookname(@Param("bookname") String bookname);

    int updateSelective(Bookinformation bookinformation);

}




