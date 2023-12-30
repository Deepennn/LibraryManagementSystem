package com.lms.controller;

import com.lms.entity.Bookinformation;
import com.lms.entity.User;
import com.lms.service.BookinformationService;
import com.lms.service.UserService;
import com.lms.util.POIUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UtilController {

    @Autowired
    UserService userService;
    @Autowired
    BookinformationService bookinformationService;

    //前往登录页面
    @RequestMapping("toLogin")
    public String toLogin(HttpSession session) {
        session.removeAttribute("admin"); // 退出登陆/登录前清理
        session.removeAttribute("worker");
        session.removeAttribute("reader");
        return "view/entry/login";
    }


    //前往注册页面
    @RequestMapping("toRegister")
    public ModelAndView toRegsiter(ModelAndView mv){
        mv.setViewName("view/entry/register");
        return mv;
    }


    //前往密码重置页面
    @RequestMapping("toReset")
    public ModelAndView toReset(ModelAndView mv){
        mv.setViewName("view/entry/reset");
        return mv;
    }


    //前往主页面
    @RequestMapping("toMain.do")
    public ModelAndView toMain(){
        return new ModelAndView("view/common/main");
    }


    //图片上传
    @ResponseBody
    @RequestMapping("upload")
    public Map upload(MultipartFile file, HttpServletRequest request){

        String suffix="";
        String dateStr="";
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                suffix=originalName.substring(originalName.lastIndexOf(".")+1);
                Date date = new Date();
                String uuid = UUID.randomUUID()+"";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateStr = simpleDateFormat.format(date);
                String filepath = "D:\\upload\\" + dateStr+"\\"+uuid+"." + suffix;

                File files=new File(filepath);
                //打印查看上传路径
                System.out.println(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String,Object> map2=new HashMap<>();
                Map<String,Object> map=new HashMap<>();
                map.put("code",0);
                map.put("msg","");
                map.put("data",map2);
                map2.put("src",dateStr+"/"+uuid+"." + suffix);
                return map;
            }

        }catch (Exception e){
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (Exception e) {
            }
        }
        Map<String,Object> map=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map;
    }


    /**
     * 处理Excel表格的方法
     * @param file
     */
    @RequestMapping("imExcelForUser")
    public void AddUserByExcel(@RequestParam("file") CommonsMultipartFile file, HttpServletResponse response){
        try{
            List<User> users = POIUtil.importExcelForUser(file.getInputStream());// 对Excel表格进行解析
            users.stream().forEach(user -> System.out.println(user.toString()));// 通过流循环输出Java对象
            userService.addBatch(users);
            System.out.println("``````````````````EXCEL OK!````````````````````");
            response.sendRedirect("userList.do");
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    /**
     * 处理Excel表格的方法
     * @param file
     */
    @RequestMapping("imExcelForBook")
    public void AddBookByExcel(@RequestParam("file") CommonsMultipartFile file, HttpServletResponse response, HttpSession session){
        try{
            User user = (User) session.getAttribute("worker");
            Integer unitid = user.getUnitid(); // 获取工作人员工作单位
            List<Bookinformation> books = POIUtil.importExcelForBook(file.getInputStream(), unitid);// 对Excel表格进行解析
            books.stream().forEach(book -> System.out.println(book.toString()));// 通过流循环输出Java对象
            bookinformationService.addBatch(books);
            System.out.println("``````````````````EXCEL OK!````````````````````");
            response.sendRedirect("bookList.do");
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
