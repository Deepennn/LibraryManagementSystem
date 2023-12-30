package com.lms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lms.entity.Bookinformation;
import com.lms.service.BookinformationService;
import com.lms.mapper.BookinformationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookinformation】的数据库操作Service实现
* @createDate 2023-11-19 16:10:39
*/
@Service
public class BookinformationServiceImpl extends ServiceImpl<BookinformationMapper, Bookinformation>
    implements BookinformationService{

    @Autowired
    BookinformationMapper mapper;

    @Override
    public int addSelective(Bookinformation bookinformation) {
        return mapper.addSelective(bookinformation);
    }

    @Override
    public int addBatch(Collection<Bookinformation> bookinformationCollection) {
        return mapper.addBatch(bookinformationCollection);
    }

    @Override
    public List<Bookinformation> selectByMap(Map<String, Object> map) {
        return mapper.selectByMap(map);
    }

    @Override
    public int deleteByBookid(Integer bookid) {
        return mapper.deleteByBookid(bookid);
    }

    @Override
    public List<Bookinformation> selectByBookid(Integer bookid) {
        return mapper.selectByBookid(bookid);
    }

    @Override
    public List<Bookinformation> selectByBookname(String bookname) {
        return mapper.selectByBookname(bookname);
    }

    @Override
    public int updateSelective(Bookinformation bookinformation) {
        return mapper.updateSelective(bookinformation);
    }

}
