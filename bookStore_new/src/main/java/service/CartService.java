package service;

import pojo.Cart;

import java.util.List;

public interface CartService {
    List<Cart> getCartList(Integer uesr_id);
    int deleteCartByBidUid(Integer book_id,Integer user_id);
}
