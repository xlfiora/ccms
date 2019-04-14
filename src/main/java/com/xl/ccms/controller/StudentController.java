package com.xl.ccms.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.AccountService;
import com.xl.ccms.service.StudentService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/21.
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private AccountService accountService;

    @RequestMapping("/queryAllStu")
    public @ResponseBody Map<String,Object> queryAllStu(@RequestParam("page")Integer nowPage, @RequestParam("rows")Integer pageSize,String stuId,String username){

        Page page = new Page();
        page.setPageIndex(nowPage);
        page.setSingleRows(pageSize);

        Account account = new Account();
        account.setStuId(stuId);
        account.setUsername(username);

        return studentService.queryAllStu(page,account);
    }

    @RequestMapping("/addStudent")
    public @ResponseBody Integer addStudent(String stuId,String username,String password){

        Account account = new Account();
        account.setType("0");
        account.setId(stuId);
        account.setStuId(stuId);
        account.setUsername(username);
        account.setPassword(password);
        account.setPhoto("blank.jpg");
        account.setEnterdate(new Date());
        return studentService.addStudent(account);

    }

    @RequestMapping("/removeStudent")
    public @ResponseBody Integer removeStudent(String id){
        studentService.removeStudent(id);
        return 1;
    }

    @RequestMapping("/modifyStudent")
    public @ResponseBody Integer modifyStudent(String id,String username,String tel){
        Account account = new Account();
        account.setId(id);
        account.setUsername(username);
        account.setTel(tel);
        return studentService.modifyStudent(account);
    }


    @RequestMapping("/modifyMyInfo")
    public @ResponseBody Integer modifyMyInfo(String id, String username, String sex, String birthday, String tel, String qq, String hometown, String dormitory, String hobby, MultipartFile file, HttpServletRequest request){

        try {
            String photo = file.getOriginalFilename();
            String[] s=photo.split("\\.");
            String newName=(new SimpleDateFormat("yyyyMMddHHmmssSSS")).format(new Date());
            photo=id+"-"+newName+"."+s[1];

            String realPath=request.getSession().getServletContext().getRealPath("/");

            System.out.println(realPath);

            String uploadPath = realPath.replace("ccms\\","resource\\student\\")+photo;
            file.transferTo(new File(uploadPath));

            Account account = new Account();
            account.setId(id);
            account.setUsername(username);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            account.setBirthday(sdf.parse(birthday));
            account.setSex(sex);
            account.setTel(tel);
            account.setQq(qq);
            account.setHometown(hometown);
            account.setDormitory(dormitory);
            account.setHobby(hobby);
            account.setPhoto(photo);

            studentService.modifyStudent(account);

            Account account1 = accountService.queryAccountById(id);

            HttpSession session = request.getSession();

            session.setAttribute("account",account1);

            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @RequestMapping("exportExcel")
    public void exportExcel(HttpServletResponse response){
        try {
            List<Account> students = studentService.queryAll();

            Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("学生用户信息表", "学生用户信息表"), Account.class, students);

            ServletOutputStream out =response.getOutputStream();

            String fileName = new String("学生用户信息表.xls".getBytes(),"iso-8859-1");
            //文件下载 设置响应头
            response.setContentType("application/vnd.ms-excel");//响应类型
            response.setHeader("content-disposition","attachment;fileName="+fileName);

            //导出 文件下载方式
            workbook.write(out);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }




}
