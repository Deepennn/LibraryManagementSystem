package com.lms.mapper;

import com.lms.entity.Bookborrowing;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookborrowing】的数据库操作Mapper
* @createDate 2023-11-19 16:13:24
* @Entity com.lms.entity.Bookborrowing
*/
public interface BookborrowingMapper extends BaseMapper<Bookborrowing> {

    int addSelective(Bookborrowing bookborrowing);

    List<Bookborrowing> selectByMap(@Param("map") Map<String, Object> map);

    int deleteByBorrowid(@Param("borrowid") Integer borrowid);

    List<Bookborrowing> selectByBorrowid(@Param("borrowid") Integer borrowid);

    int updateSelective(Bookborrowing bookborrowing);

}




