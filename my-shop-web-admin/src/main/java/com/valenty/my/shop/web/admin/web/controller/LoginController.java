package com.valenty.my.shop.web.admin.web.controller;

import com.valenty.my.shop.commons.constant.ConstantUtil;
import com.valenty.my.shop.domain.TbUser;
import com.valenty.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    private static final String USER_INFO_COOKIE = "userInfo";
//    @Autowired
//    private UserService userService;

    @Autowired
    private TbUserService tbUserService;

    @RequestMapping(value = {"","login"},method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(@RequestParam(required = true) String email, @RequestParam(required = true)String password, HttpServletRequest httpServletRequest, Model model) {
        TbUser user = tbUserService.login(email,password);
        if (user!=null) {
            httpServletRequest.getSession().setAttribute(ConstantUtil.SESSION_USER,user);
            return "redirect:/main";
        } else {
            model.addAttribute("message","登录失败");
            return login();
        }
    }

    /**
     * 注销
     * @param httpServletRequest
     * @return
     */
    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();
        return login();
    }

}
