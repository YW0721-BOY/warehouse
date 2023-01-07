package com.siqi.sys.vo;

import com.siqi.sys.entity.Dept;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author: 落亦-
 * @Date: 2019/11/26 11:07
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DeptVo extends Dept {

    private Integer page=1;
    private Integer limit=10;

}
