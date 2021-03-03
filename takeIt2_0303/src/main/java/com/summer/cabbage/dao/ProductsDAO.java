package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Product;

public interface ProductsDAO {

	List<Product> selectByGiverNo(int giverNo);

}
