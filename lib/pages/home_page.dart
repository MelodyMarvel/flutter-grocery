// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/components/grocery_item_tile.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:grocery_store_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) { 
              return CartPage();
            }
      )),
      child: Icon(Icons.shopping_bag ),
      ),
      body: SafeArea(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Good Morning,'),
          ),

            SizedBox(height: 4,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Let\'s order fresh items for you',
            style: GoogleFonts.notoSerif(
              fontSize: 36,
              fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 24,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Fresh Itmes', 
            style: TextStyle(
              fontSize: 16
            ),),
          ),

          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child){
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.2,
              ),
               itemBuilder: (context, index){
                return GroceryItemTile(
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                  onPressed: (){
                    Provider.of<CartModel>(context, listen:false)
                      .addItemToCart(index);
                  },
                  );
               }
               );
              },)
          )
        ],
      ),),
    );
  }
}