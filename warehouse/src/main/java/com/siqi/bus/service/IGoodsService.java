package com.siqi.bus.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.siqi.bus.entity.Goods;

import java.util.List;

/**
 * <p>
 * InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`) 服务类
 * </p>
 *
 * @Author: 索朗杰布，张洋彬
 * @Date: 2022/12/30
 */
public interface IGoodsService extends IService<Goods> {

    /**
     * 根据商品id删除商品
     * @param id
     */
    void deleteGoodsById(Integer id);

    /**
     * 加载所有的库存预警商品
     * @return
     */
    List<Goods> loadAllWarning();
}
