/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author d
 */
public class Cart {

    private Map<String, List<Item>> listCart = new HashMap<>();

    public Cart(String userName, Item[] items, Item item) {
        listCart.put(userName, new ArrayList<>());
        if (items != null) {
            listCart.get(userName).addAll(Arrays.asList(items));
        }
        if (item != null) {
            addItem(item, userName);
        }
    }

    public int getQuantityById(int id, String userName) {
        return getItemById(userName, id).getQuantity();
    }

    public Item getItemById(String userName, int id) {
        for (Item item : listCart.get(userName)) {
            if (item.getBook().getBook_id() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(Item item, String userName) {
        Item itemCart = getItemById(userName, item.getBook().getBook_id());
        if (itemCart != null) {
            itemCart.setQuantity(item.getQuantity() + itemCart.getQuantity());
        } else {
            listCart.get(userName).add(item);
        }
    }

    public void deleteItem(int id, String userName) {
        Item itemCart = getItemById(userName, id);
        if (itemCart != null) {
            listCart.get(userName).remove(itemCart);
        }
    }

    public double totalMoney(String userName) {
        double sum = 0;
        for (Item item : listCart.get(userName)) {
            sum += (item.getPrice() * item.getQuantity());
        }
        return sum;
    }

    public Map<String, List<Item>> getListCart() {
        return listCart;
    }

    public void setListCart(Map<String, List<Item>> listCart) {
        this.listCart = listCart;
    }

}
