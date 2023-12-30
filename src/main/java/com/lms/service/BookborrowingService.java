package com.lms.service;

import com.lms.entity.Bookborrowing;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookborrowing】的数据库操作Service
* @createDate 2023-11-19 16:13:24
*/
public interface BookborrowingService extends IService<Bookborrowing> {

    int addSelective(Bookborrowing bookborrowing);

    List<Bookborrowing> selectByMap(@Param("map") Map<String, Object> map);

    int deleteByBorrowid(@Param("borrowid") Integer borrowid);

    List<Bookborrowing> selectByBorrowid(@Param("borrowid") Integer borrowid);

    int updateSelective(Bookborrowing bookborrowing);

}
