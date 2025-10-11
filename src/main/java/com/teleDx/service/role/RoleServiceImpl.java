package com.teleDx.service.role;

import com.teleDx.dao.role.RoleDAOImpl;
import com.teleDx.entity.Enums.RoleName;
import com.teleDx.entity.Role;

public class RoleServiceImpl implements RoleService{
    private final RoleDAOImpl roleDAOImpl;

    public RoleServiceImpl(RoleDAOImpl roleDAOImpl) {
        this.roleDAOImpl = roleDAOImpl;
    }
    @Override
    public Role save(String name) {
        return roleDAOImpl.save(name);
    }

    @Override
    public Role findByName(RoleName name) {
        return roleDAOImpl.findByName(name);
    }
}
