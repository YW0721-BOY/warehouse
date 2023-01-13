package com.siqi.sys.vo;

import com.siqi.sys.entity.Dept;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author: ZYB-
 * @Date: 2023/1/2 8:21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DeptVo extends Dept {

    private Integer page=1;
    private Integer limit=10;

}
