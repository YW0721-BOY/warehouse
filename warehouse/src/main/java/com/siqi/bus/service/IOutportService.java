package com.siqi.bus.service;

import com.siqi.bus.entity.Outport;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * InnoDB free: 9216 kB 服务类
 * </p>
 *
 * @Author: 索朗杰布，张洋彬
 * @Date: 2022/12/31
 */
public interface IOutportService extends IService<Outport> {

    /**
     * 对商品进货进行退货处理
     * @param id    进货单ID
     * @param number    退货数量
     * @param remark    备注
     */
    void addOutport(Integer id, Integer number, String remark);
}
