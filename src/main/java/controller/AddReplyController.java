package controller;

import dao.PostTableMapper;
import dao.ReplyTableMapper;
import model.PostTable;
import model.ReplyTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.util.Date;

@Controller
@RequestMapping
public class AddReplyController {
    @Autowired
    PostTableMapper postMapper;
    @Autowired
    ReplyTableMapper replyTableMapper;


    @RequestMapping("/AddReply")
    public ModelAndView addreply(ReplyTable replyTable) {
        ModelAndView m = new ModelAndView();
        String strUsername, strContent;
        try {
            strContent = new String(replyTable.getReplyContent().getBytes("iso-8859-1"), "utf-8");
            strUsername = new String(replyTable.getUsername().getBytes("iso-8859-1"), "utf-8");
            replyTable.setTime(new Date());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            strContent = replyTable.getReplyContent();
            strUsername = replyTable.getUsername();
        }
        replyTable.setReplyContent(strContent);
        replyTable.setUsername(strUsername);
        replyTableMapper.insertSelective(replyTable);
        PostTable postTable = new PostTable();
        postTable.setReplaynumber(Integer.valueOf(replyTable.getFloor()));
        postTable.setId(replyTable.getPostId());
        postMapper.updateFloor(postTable);

        m.addObject("post_id", replyTable.getPostId());
        m.setViewName("redirect:./content");
        return m;
    }
}
