import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  // list of items on sale
  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color]
    ['Apple', '4.00', 'images/fruit1-removebg.png', Colors.green],
    ['Banana', '2.80', 'images/fruit2-removebg.png', Colors.yellow],
    ['Chicken', '3.00', 'images/chicken1-removebg.png', Colors.brown],
    ['water', '4.00',   'images/water-removeb.png', Colors.blue],
  ];

//list of cart items
List _cartItems = [];

get shopItems => _shopItems;

get cartItems => _cartItems;

// add item to cart
void addItemToCart(int index){
  _cartItems.add(_shopItems[index]);
  notifyListeners();
}
// remove item from cart
void removeItemFromCart(int index){
  _cartItems.removeAt(index);
  notifyListeners();
}
// calculate total price
String calculateTotal(){
  double totalPrice = 0;

  for(int i=0; i<_cartItems.length; i++){
     totalPrice += double.parse(_cartItems[i][1]);
  }
  return totalPrice.toStringAsFixed(2);
}
}