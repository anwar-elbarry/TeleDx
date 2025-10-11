package com.teleDx.dao.role;

import com.teleDx.entity.Enums.RoleName;
import com.teleDx.entity.Role;

public interface RoleDAO {
    Role save(String name);
    Role findByName(RoleName roleName);
}
