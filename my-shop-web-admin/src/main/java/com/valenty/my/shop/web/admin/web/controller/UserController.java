package com.valenty.my.shop.web.admin.web.controller;

import com.valenty.my.shop.commons.dto.BaseResult;
import com.valenty.my.shop.domain.TbUser;
import com.valenty.my.shop.web.admin.service.TbUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private TbUserService tbUserService;

    //表单初始化
    @ModelAttribute
    public TbUser getTbUser(Long id) {
        System.out.println("Hi Model Attribute");
        TbUser tbUser = null;
        if (id!=null) {
            tbUser = tbUserService.getById(id);
        } else {
            tbUser = new TbUser();
        }
        return tbUser;
    }

    /**
     * 用户列表
     * @param model
     * @return
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(Model model) {
        System.out.println("请求List");
        List<TbUser> tbUsers = tbUserService.selectAll();
        model.addAttribute("tbUsers",tbUsers);
        return "user_list";
    }

    /**
     * 跳转用户表单页面
     * @return
     */
    @RequestMapping(value = "form",method = RequestMethod.GET)
    public String form() {
        System.out.println("请求form");
        return "user_form";
    }

    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(TbUser tbUser, RedirectAttributes redirectAttributes,Model model) {
        BaseResult baseResult = tbUserService.save(tbUser);
        //保存成功，跳转页面，需要使用RedirectAttributes来跳转
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/user/list";
        } else {//保存失败，在当前页面刷新
            model.addAttribute("baseResult",baseResult);
            return "user_form";
        }
    }

    /**
     *
     * @param tbUser
     * @param model
     * @return
     */
    @RequestMapping(value = "search",method = RequestMethod.POST)
    public String search(TbUser tbUser,Model model) {
        List<TbUser> tbUsers = tbUserService.search(tbUser);
        model.addAttribute("tbUsers",tbUsers);
        return "user_list";
    }


    /**
     * 删除用户信息
     * @param ids
     * @return
     */
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public BaseResult delete(String ids) {
        if (!StringUtils.isEmpty(ids)) {
            String[] idArray = ids.split(",");
            tbUserService.deleteMulti(idArray);
            return BaseResult.success("删除成功");
        } else {
            return BaseResult.fail("删除失败");
        }
    }
}
