package com.freshgarden.service;

import org.springframework.stereotype.Service;

import com.freshgarden.exception.ProductException;
import com.freshgarden.model.Cart;
import com.freshgarden.model.CartItem;
import com.freshgarden.model.Product;
import com.freshgarden.model.User;
import com.freshgarden.repository.CartRepository;
import com.freshgarden.request.AddItemRequest;

@Service
public class CartServiceImplementation implements CartService {

    private CartRepository cartRepository;
    private CartItemService cartItemService;
    private ProductService productService;

    public CartServiceImplementation(CartRepository cartRepository, CartItemService cartItemService,
                                     ProductService productService, UserService userService) {
        this.cartRepository = cartRepository;
        this.cartItemService = cartItemService;
        this.productService = productService;
    }

    @Override
    public Cart createCart(User user) {
        Cart cart = new Cart();
        cart.setUser(user);
        return cartRepository.save(cart);
    }

    @Override
    public String addCartItem(Long userId, AddItemRequest req) throws ProductException {
    	Cart cart = cartRepository.findByUserId(userId);
		Product product = productService.findProductById(req.getProductId());

        CartItem isPresent = cartItemService.isCartItemExist(cart, product, req.getSize(), userId);

        if (isPresent == null) {
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setCart(cart);
            cartItem.setCountInStock(req.getCountInStock());
            cartItem.setUserId(userId);

            double price = req.getCountInStock() * product.getDiscountedPrice();
            cartItem.setPrice(price);
            cartItem.setSize(req.getSize());

            CartItem createdCartItem = cartItemService.createCartItem(cartItem);
            cart.getCartItems().add(createdCartItem);
        }
        return "Item Added To Cart";
    }

    @Override
    public Cart findUserCart(Long userId) {
        Cart cart = cartRepository.findByUserId(userId);

        double totalPrice = 0;
        double totalDiscountedPrice = 0;
        int totalItem = 0;

        for (CartItem cartItem : cart.getCartItems()) {
            totalPrice = totalPrice + cartItem.getPrice();
            totalDiscountedPrice = totalDiscountedPrice + cartItem.getDiscountedPrice();
            totalItem = totalItem + cartItem.getCountInStock();
        }

        cart.setTotalDiscountedPrice(totalDiscountedPrice);
        cart.setTotalItem(totalItem);
        cart.setTotalPrice(totalPrice);
        cart.setDiscounted(totalPrice - totalDiscountedPrice);

        return cartRepository.save(cart);
    }
}
