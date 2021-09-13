package com.valenty.my.shop.web.admin.service.test;

import com.valenty.my.shop.domain.TbUser;
import com.valenty.my.shop.web.admin.service.TbUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml","classpath:spring-context-druid.xml","classpath:spring-context-mybatis.xml"})
public class TbUserServiceTest {
    @Autowired
    private TbUserService tbUserService;
    @Test
    public void testSelectAll() {
        List<TbUser> tbUsers = tbUserService.selectAll();
        for (TbUser tbUser:tbUsers) {
            System.out.println(tbUser.getUsername());
        }
    }

    @Test
    public void testInsert() {
        TbUser tbUser = new TbUser();
        tbUser.setUsername("valenty");
        tbUser.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
        tbUser.setPhone("15985852013");
        tbUser.setEmail("465918193@qq.com");
        tbUser.setCreated(new Date());
        tbUser.setUpdated(new Date());
        tbUserService.insert(tbUser);
    }

    @Test
    public void testDelete() {
        tbUserService.delete(38L);
    }


    @Test
    public void testGetById() {
        TbUser tbUser = tbUserService.getById(39L);
        System.out.println(tbUser.getUsername());
    }

    @Test
    public void testUpdate() {
        TbUser tbUser = tbUserService.getById(39L);
        tbUser.setUsername("valenty1");
        tbUserService.update(tbUser);
    }

    @Test
    public void testSelectByUserName() {
        List<TbUser> tbUsers = tbUserService.selectByUserName("uni");
        for (TbUser user : tbUsers) {
            System.out.println(user.getUsername());
        }
    }



}
