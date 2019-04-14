package com.xl.ccms.controller;

import com.xl.ccms.entity.Club;
import com.xl.ccms.entity.Page;
import com.xl.ccms.entity.RichTextResult;
import com.xl.ccms.service.ClubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2019/1/11.
 */
@Controller
@RequestMapping("/club")
public class ClubController {

    @Autowired
    private ClubService clubService;

    @RequestMapping("/addClub")
    public @ResponseBody void addClub(String clubName,String categoryId,String founder,String attached,String createDate,Double dues,String introduction) {

        try {
            Club club = new Club();
            club.setId(UUID.randomUUID().toString());
            club.setClubName(clubName);
            club.setCategoryId(categoryId);
            club.setFounder(founder);
            club.setAttached(attached);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            club.setCreateDate(sdf.parse(createDate));
            club.setDues(dues);
            club.setIntroduction(introduction);

            clubService.addClub(club);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/uploadFiles")
    public @ResponseBody RichTextResult uploadFiles(@RequestParam("files") MultipartFile[] files, HttpServletRequest request) throws IOException {

        RichTextResult result = new RichTextResult();
        ArrayList<String> data= new ArrayList<>();

        try {
            if(files!=null && files.length!=0 ){
                for (MultipartFile file : files) {
                    String fileName = file.getOriginalFilename();
                    String[] s = fileName.split("\\.");
                    String newName = (new SimpleDateFormat("yyyyMMddHHmmssSSS")).format(new Date());
                    fileName = newName + "." + s[1];
                    String realPath = request.getSession().getServletContext().getRealPath("/");
                    String uploadPath = realPath.replace("ccms\\", "resource\\club\\") + fileName;
                    file.transferTo(new File(uploadPath));
                    data.add("resource/club/"+fileName);
                }
            }
            //处理响应
            result.setErrno(0);
            result.setData(data);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalStateException e) {
            result.setErrno(1);
            e.printStackTrace();
        }
        return result;
    }


    @RequestMapping("/removeClub")
    public @ResponseBody Integer removeClub(String id){
        clubService.removeClub(id);
        return 1;
    }

    @RequestMapping("/modifyClub")
    public @ResponseBody void modifyClub(String id,String clubName,String categoryId,String founder,String attached,String crateDate,Double dues,String introduction){
        try {
            Club club = new Club();
            club.setId(id);
            club.setClubName(clubName);
            club.setCategoryId(categoryId);
            club.setFounder(founder);
            club.setAttached(attached);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            club.setCreateDate(sdf.parse(crateDate));
            club.setDues(dues);
            club.setIntroduction(introduction);

            clubService.modifyClub(club);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/queryAllClub")
    public @ResponseBody Map<String,Object> queryAllClub(@RequestParam("page")Integer nowPage, @RequestParam("rows")Integer pageSize,String clubName){

        Page page = new Page();
        page.setPageIndex(nowPage);
        page.setSingleRows(pageSize);

        Club club = new Club();
        club.setClubName(clubName);

        return clubService.queryAllClub(page,club);

    }


    @RequestMapping("/countClubCategory")
    public @ResponseBody Map<String,Object> countClubCategory(){
        return clubService.countClubCategory();
    }


    @RequestMapping("/countClubRegister")
    public @ResponseBody Map<String,Object> countClubRegister(){
        return clubService.countClubRegisterInfo();
    }

}
