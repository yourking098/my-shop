package com.valenty.my.shop.web.admin.service.impl;

import com.valenty.my.shop.commons.dto.BaseResult;
import com.valenty.my.shop.commons.utils.RegexpUtils;
import com.valenty.my.shop.domain.TbUser;
import com.valenty.my.shop.web.admin.dao.TbUserDao;
import com.valenty.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class TbUserServiceImpl implements TbUserService {

    @Autowired
    private TbUserDao tbUserDao;

    @Override
    public List<TbUser> selectAll() {
        return tbUserDao.selectAll();
    }

    @Override
    public void insert(TbUser tbUser) {
        tbUserDao.insert(tbUser);
    }

    @Override
    public BaseResult save(TbUser tbUser) {
        BaseResult baseResult = checkTbUser(tbUser);
        tbUser.setUpdated(new Date());
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            if (tbUser.getId() != null && tbUser.getId() > 0L) {//修改
                tbUserDao.update(tbUser);
            } else {//新增
                tbUser.setPassword(DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes()));
                tbUser.setCreated(new Date());
                tbUserDao.insert(tbUser);
            }
            baseResult.setMesssage("保存用户信息成功");
        }

        return baseResult;
    }

    @Override
    public void delete(Long id) {
        tbUserDao.delete(id);
    }

    @Override
    public TbUser getById(Long id) {
        return tbUserDao.getById(id);
    }

    @Override
    public void update(TbUser tbUser) {
        tbUserDao.update(tbUser);
    }

    @Override
    public List<TbUser> selectByUserName(String userName) {
        return tbUserDao.selectByUserName(userName);
    }

    @Override
    public TbUser login(String email, String password) {
        TbUser tbUser = tbUserDao.getByEmail(email);
        if (tbUser!=null) {
            String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());
            if (md5Password.equals(tbUser.getPassword())) {
                return tbUser;
            }
        }
        return null;
    }

    /**
     * 用户信息的有效验证
     * @param tbUser
     */
    private BaseResult checkTbUser(TbUser tbUser) {
        BaseResult baseResult = BaseResult.success();
        if (StringUtils.isEmpty(tbUser.getEmail())) {
            return BaseResult.fail("邮箱不能为空，请重新输入");
        } else if(!RegexpUtils.checkEmail(tbUser.getEmail())) {
            return BaseResult.fail("邮箱格式不正确，请重新输入");
        } else if (StringUtils.isEmpty(tbUser.getUsername())) {
            return BaseResult.fail("姓名不能为空，请重新输入");
        } else if (StringUtils.isEmpty(tbUser.getPhone())) {
            return BaseResult.fail("手机号不能为空，请重新输入");
        } else if (!RegexpUtils.checkPhone(tbUser.getPhone())) {
            return BaseResult.fail("手机号格式不正确，请重新输入");
        } else if (StringUtils.isEmpty(tbUser.getPassword())) {
            return BaseResult.fail("密码不能为空，请重新输入");
        }
        return baseResult;
    }

    @Override
    public List<TbUser> search(String keyWord) {
        TbUser tbUser = new TbUser();
        tbUser.setUsername(keyWord);
        tbUser.setEmail(keyWord);
        tbUser.setPhone(keyWord);
        return tbUserDao.search(tbUser);
    }

    @Override
    public List<TbUser> search(TbUser tbUser) {
        return tbUserDao.search(tbUser);
    }
    @Override
    public void deleteMulti(String[] ids) {
        tbUserDao.deleteMulti(ids);
    }
}
