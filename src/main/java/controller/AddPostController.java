package controller;

import dao.PostTableMapper;
import model.PostTableWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.util.Date;

@Controller
@RequestMapping
public class AddPostController {
    @Autowired
    PostTableMapper postMapper;
    @RequestMapping(value = "/AddPost", method = RequestMethod.POST)
    public ModelAndView addpost(String title, String content, @SessionAttribute(value = "user_name", required = true) String name) {
        String strTitle, strContent;
        try {
            strTitle = new String(title.getBytes("iso-8859-1"), "utf-8");
            strContent = new String(content.getBytes("iso-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            strContent = content;
            strTitle = title;
        }
        PostTableWithBLOBs postTableWithBLOBs = new PostTableWithBLOBs();
        postTableWithBLOBs.setContent(strContent);
        postTableWithBLOBs.setTitle(strTitle);
        postTableWithBLOBs.setReplaynumber(0);
        postTableWithBLOBs.setTime(new Date());
        postTableWithBLOBs.setUsername(name);
        postMapper.insert(postTableWithBLOBs);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:./index");
        return modelAndView;
    }

}
