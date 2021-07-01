package model.service;

import model.bean.Product;
import model.repository.ProductRepository;
import model.repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService{
    private  ProductRepository service = new ProductRepositoryImpl();
    @Override
    public void save(Product product) {
        service.save(product);
    }

    @Override
    public void remove(int id) {
        service.remove(id);
    }

    @Override
    public Product findById(int id) {
        return service.findById(id);
    }

    @Override
    public Product findByName(String name) {
        return service.findByName(name);
    }

    @Override
    public void update(int id, Product product) {
        service.update(id,product);
    }

    @Override
    public List<Product> findAll() {
        return service.findAll();
    }
}