package controller;


import dao.UserTableMapper;
import model.UserTable;
import model.UserTableExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping
@SessionAttributes(names = {"user_name"})

public class LoginController {
    @Autowired
    UserTableMapper userMapper;

    @RequestMapping("/login")
    public ModelAndView modelAndView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = "/loginService", method = RequestMethod.POST)
    public ModelAndView loginService(String username, String password) {
        ModelAndView modelAndView = new ModelAndView();
        UserTableExample select = new UserTableExample();
        UserTableExample.Criteria criteria = select.createCriteria();
        String name;
        try {
            name = new String(username.getBytes("iso-8859-1"), "utf-8");

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            name = username;
        }
        criteria.andNameEqualTo(name);
        List<UserTable> selectName = userMapper.selectByExample(select);
        if (selectName.size() == 1) {
            criteria.andPasswordEqualTo(password);
            List<UserTable> selectuser = userMapper.selectByExample(select);
            if (selectuser.size() == 0) {
                modelAndView.addObject("passwordMessage", "密码错误");
                modelAndView.setViewName("login");
            } else {
                modelAndView.addObject("user_name", name);
                modelAndView.setViewName("redirect:./index");
            }
        } else {
            modelAndView.addObject("nameMessage", "用户名不存在！");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
}
