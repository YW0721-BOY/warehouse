package com.siqi.sys.vo;

import com.siqi.sys.entity.Permission;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author: ZYB-
 * @Date: 2023/1/2 8:21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PermissionVo extends Permission {

    private Integer page=1;
    private Integer limit=10;
}
