package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class CancelController {
    @RequestMapping("/cancel")
    public ModelAndView cancel() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user_name", "null");

        modelAndView.setViewName("login");
        return modelAndView;
    }
}
