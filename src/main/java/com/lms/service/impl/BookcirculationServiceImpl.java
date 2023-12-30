package com.lms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lms.entity.Bookcirculation;
import com.lms.service.BookcirculationService;
import com.lms.mapper.BookcirculationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
* @author JIALIANGLI
* @description 针对表【bookcirculation】的数据库操作Service实现
* @createDate 2023-11-23 12:50:42
*/
@Service
public class BookcirculationServiceImpl extends ServiceImpl<BookcirculationMapper, Bookcirculation>
    implements BookcirculationService{

    @Autowired
    BookcirculationMapper mapper;

    @Override
    public int addSelective(Bookcirculation bookcirculation) {
        return mapper.addSelective(bookcirculation);
    }

    @Override
    public List<Bookcirculation> selectByMap(Map<String, Object> columnMap) {
        return mapper.selectByMap(columnMap);
    }

    @Override
    public int deleteByCirculationid(Integer circulationid) {
        return mapper.deleteByCirculationid(circulationid);
    }

    @Override
    public List<Bookcirculation> selectByCirculationid(Integer circulationid) {
        return mapper.selectByCirculationid(circulationid);
    }

    @Override
    public int updateSelective(Bookcirculation bookcirculation) {
        return mapper.updateSelective(bookcirculation);
    }
}




