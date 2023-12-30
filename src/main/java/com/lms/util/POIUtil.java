package com.lms.util;

import com.lms.entity.Bookinformation;
import com.lms.entity.User;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import static com.lms.util.Util.getSerialNumber;

/**
 * 解析Excel表格的工具类
 */
public class POIUtil {

    /**
     * 导入表格的解析方法
     * @param file
     * @return
     * @throws Exception
     */
    public static List<User> importExcelForUser(InputStream file) throws Exception{
        // 注意xssf只能解析xlsx为后缀的表格文件
        Workbook workbook = new XSSFWorkbook(file);
        Sheet sheet = null;
        Boolean stop = false;
        // 总共有几个sheet表格
        for(int i = 0;i < workbook.getNumberOfSheets();i++){
            //获取每个sheet
            sheet = workbook.getSheetAt(i);
            List<User> list = new ArrayList<User>();
            //getPhysicalNumberOfRows获取有记录的行数
            for(int j = 1;j < sheet.getPhysicalNumberOfRows();j++){
                Row row = sheet.getRow(j);
                if(row!=null){
                    User user = new User();
                    //getLastCellNum获取最后一列
                    for(int k = 0 ;k < row.getLastCellNum();k++){
                        if(row.getCell(k)!=null && !row.getCell(k).equals("")){
                            /*
                                获取单元格XSSFCell cell = row.getCell(0);
                                设置单元格类型cell.setCellType(CellType.STRING);
                                获取单元格数据String cellValue = cell.getStringCellValue()
                                */
                            //userid
                            user.setUserid(getSerialNumber());
                            // username
                            if(k==0){
                                Cell cell = row.getCell(0);
                                cell.setCellType(CellType.STRING);
                                if(cell.getStringCellValue().equals("")){
                                    stop = true;
                                    break;
                                }
                                user.setUsername(cell.getStringCellValue());
                            }
                            // password
                            if(k==1){
                                Cell cell = row.getCell(1);
                                cell.setCellType(CellType.STRING);
                                user.setPassword(cell.getStringCellValue());
                            }
                        }
                    }
                    if(stop){
                        break;
                    }
                    list.add(user);
                }
            }
            System.out.println("读取sheet表："+ workbook.getSheetName(i) + "完成");
            return list;
        }
        return null;
    }


    /**
     * 导入表格的解析方法
     * @param file
     * @return
     * @throws Exception
     */
    public static List<Bookinformation> importExcelForBook(InputStream file, Integer unitid) throws Exception{
        // 注意xssf只能解析xlsx为后缀的表格文件
        Workbook workbook = new XSSFWorkbook(file);
        Sheet sheet = null;
        Boolean stop = false;
        // 总共有几个sheet表格
        for(int i = 0;i < workbook.getNumberOfSheets();i++){
            //获取每个sheet
            sheet = workbook.getSheetAt(i);
            List<Bookinformation> list = new ArrayList<Bookinformation>();
            //getPhysicalNumberOfRows获取有记录的行数
            for(int j = 1;j < sheet.getPhysicalNumberOfRows();j++){
                Row row = sheet.getRow(j);
                if(row!=null){
                    Bookinformation book = new Bookinformation();
                    //getLastCellNum获取最后一列
                    for(int k = 0 ;k < row.getLastCellNum();k++){
                        if(row.getCell(k)!=null && !row.getCell(k).equals("")){
                            /*
                                获取单元格XSSFCell cell = row.getCell(0);
                                设置单元格类型cell.setCellType(CellType.STRING);
                                获取单元格数据String cellValue = cell.getStringCellValue()
                                */

                            // bookid
//                            book.setBookid(getSerialNumber());
                            if(k==0){
                                Cell cell = row.getCell(0);
                                cell.setCellType(CellType.NUMERIC);
                                book.setBookid((int) cell.getNumericCellValue());
                            }
                            // bookname
                            if(k==1){
                                Cell cell = row.getCell(1);
                                cell.setCellType(CellType.STRING);
                                book.setBookname(cell.getStringCellValue());
                                if(cell.getStringCellValue().equals("")){
                                    stop = true;
                                    break;
                                }
                            }
                            // bookcount
                            if(k==2){
                                Cell cell = row.getCell(2);
                                cell.setCellType(CellType.NUMERIC);
                                book.setBookcount((int) cell.getNumericCellValue());
                            }
                            book.setUnitid(unitid);
                        }
                    }
                    if(stop){
                        break;
                    }
                    list.add(book);
                }
            }
            System.out.println("读取sheet表："+ workbook.getSheetName(i) + "完成");
            return list;
        }
        return null;
    }
}
