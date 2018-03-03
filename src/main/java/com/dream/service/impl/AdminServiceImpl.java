package com.dream.service.impl;

import com.dream.common.E3Result;
import com.dream.mapper.AdminMapper;
import com.dream.po.Admin;
import com.dream.po.AdminExample;
import com.dream.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public E3Result adminLogin(String adminname, String adminpassword) {

        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria  = example.createCriteria();
        criteria.andAdminnameEqualTo(adminname);
        List<Admin> list = adminMapper.selectByExample(example);

        // 如果没有此用户名
        if (null == list || list.size() == 0) {
            return E3Result.build(400, "用户名或密码错误");
        }
        Admin admin = list.get(0);
        // 对比密码
        if (!adminpassword.equals(admin.getAdminpassword())) {
            return E3Result.build(400, "用户名或密码错误");
        }
        return E3Result.ok();
    }


}
