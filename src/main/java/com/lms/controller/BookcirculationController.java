package com.lms.controller;


import com.lms.entity.*;
import com.lms.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

import static com.lms.util.Util.*;

@RestController
public class BookcirculationController {

    @Autowired
    BookcirculationService bookcirculationService;
    @Autowired
    UserService userService;
    @Autowired
    BookinformationService bookinformationService;
    @Autowired
    UnitService unitService;

    /*
     * 状态码:
     * 0:流通待审核
     * 1:流通通过审核
     * 2:流通未通过审核
     * 3:归还待审核
     * 4:归还待审核
     * 5:归还未通过审核
     * */

    //通过审核
    @RequestMapping("approveCirculation")
    @ResponseBody
    public boolean approveCirculation(Integer circulationid){
        boolean re = false;
        Bookcirculation bookcirculation = bookcirculationService.selectByCirculationid(circulationid).get(0);
        Bookinformation bookinformation=bookinformationService.selectByBookid(bookcirculation.getBookid()).get(0);
        if(bookcirculation.getCirculationstatus()==0){
            bookcirculation.setCirculationstatus(1);
            bookcirculationService.updateSelective(bookcirculation);

//            bookinformation.setBookcount(bookinformation.getBookcount() - 1); // 书数-1 , 由工作人员释放图书
//            bookinformationService.updateSelective(bookinformation);
        }
        else if (bookcirculation.getCirculationstatus()==3){
            bookcirculation.setCirculationstatus(4);
            bookcirculationService.updateSelective(bookcirculation);

            bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
            bookinformationService.updateSelective(bookinformation);
        }
        re = true;
        return re;
    }


    //不通过审核
    @RequestMapping("disapproveCirculation")
    @ResponseBody
    public boolean disapproveCirculation(Integer circulationid){
        boolean re = false;
        Bookcirculation bookcirculation = bookcirculationService.selectByCirculationid(circulationid).get(0);
        Bookinformation bookinformation=bookinformationService.selectByBookid(bookcirculation.getBookid()).get(0);
        if(bookcirculation.getCirculationstatus()==0){
            bookcirculation.setCirculationstatus(2);
            bookcirculationService.updateSelective(bookcirculation);

            bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
            bookinformationService.updateSelective(bookinformation);
        }
        else if (bookcirculation.getCirculationstatus()==3){
            bookcirculation.setCirculationstatus(5);
            bookcirculationService.updateSelective(bookcirculation);

//            bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
//            bookinformationService.updateSelective(bookinformation);
        }
        re = true;
        return re;
    }


    //归还图书
    @RequestMapping("restoreCirculation")
    @ResponseBody
    public boolean restoreCirculation(Integer circulationid){
        boolean re = false;
        Bookcirculation bookcirculation = bookcirculationService.selectByCirculationid(circulationid).get(0);
        bookcirculation.setReturntime(new Date()); // 还书时间
        bookcirculation.setCirculationstatus(3);
        bookcirculationService.updateSelective(bookcirculation);

//        Bookinformation bookinformation = bookinformationService.selectByBookid(bookcirculation.getBookid()).get(0);
//        bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
//        bookinformationService.updateSelective(bookinformation);
        re = true;
        return re;
    }


    //添加流通记录
    @RequestMapping("addCirculation")
    @ResponseBody
    public boolean addCirculation(Integer bookid, HttpServletRequest request){
        boolean re = false;
        Bookinformation bookinformation=bookinformationService.selectByBookid(bookid).get(0);
        if(bookinformation.getBookcount()<1){
            return re;
        }else{
            User user = (User) request.getSession().getAttribute("worker");
            Bookcirculation bookcirculation=new Bookcirculation();
            bookcirculation.setCirculationaccountid(user.getUserid());
            bookcirculation.setBookid(bookid);
            bookcirculation.setCirculationid(getSerialNumber());
            bookcirculation.setUnit(
                    unitService.selectByUnitid(bookinformation.getUnitid()).get(0).getUnitname()
//                    unitService.selectByUnitid(user.getUnitid()).get(0).getUnitname()
            );
            Date nowdate = new Date();
            bookcirculation.setCirculationtime(nowdate);
            bookcirculation.setDuetime(getDateAMonthLater(nowdate));
            bookcirculation.setCirculationstatus(0); // 设置状态: 流通未审核
            bookcirculationService.addSelective(bookcirculation);

            bookinformation.setBookcount(bookinformation.getBookcount() - 1); // 书数-1 , 由读者锁定图书
            bookinformationService.updateSelective(bookinformation);
            re = true;
            return re;
        }
    }


    //删除流通记录
    @RequestMapping("deleteCirculation")
    @ResponseBody
    public boolean deleteCirculation(Integer id){
        boolean re= false;
        bookcirculationService.deleteByCirculationid(id);
        re = true;
        return  re;
    }


    //查询流通记录
    @RequestMapping("circulationList.do")
    public ModelAndView circulationList(HttpServletRequest request, Map<String,Object> _map){
        User worker = (User) request.getSession().getAttribute("worker");

        List<Unit> unitlist = unitService.selectByUnitid(worker.getUnitid());
        Unit unit = unitlist.size()!=0 ? unitlist.get(0) : null;
        String unitname = unit != null ?unit.getUnitname(): null;

        Map<String,Object> map = new HashMap<>();
        map.put("circulationaccountid",worker.getUserid()); // # 查询自己账号发起的流通记录
        // # or 的关系
        map.put("unit",unitname); // # 查询属于发向自己单位的流通记录
        List<Bookcirculation> bookcirculationlist = bookcirculationService.selectByMap(map);

        for(Bookcirculation data:bookcirculationlist) {
            data.setUser(userService.selectByUserid(data.getCirculationaccountid()).get(0));
            data.setBookinformation(bookinformationService.selectByBookid(data.getBookid()).get(0));
        }
        _map.put("bookcirculationlist", bookcirculationlist);
        return new ModelAndView("view/bookcirculation/list");
    }


    //流通图书
    @RequestMapping("circulateList.do")
    public ModelAndView circulateList(HttpServletRequest request, HttpSession session, Map<String, Object> _map){
        String keyword = request.getParameter("keyword");
        String bookcategory = request.getParameter("bookcategory");
        User worker = (User) session.getAttribute("worker");
        Map<String,Object> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("bookcategory", bookcategory);
        List<Bookinformation> booklist= bookinformationService.selectByMap(map);
        for(Bookinformation data:booklist) {
            List<Unit> unitlist = unitService.selectByUnitid(data.getUnitid());
            data.setUnit(unitlist.size()!=0 ? unitlist.get(0) : null);
        }
        if(worker!=null){
            List<Bookinformation> templist = new ArrayList<Bookinformation>();
            for(Bookinformation data:booklist) {
                if(!Objects.equals(data.getUnitid(), worker.getUnitid())){
                    templist.add(data);
                }
            }
            booklist = templist;
        }
        _map.put("booklist", booklist);
        return new ModelAndView("view/bookcirculation/circulate");
    }


    //修改流通记录
    @RequestMapping("updateCirculation")
    @ResponseBody
    public boolean updateCirculation(Bookcirculation bookcirculation) throws IOException {
        boolean re = false;
        bookcirculation.setReturntime(new Date());
        bookcirculationService.updateSelective(bookcirculation);
        re =true;
        return re;
    }

}
