package com.lms.controller;

import com.lms.entity.Unit;
import com.lms.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.lms.util.Util.getSerialNumber;

@RestController
public class UnitController {

    @Autowired
    UnitService unitService;


    //添加单位
    @RequestMapping("addUnit")
    @ResponseBody
    public boolean addUnit(Unit unit){
        boolean re = false;
        System.out.println("```````````````````````````");
        List<Unit> unitlist = unitService.selectByUnitname(unit.getUnitname());
        System.out.println(unitlist);
        System.out.println(unitlist.size());
        if(unitlist.size()==0){

            Integer unitid = getSerialNumber();
            unit.setUnitid(unitid);

            System.out.println(unit);
            unitService.addSelective(unit);

            re = true;
            return re;
        }else{
            return re;
        }
    }


    //前往添加单位页面
    @RequestMapping("toAddUnit")
    public ModelAndView toAddUnit() {
        return new ModelAndView("view/unit/add");
    }


    //删除单位
    @RequestMapping("deleteUnit")
    @ResponseBody
    public boolean deleteUnit(Integer unitid){
        boolean re= false;
        unitService.deleteByUnitid(unitid);
        re = true;
        return  re;
    }


    //查询单位
    @RequestMapping("unitList.do")
    public ModelAndView unitList(Map<String,Object> _map){
        List<Unit> unitlist = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        //
        unitlist = unitService.selectByMap(map);
        _map.put("unitlist", unitlist);
        return new ModelAndView("view/unit/list");
    }


    //前往修改单位页面
    @RequestMapping("toUpdateUnit.do")
    @ResponseBody
    public ModelAndView toUpdateUnit(Integer unitid,ModelAndView mv){
        List<Unit> unitlist = unitService.selectByUnitid(unitid);
        Unit unit = unitlist.size()!=0 ? unitlist.get(0) : null;
        mv.addObject("unit", unit);
        mv.setViewName("view/unit/update");
        return mv;
    }


    //修改单位
    @RequestMapping("updateUnit")
    @ResponseBody
    public boolean updateUnit(Unit unit){
        boolean re= false;

        System.out.println(unit);
        unitService.updateSelective(unit);

        re = true;
        return re;
    }


    //前往详情页面
    @RequestMapping("toUnitDetail.do")
    @ResponseBody
    public ModelAndView toUnitDetail(Integer unitid, ModelAndView mv){
        List<Unit> unitlist = unitService.selectByUnitid(unitid);
        mv.addObject("unitdata", unitlist.size()!=0 ? unitlist.get(0) : null);
        mv.setViewName("view/unit/detail");
        return mv;
    }

}
