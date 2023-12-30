package com.lms.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lms.entity.*;
import com.lms.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@RestController
public class BookinformationController {


    @Autowired
    BookinformationService bookinformationService;
    @Autowired
    UnitService unitService;


    //前往添加图书页面
    @RequestMapping("toAddBook.do")
    public ModelAndView toAddBook() {
        return new ModelAndView("view/bookinformation/add");
    }


    //添加图书
    @RequestMapping("addBook")
    @ResponseBody
    public boolean addBook(Bookinformation bookinformation){
        boolean re= false;
//        bookinformation.setBookid(getSerialNumber());
        bookinformationService.addSelective(bookinformation);
        re = true;
        return re;
    }


    //删除图书
    @RequestMapping("deleteBook")
    @ResponseBody
    public boolean deleteBook(Integer bookid){
        boolean re= false;
        bookinformationService.deleteByBookid(bookid);
        re = true;
        return  re;
    }


    //查询图书
    @RequestMapping("bookList.do")
    public ModelAndView bookList(
            @RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request, HttpSession session, Map<String, Object> _map){
        String keyword = request.getParameter("keyword");
        String bookcategory = request.getParameter("bookcategory");
        User worker = (User) session.getAttribute("worker");

        Map<String,Object> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("bookcategory", bookcategory);
        if(worker != null) { // # 筛选方式1
            map.put("unitid", worker.getUnitid());
        }

        List<Bookinformation> rawbooklist = bookinformationService.selectByMap(map);
        for(Bookinformation data:rawbooklist) {
            List<Unit> unitlist = unitService.selectByUnitid(data.getUnitid());
            data.setUnit(unitlist.size()!=0 ? unitlist.get(0) : null);
        }
//        if(worker!=null){ // # 筛选方式2
//            List<Bookinformation> templist = new ArrayList<Bookinformation>();
//            for(Bookinformation data:rawbooklist) {
//                if(Objects.equals(data.getUnitid(), worker.getUnitid())){
//                    templist.add(data);
//                }
//            }
//            rawbooklist = templist;
//        }

        PageHelper.startPage(currentPage,10);
        PageInfo<Bookinformation> booklist =new PageInfo<Bookinformation>(rawbooklist,8);

        _map.put("booklist", booklist);
        return new ModelAndView("view/bookinformation/list");
    }


    //查询图书
    @RequestMapping("bookList2.do")
    public ModelAndView bookList2(HttpServletRequest request, HttpSession session, Map<String, Object> _map){
        String keyword = request.getParameter("keyword");
        User worker = (User) session.getAttribute("worker");
        Map<String,Object> map = new HashMap<>();
        map.put("keyword", keyword);
        if(worker != null) { // # 筛选方式1
            map.put("unitid", worker.getUnitid());
        }
        List<Bookinformation> booklist = bookinformationService.selectByMap(map);
        for(Bookinformation data:booklist) {
            List<Unit> unitlist = unitService.selectByUnitid(data.getUnitid());
            data.setUnit(unitlist.size()!=0 ? unitlist.get(0) : null);
        }
        _map.put("booklist", booklist);
        return new ModelAndView("view/bookinformation/list2");
    }


    //前往详情页面
    @RequestMapping("toBookDetail.do")
    @ResponseBody
    public ModelAndView toBookDetail(Integer bookid,ModelAndView mv){
        List<Bookinformation> booklist = bookinformationService.selectByBookid(bookid);
        Bookinformation bookinformation = booklist.size()!=0 ? booklist.get(0) : null;
        List<Unit> unitlist = unitService.selectByUnitid(bookinformation.getUnitid());
        bookinformation.setUnit(unitlist.size()!=0 ? unitlist.get(0) : null);
        mv.addObject("bookdata", bookinformation);
        mv.setViewName("view/bookinformation/detail");
        return mv;
    }


    //前往修改页面
    @RequestMapping("toUpdateBook.do")
    @ResponseBody
    public ModelAndView toUpdateBook(Integer bookid,ModelAndView mv){
        List<Bookinformation> booklist = bookinformationService.selectByBookid(bookid);
        mv.addObject("bookdata", booklist.size()!=0 ? booklist.get(0) : null);
        mv.setViewName("view/bookinformation/update");
        return mv;
    }


    //修改页面
    @RequestMapping("updateBook")
    @ResponseBody
    public boolean updateBook(Bookinformation bookinformation){
        boolean re= false;
        bookinformationService.updateSelective(bookinformation);
        re = true;
        return re;
    }

}
