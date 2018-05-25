package controller;

import dao.PostTableMapper;
import model.PostTable;
import model.PostTableExample;
import model.PostTableWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping

public class indexController {

    @Autowired
    PostTableMapper postMapper;

    @RequestMapping("/index")
    public ModelAndView index(@SessionAttribute(value = "user_name", required = false) String name) {
        ModelAndView modelAndView = new ModelAndView();

        PostTableExample post = new PostTableExample();
        PostTableExample.Criteria criteria = post.createCriteria();
        criteria.andIdNotEqualTo(0);

        List<PostTable> postlist = postMapper.selectByExample(post);
        List<PostTableWithBLOBs> postWithBLOBs = postMapper.selectByExampleWithBLOBs(post);
        modelAndView.addObject("postList", postlist);
        modelAndView.addObject("postBLOB", postWithBLOBs);

        modelAndView.setViewName("index");
        return modelAndView;
    }
}
