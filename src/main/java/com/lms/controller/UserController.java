package com.lms.controller;

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

import static com.lms.util.Util.getSerialNumber;

@RestController
public class UserController {


    @Autowired
    UserService userService;
    @Autowired
    UserroleService userroleService;
    @Autowired
    BookborrowingService bookborrowingService;
    @Autowired
    UnitService unitService;
    @Autowired
    RoleService roleService;


    /*
    * 对所有Controller参数的说明:
    * _XXX为从前端获取的/Spring注入 的 变量/对象
    * XXX为从数据库获取的/局部设定 的 变量/对象
    * # # # 不要混淆!!!不要混淆!!!不要混淆!!! # # #
    * */


    //用户登录
    @RequestMapping("login")
    @ResponseBody
    public String login(@RequestParam("username")String username,
                        @RequestParam("password")String password,
                        HttpSession session) {
        session.removeAttribute("admin");
        session.removeAttribute("worker");
        session.removeAttribute("reader");
        String message="error"; // 标识符用于判断是否登录成功
//        String type= request.getParameter("type");
//        session.setAttribute("type", type);
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        List<User> userlist = userService.selectByMap(map); // 匹配账号
        User user = userlist.size()!=0 ? userlist.get(0) : null;
        if(user!=null){
//        if(type!=null && _user!=null){
//            Map<String,Object> userrolemap = new HashMap<>();
//            userrolemap.put("userid",_user.getUserid());
//            userrolemap.put("roleid",type);
//            List<Userrole> userrolelist = userroleService.selectByMap(userrolemap); // 匹配账号角色关系
            List<Userrole> userrolelist = userroleService.selectByUserid(user.getUserid()); // 匹配账号角色关系
            Userrole userrole = userrolelist.size()!=0 ? userrolelist.get(0) : null;
            if(userrole!=null){
                switch (userrole.getRoleid()) {
                    case 0:
                        session.setAttribute("admin", user);
                        message = "adminok";
                        break;
                    case 1:
                        session.setAttribute("worker", user);
                        message = "workerok";
                        break;
                    case 2:
                        session.setAttribute("reader", user);
                        message = "readerok";
                        break;
                    default:
                        break;
                }
            }
        }
        return message;
    }


    //前往注册页面
    @RequestMapping("toAddUser.do")
    public ModelAndView toAddUser() {
        return new ModelAndView("view/user/add");
    }


    //添加用户
    @RequestMapping("addUser")
    @ResponseBody
    public boolean addUser(User _user, HttpServletRequest request){
        boolean re= false;
        List<User> userlist = userService.selectByUsername(_user.getUsername());
        if(userlist.size()==0){

            Integer userid = getSerialNumber();
            _user.setUserid(userid);

            String _roleid = request.getParameter("roleid");
            Integer roleid = _roleid != null ? Integer.parseInt(_roleid) : 2 ; // 不指定就是读者
            if (roleid == 1){
                String _workid = request.getParameter("workid");
                _user.setUsername(_workid); // 工作人员用户名为工号
                _user.setPassword(_workid.substring(_workid.length()-4)); // 工作人员密码为工号后4位
            }

            _user.setCreatedtime(new Date());
            userService.addSelective(_user);

            Userrole userrole = new Userrole();
            userrole.setUserid(userid);
            userrole.setRoleid(roleid);
            userroleService.addSelective(userrole);

            re = true;
            return  re;
        }else{
            return re;
        }
    }


    //重置用户密码
    @RequestMapping("resetUser")
    @ResponseBody
    public boolean resetUser(User _user, HttpServletRequest request){ // _user: 前端获取的user
        boolean re= false;
        List<User> userlist = userService.selectByUsername(_user.getUsername());
        if(userlist.size()==1){
            User user = userlist.get(0); // _user: 数据库中获取的user
            String contactnumber = user.getContactnumber();
            String contactnumber4 = request.getParameter("contactnumber4");
            if(contactnumber.substring(contactnumber.length()-4).equals(contactnumber4)){
                user.setPassword(_user.getPassword()); // 密码重置
                userService.updateSelective(user);
                re = true;
                return re;
            }
            else{
                return re;
            }
        }else{
            return re;
        }
    }


    //删除用户
    @RequestMapping("deleteUser")
    @ResponseBody
    public boolean deleteUser(Integer userid){
        boolean re= false;
//        List<Userrole> userrolelist = userroleService.selectByUserid(userid); // 匹配账号角色关系
//        Userrole userrole = userrolelist.size()!=0 ? userrolelist.get(0) : null;
//        if(userrole!=null){
//            userroleService.deleteByUserid(userid); // 先删除userrole表记录
//        }
        userroleService.deleteByUserid(userid); // 先删除userrole表记录
        userService.deleteByUserid(userid); // 再删除user表记录
        re = true;
        return  re;
    }


    //查询用户
    @RequestMapping("userList.do")
    public ModelAndView userList(HttpSession session, Map<String,Object> _map){
//        User _user = (User) session.getAttribute("reader");
        Map<String,Object> map = new HashMap<>();
//        map.put("userid", _user!=null ? _user.getUserid() : null); // 如果角色是读者仅能查询自己
        List<User> userlist = userService.selectByMap(map);
        for(User data:userlist) {

            List<Unit> unitlist = unitService.selectByUnitid(data.getUnitid()); // unitid -> unit -|前端|-> unitname
            data.setUnit(unitlist.size()!=0 ? unitlist.get(0) : null);

            List<Userrole> userrolelist = userroleService.selectByUserid(data.getUserid()); // userid -|userrole|-> roleid -> role -|前端|-> rolename
            Userrole userrole = userrolelist.size()!=0 ? userrolelist.get(0) : null;
            if (userrole!=null) {
                List<Role> rolelist = roleService.selectByRoleid(userrole.getRoleid());
                data.setRole(rolelist.size()!=0 ? rolelist.get(0) : null);
            }

        }
        _map.put("userlist", userlist);
        return new ModelAndView("view/user/list");
    }


    //前往修改页面
    @RequestMapping("toUpdateUser.do")
    @ResponseBody
    public ModelAndView toUpdateUser(Integer userid,ModelAndView mv){
        List<User> userlist = userService.selectByUserid(userid);
        mv.addObject("userdata", userlist.size()!=0 ? userlist.get(0) : null);
        mv.setViewName("view/user/update");
        return mv;
    }


    //修改用户
    @RequestMapping("updateUser")
    @ResponseBody
    public boolean updateUser(User user, HttpServletRequest request){
        boolean re= false;

        System.out.println(user);
        userService.updateSelective(user);

        String _roleid = request.getParameter("roleid");

        if(_roleid != null){
            Integer roleid = Integer.parseInt(_roleid);
            List<Userrole> userrolelist = userroleService.selectByUserid(user.getUserid()); // 匹配账号角色关系
            Userrole userrole = userrolelist.size()!=0 ? userrolelist.get(0) : null;
            if(userrole!=null){
                userrole.setRoleid(roleid);
                userroleService.updateSelective(userrole);
            }
        }

        re = true;
        return re;
    }

    //前往详情页面
    @RequestMapping("toUserDetail.do")
    @ResponseBody
    public ModelAndView toUserDetail(Integer userid,ModelAndView mv){
        List<User> userlist = userService.selectByUserid(userid);
        User user = userlist.get(0);

        List<Unit> unitlist = unitService.selectByUnitid(user.getUnitid()); // unitid -> unit -|前端|-> unitname
        user.setUnit(unitlist.size()!=0 ? unitlist.get(0) : null);

        List<Userrole> userrolelist = userroleService.selectByUserid(user.getUserid()); // userid -|userrole|-> roleid -> role -|前端|-> rolename
        Userrole userrole = userrolelist.size()!=0 ? userrolelist.get(0) : null;
        if (userrole!=null) {
            List<Role> rolelist = roleService.selectByRoleid(userrole.getRoleid());
            user.setRole(rolelist.size()!=0 ? rolelist.get(0) : null);
        }

        mv.addObject("userdata", user);
        mv.setViewName("view/user/detail");
        return mv;
    }

}
