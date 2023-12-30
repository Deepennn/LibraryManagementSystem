package com.lms.service;

import com.lms.entity.Bookinformation;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookinformation】的数据库操作Service
* @createDate 2023-11-19 16:10:39
*/
public interface BookinformationService extends IService<Bookinformation> {

    int addSelective(Bookinformation bookinformation);

    int addBatch(@Param("bookinformationCollection") Collection<Bookinformation> bookinformationCollection);

    List<Bookinformation> selectByMap(@Param("map") Map<String, Object> map);

    int deleteByBookid(@Param("bookid") Integer bookid);

    List<Bookinformation> selectByBookid(@Param("bookid") Integer bookid);

    List<Bookinformation> selectByBookname(@Param("bookname") String bookname);

    int updateSelective(Bookinformation bookinformation);

}
