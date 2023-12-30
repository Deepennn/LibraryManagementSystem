package com.lms.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class Util {


    public  static int getSerialNumber() {

        // 生成ID/序列号

        // 获取当前时间
        SimpleDateFormat sdf=new SimpleDateFormat("MMdd"); // yyyyMMddHHmmss
        String nowtime = sdf.format(new Date());

        // 获取2位随机数
        Random random=new Random();
        int result= random.nextInt(1000000); // 随机6位数

        return Integer.parseInt(nowtime + result);

    }


    public static long getDiffByDay(Date startdate, Date enddate) {

        // 获取天数差
        int diffday = (int) ((enddate.getTime() - startdate.getTime()) / (1000*3600*24));
        return diffday;

    }


    public  static Date getDateAMonthLater(Date nowdate) {

        // 获取当前时间30天后的时间
        Calendar calc = Calendar.getInstance();
        Date duedate = null;
        try {
            calc.setTime(nowdate);
            calc.add(calc.DATE, 30);
            duedate = calc.getTime();
        } catch (Exception e1) {
            e1.printStackTrace();
        }

        return duedate;

    }

}
