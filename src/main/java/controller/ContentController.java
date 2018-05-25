package controller;

import dao.PostTableMapper;
import dao.ReplyTableMapper;
import model.PostTableExample;
import model.PostTableWithBLOBs;
import model.ReplyTable;
import model.ReplyTableExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping

public class ContentController {
    @Autowired
    PostTableMapper postMapper;
    @Autowired
    ReplyTableMapper replyTableMapper;
    @RequestMapping("/content")
    public ModelAndView content(int post_id) {
        ModelAndView modelAndView = new ModelAndView();
        PostTableExample post = new PostTableExample();
        PostTableExample.Criteria criteria = post.createCriteria();
        criteria.andIdEqualTo(post_id);

        List<PostTableWithBLOBs> postlist = postMapper.selectByExampleWithBLOBs(post);
        modelAndView.addObject("post", postlist.get(0));

        ReplyTableExample replyselect = new ReplyTableExample();
        ReplyTableExample.Criteria criteria2 = replyselect.createCriteria();
        criteria2.andPostIdEqualTo(post_id);
        List<ReplyTable> replyList = replyTableMapper.selectByExampleWithBLOBs(replyselect);
        modelAndView.addObject("replylist", replyList);
        modelAndView.setViewName("content");
        return modelAndView;
    }
}
