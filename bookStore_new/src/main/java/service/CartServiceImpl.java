package service;

import mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Cart;
import pojo.CartExample;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartMapper cartMapper;

    @Override
    public List<Cart> getCartList(Integer uesr_id) {

        CartExample cartExample=new CartExample();
        cartExample.or().andUserIdEqualTo(uesr_id);
        List<Cart> cartList= cartMapper.selectByExample(cartExample);


        return cartList;
    }

    public int deleteCartByBidUid(Integer book_id,Integer user_id)
    {
        CartExample cartExample=new CartExample();
        cartExample.or().andUserIdEqualTo(user_id).andBookIdEqualTo(book_id);
        int i=cartMapper.deleteByExample(cartExample);
        return i;

    }
}








