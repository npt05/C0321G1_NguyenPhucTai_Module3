package service;

import model.Product;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService {
    private static Map<Integer, Product> products = new HashMap<>();

    static {

        products.put(1, new Product(1, "Laptop1", 10000, "Đẹp", "HP"));
        products.put(2, new Product(2, "Laptop2", 20000, "Đẹp ngon", "CodeGym"));
        products.put(3, new Product(3, "Laptop3", 30000, "Đẹp tốn tiền", "HP"));
        products.put(4, new Product(4, "Laptop4", 40000, "Đẹp bền ", "Code"));
        products.put(5, new Product(5, "Laptop5", 50000, "Đẹp xịn", "HP"));
    }

    public List<Product> showAll() {
        return new ArrayList<Product>(products.values());
    }

    public void create(Product product) {
        products.put(product.getId(), product);
    }

    public void update(int id, Product product) {
        products.put(id, product);
    }

    public void delete(int id) {
        products.remove(id);
    }

    public Product findByID(int id) {
        return products.get(id);
    }

    public Product findByName(String name) {
        List<Product> productList = showAll();
        for (Product product:productList){
            if(name.equalsIgnoreCase(product.getName())){
                return product;
            }
        }
        return null;
    }
}
