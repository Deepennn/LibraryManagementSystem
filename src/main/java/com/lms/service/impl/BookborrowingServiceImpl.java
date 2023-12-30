package com.lms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lms.entity.Bookborrowing;
import com.lms.service.BookborrowingService;
import com.lms.mapper.BookborrowingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookborrowing】的数据库操作Service实现
* @createDate 2023-11-23 13:03:10
*/
@Service
public class BookborrowingServiceImpl extends ServiceImpl<BookborrowingMapper, Bookborrowing>
    implements BookborrowingService{

    @Autowired
    BookborrowingMapper mapper;

    @Override
    public int addSelective(Bookborrowing bookborrowing) {
        return mapper.addSelective(bookborrowing);
    }

    @Override
    public List<Bookborrowing> selectByMap(Map<String, Object> map) {
        return mapper.selectByMap(map);
    }

    @Override
    public int deleteByBorrowid(Integer borrowid) {
        return mapper.deleteByBorrowid(borrowid);
    }

    @Override
    public List<Bookborrowing> selectByBorrowid(Integer borrowid) {
        return mapper.selectByBorrowid(borrowid);
    }

    @Override
    public int updateSelective(Bookborrowing bookborrowing) {
        return mapper.updateSelective(bookborrowing);
    }

}




