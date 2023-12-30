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
public class BookborrowingController {

    @Autowired
    BookborrowingService bookborrowingService;
    @Autowired
    UserService userService;
    @Autowired
    BookinformationService bookinformationService;
    @Autowired
    UnitService unitService;

    /*
    * 状态码:
    * 0:借阅待审核
    * 1:借阅通过审核
    * 2:借阅未通过审核
    * 3:归还待审核
    * 4:归还待审核
    * 5:归还未通过审核
    * */

    //通过审核
    @RequestMapping("approveBorrowing")
    @ResponseBody
    public boolean approveBorrowing(Integer borrowid){
        boolean re = false;
        Bookborrowing bookborrowing = bookborrowingService.selectByBorrowid(borrowid).get(0);
        Bookinformation bookinformation=bookinformationService.selectByBookid(bookborrowing.getBookid()).get(0);
        if(bookborrowing.getBorrowstatus()==0){
            bookborrowing.setBorrowstatus(1);
            bookborrowingService.updateSelective(bookborrowing);

//            bookinformation.setBookcount(bookinformation.getBookcount() - 1); // 书数-1 , 由工作人员释放图书
//            bookinformationService.updateSelective(bookinformation);
        }
        else if (bookborrowing.getBorrowstatus()==3){
            bookborrowing.setBorrowstatus(4);
            bookborrowingService.updateSelective(bookborrowing);

            bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
            bookinformationService.updateSelective(bookinformation);
        }
        re = true;
        return re;
    }


    //不通过审核
    @RequestMapping("disapproveBorrowing")
    @ResponseBody
    public boolean disapproveBorrowing(Integer borrowid){
        boolean re = false;
        Bookborrowing bookborrowing = bookborrowingService.selectByBorrowid(borrowid).get(0);
        Bookinformation bookinformation=bookinformationService.selectByBookid(bookborrowing.getBookid()).get(0);
        if(bookborrowing.getBorrowstatus()==0){
            bookborrowing.setBorrowstatus(2);
            bookborrowingService.updateSelective(bookborrowing);

            bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
            bookinformationService.updateSelective(bookinformation);
        }
        else if (bookborrowing.getBorrowstatus()==3){
            bookborrowing.setBorrowstatus(5);
            bookborrowingService.updateSelective(bookborrowing);

//            bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
//            bookinformationService.updateSelective(bookinformation);
        }
        re = true;
        return re;
    }


    /*
    //前往归还页面
    @RequestMapping("toRestoreBorrowing")
    public ModelAndView toRestoreBorrowing(Integer borrowid, HttpServletRequest request) {
        Bookborrowing bookborrowing = bookborrowingService.selectByBorrowid(borrowid).get(0);
        request.setAttribute("bookborrowing",bookborrowing);

        Date borrowtime = bookborrowing.getBorrowtime();
        Date duetime = bookborrowing.getDuetime();
        Date nowtime = new Date();

        long borrowday= getDiffByDay(borrowtime,nowtime);
        long exceedday= getDiffByDay(duetime,nowtime);
        if(exceedday < 0){
            exceedday = 0L;
        }

        request.setAttribute("borrowday",borrowday); // 属性值预计算
        request.setAttribute("exceedday",exceedday);
        return new ModelAndView("view/bookborrowing/restore");
    }
    */


    //归还图书
    @RequestMapping("restoreBorrowing")
    @ResponseBody
    public boolean restoreBorrowing(Integer borrowid){
        boolean re = false;
        Bookborrowing bookborrowing = bookborrowingService.selectByBorrowid(borrowid).get(0);
        bookborrowing.setReturntime(new Date()); // 还书时间
        bookborrowing.setBorrowstatus(3);
        bookborrowingService.updateSelective(bookborrowing);

//        Bookinformation bookinformation = bookinformationService.selectByBookid(bookborrowing.getBookid()).get(0);
//        bookinformation.setBookcount(bookinformation.getBookcount() + 1); // 书数+1 , 由工作人员释放图书
//        bookinformationService.updateSelective(bookinformation);
        re = true;
        return re;
    }


    //添加借阅记录
    @RequestMapping("addBorrowing")
    @ResponseBody
    public boolean addBorrowing(Integer bookid, HttpServletRequest request){
        boolean re = false;
        Bookinformation bookinformation=bookinformationService.selectByBookid(bookid).get(0);
        if(bookinformation.getBookcount()<1){
            return re;
        }else{
            User user = (User) request.getSession().getAttribute("reader");
            Bookborrowing bookborrowing=new Bookborrowing();
            bookborrowing.setBorrowaccountid(user.getUserid());
            bookborrowing.setBookid(bookid);
            bookborrowing.setBorrowid(getSerialNumber());
            Date nowdate = new Date();
            bookborrowing.setBorrowtime(nowdate);
            bookborrowing.setDuetime(getDateAMonthLater(nowdate));
            bookborrowing.setBorrowstatus(0); // 设置状态: 借阅未审核
            bookborrowingService.addSelective(bookborrowing);

            bookinformation.setBookcount(bookinformation.getBookcount() - 1); // 书数-1 , 由读者锁定图书
            bookinformationService.updateSelective(bookinformation);
            re = true;
            return re;
        }
    }


    //删除借阅记录
    @RequestMapping("deleteBorrowing")
    @ResponseBody
    public boolean deleteBorrowing(Integer id){
        boolean re= false;
        bookborrowingService.deleteByBorrowid(id);
        re = true;
        return  re;
    }


    //查询借阅记录
    @RequestMapping("borrowingList.do")
    public ModelAndView borrowingList(HttpSession session, Map<String,Object> _map){
        User reader = (User) session.getAttribute("reader");
        User worker = (User) session.getAttribute("worker");

        Map<String,Object> map = new HashMap<>();
        if(reader!=null){
            map.put("borrowaccountid",reader.getUserid()); // reader::filtered by borrowaccountid
        }
        if(worker!=null){
            // worker::get all the records filtered not now but later
        }
        List<Bookborrowing> bookborrowinglist = bookborrowingService.selectByMap(map);
        for(Bookborrowing data:bookborrowinglist) {
            data.setUser(userService.selectByUserid(data.getBorrowaccountid()).get(0));
            data.setBookinformation(bookinformationService.selectByBookid(data.getBookid()).get(0));
        }
        if(worker!=null){ // worker::filtered by unitid when bookinformation is acquired
            List<Bookborrowing> templist = new ArrayList<Bookborrowing>();
            for(Bookborrowing data:bookborrowinglist) {
                if(Objects.equals(data.getBookinformation().getUnitid(), worker.getUnitid())){
                    templist.add(data);
                }
            }
            bookborrowinglist = templist;
        }
        _map.put("bookborrowinglist", bookborrowinglist);
        return new ModelAndView("view/bookborrowing/list");
    }


    //借阅图书
    @RequestMapping("borrowList.do")
    public ModelAndView borrowList(HttpServletRequest request, Map<String,Object> _map){
        String keyword = request.getParameter("keyword");
        String bookcategory = request.getParameter("bookcategory");
        Map<String,Object> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("bookcategory", bookcategory);
        List<Bookinformation> booklist= bookinformationService.selectByMap(map);
        for(Bookinformation data:booklist) {
            List<Unit> unitlist = unitService.selectByUnitid(data.getUnitid());
            data.setUnit(unitlist.size()!=0 ? unitlist.get(0) : null);
        }
        _map.put("booklist", booklist);
        return new ModelAndView("view/bookborrowing/borrow");
    }


    //修改借阅记录
    @RequestMapping("updateBorrowing")
    @ResponseBody
    public boolean updateBorrowing(Bookborrowing bookborrowing) throws IOException {
        boolean re = false;
        bookborrowing.setReturntime(new Date());
        bookborrowingService.updateSelective(bookborrowing);
        re =true;
        return re;
    }

}
