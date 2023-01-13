package com.siqi.bus.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.siqi.bus.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`) Mapper 接口
 * </p>
 *
 * @Author: 索朗杰布，张洋彬
 * @Date: 2022/12/30
 */
public interface GoodsMapper extends BaseMapper<Goods> {

    /**
     * 根据商品id删除商品销售信息
     * @param id1
     */
    void deleteSaleByGoodsId(@Param("goodsid") Integer id1);

    /**
     * 根据商品id删除商品销售退货信息
     * @param id1
     */
    void deleteSaleBackByGoodsId(@Param("goodsid") Integer id1);

    /**
     * 根据商品id删除商品进货信息
     * @param id
     */
    void deleteInportByGoodsId(@Param("goodsid") Integer id);


    /**
     * 根据商品id删除商品退货信息
     * @param id
     */
    void deleteOutportByGoodsId(@Param("goodsid") Integer id);

    /**
     * 根据客户id删除商品销售
     * @param id    客户id
     */
    void deleteSaleByCustomerId(Integer id);

    /**
     * 根据客户id删除商品销售退货信息
     * @param id    客户id
     */
    void deleteSaleBackByCustomerId(Integer id);

    /**
     * 加载所有库存预警商品
     */
    List<Goods> loadAllWarning();
}
