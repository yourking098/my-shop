package com.valenty.my.shop.web.admin.dao;

import com.valenty.my.shop.domain.TbUser;

import java.util.List;

public interface TbUserDao {

    List<TbUser> selectAll();

    void insert(TbUser tbUser);

    void delete(Long id);

    TbUser getById(Long id);

    void update(TbUser tbUser);

    List<TbUser> selectByUserName(String userName);

    TbUser getByEmail(String email);

    List<TbUser> search(TbUser tbUser);

    /**
     * 删除功能
     * @param ids
     */
    void deleteMulti(String[] ids);
}
