package com.lms.controller;

import com.lms.entity.Statistics;
import com.lms.entity.User;
import com.lms.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StatisticsController {

    @Autowired
    StatisticsService statisticsService;


    //前往统计分析页面
    @RequestMapping("toStatistics.do")
    public String toStatistics() {
        return "view/statistics/statistics";
    }


    @RequestMapping("selectByUnitid")
    @ResponseBody
    public List<Statistics> selectByUnitid(HttpSession session){
        User user = (User) session.getAttribute("worker");
        Integer unitid = user!=null ? user.getUnitid() : null;
        return statisticsService.selectByUnitid(unitid);
    }


    @RequestMapping("selectByUnitidMonthly")
    @ResponseBody
    public List<Statistics> selectByUnitidMonthly(HttpSession session){
        User user = (User) session.getAttribute("worker");
        Integer unitid = user!=null ? user.getUnitid() : null;
        return statisticsService.selectByUnitidMonthly(unitid);
    }


    @RequestMapping("selectByUnitidYearly")
    @ResponseBody
    public List<Statistics> selectByUnitidYearly(HttpSession session){
        User user = (User) session.getAttribute("worker");
        Integer unitid = user!=null ? user.getUnitid() : null;
        return statisticsService.selectByUnitidYearly(unitid);
    }

}
