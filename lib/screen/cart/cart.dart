import 'package:banananina/screen/drawer/drawer.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static String tag = 'cart-screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/icon/icon-bag.png',
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/icon/icon-search.png',
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset('assets/banananina_logo_mobile.png', scale: 4),
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      drawer: DrawerOnly(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            SizedBox(height: 32),
            Center(
              child: Text('SHOPPING CART IS EMPTY',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
            Center(
              child: Text('You have no items in your shopping cart.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
            SizedBox(height: 8),
            Center(
              child: Text('Click here to continue shopping.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),

            //Bottom Margin
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
