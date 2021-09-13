package com.valenty.my.shop.web.admin.service;

import com.valenty.my.shop.commons.dto.BaseResult;
import com.valenty.my.shop.domain.TbUser;

import java.util.List;

public interface TbUserService {
    /**
     * 查询全部用户信息
     * @return
     */
    List<TbUser> selectAll();

    /**
     * 插入数据
     * @param tbUser
     */
    void insert(TbUser tbUser);

    /**
     * 保存用户数据
     * @param tbUser
     */
    BaseResult save(TbUser tbUser);

    void delete(Long id);

    TbUser getById(Long id);

    void update(TbUser tbUser);

    List<TbUser> selectByUserName(String userName);

    TbUser login(String email,String password);

    List<TbUser> search(String keyWord);

    /**
     *
     * @param tbUser
     * @return
     */
    List<TbUser> search(TbUser tbUser);

    /**
     * 批量删除
     * @param ids
     */
    void deleteMulti(String[] ids);
}
