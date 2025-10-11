package com.teleDx.service.role;

import com.teleDx.entity.Enums.RoleName;
import com.teleDx.entity.Role;

public interface RoleService {
    Role save(String name);
    Role findByName(RoleName name);
}
