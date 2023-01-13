package com.siqi.sys.vo;

import com.siqi.sys.entity.User;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author: ZYB-
 * @Date: 2023/1/2 8:21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserVo extends User {

    private Integer page=1;
    private Integer limit=10;

    /**
     * 验证码
     */
    private String code;
}
