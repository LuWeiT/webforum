package controller;

import dao.UserTableMapper;
import model.UserTable;
import model.UserTableExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping
public class registerController {

    @Autowired
    UserTableMapper userMapper;

    @RequestMapping(value = "/registerService", method = RequestMethod.POST)
    public ModelAndView register(UserTable userTable) {
        ModelAndView modelAndView = new ModelAndView();
        UserTableExample select = new UserTableExample();
        UserTableExample.Criteria criteria = select.createCriteria();
        criteria.andNameEqualTo(userTable.getName());
        String strName;
        try {
            strName = new String(userTable.getName().getBytes("iso-8859-1"), "utf-8");
            userTable.setName(strName);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<UserTable> selectName = userMapper.selectByExample(select);
        if (selectName.size() == 0 && userTable.getName() != null && userMapper.insert(userTable) != -1) {
            modelAndView.setViewName("registerSuccess");
        } else {
            modelAndView.addObject("message", "用户名重复!");
            modelAndView.addObject("user", userTable);
            modelAndView.setViewName("register");
        }

        return modelAndView;
    }

    @RequestMapping("/register")
    public ModelAndView registers() {
        ModelAndView modelAndVie = new ModelAndView();
        modelAndVie.setViewName("register");
        return modelAndVie;
    }

}
