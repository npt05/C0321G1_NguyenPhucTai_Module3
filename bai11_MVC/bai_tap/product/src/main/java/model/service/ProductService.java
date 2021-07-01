package service;

import model.bean.Product;

import java.util.List;

public interface ProductService {
    void save(Product product);
    void remove(int id);
    Product findById(int id);
    Product findByName(String name);
    void update(int id,Product product);
    List<Product> findAll();
}