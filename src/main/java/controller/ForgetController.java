package controller;

import dao.UserTableMapper;
import model.UserTable;
import model.UserTableExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping
public class ForgetController {
    @Autowired
    UserTableMapper userMapper;
    @Autowired
    JavaMailSenderImpl emial;

    @RequestMapping("/forget")
    public String forgetPage(){
        return "forget";
    }


    @RequestMapping("/emailCode")
    @ResponseBody
    public String forget(HttpSession session, String email) {
        String result=null;
        List<UserTable> list=null;
        if (email==null||email=="") {
            result="the email is null or wrong!";
        } else {
            int temp = (int) ((Math.random() + 0.1) * 10000);
            if (temp > 9999) {
                temp -= 1000;
            }
            session.setAttribute("code", temp + "");

            UserTableExample user = new UserTableExample();
            UserTableExample.Criteria criteria = user.createCriteria();
            criteria.andEmilEqualTo(email);
            list = userMapper.selectByExample(user);
            System.out.println(list.size());
            if (list.size() != 1) {
                result="something unknowed happened,please call the manager!";
            } else {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setFrom("your qq email!");
                message.setTo(email);
                message.setSubject("这是网络论坛的修改密码邮件！");
                message.setText(list.get(0).getName() + "---您的验证码是：" + temp);
                emial.send(message);
                result= "send success";
                System.out.println(temp + email);
            }
        }

        return result;
    }

    @RequestMapping("/changePassword")
    public ModelAndView changePsw(HttpSession session, String email, String code, String password){
        ModelAndView modelAndView=new ModelAndView();
        System.out.println(code+" "+session.getAttribute("code"));
        if(code!=null&&session.getAttribute("code").toString().equals(code)){
            UserTable user=new UserTable();
            user.setEmil(email);
            user.setPassword(password);
            userMapper.updateByEmail(user);
            modelAndView.setViewName("login");
        }else{
            modelAndView.setViewName("forget");
        }
        return modelAndView;
    }
}
