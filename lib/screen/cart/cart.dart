import 'package:banananina/screen/home/home.dart';
import 'package:banananina/screen/login/login.dart';
import 'package:banananina/screen/product/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: ListTile(
                  title: Text("HOME",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'new_in');
                prefs.setString('product_title', 'NEW IN');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title: Text("NEW IN",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'bags');
                prefs.setString('product_title', 'BAGS');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title:
                    Text("BAGS", style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'acc');
                prefs.setString('product_title', 'ACCESSORIES');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title: Text("ACCESSORIES",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'shoes');
                prefs.setString('product_title', 'SHOES');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title: Text("SHOES",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'men');
                prefs.setString('product_title', 'MEN');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title:
                    Text("MEN", style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                title: Text("PRELOVED",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                title: Text("DESIGNER",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'preorder');
                prefs.setString('product_title', 'PRE-ORDER');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title: Text("PRE-ORDER",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'sale');
                prefs.setString('product_title', 'SALE');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title: Text("SALE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setString('product_name', 'magazine');
                prefs.setString('product_title', 'MAGAZINE');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: ListTile(
                title: Text("MAGAZINE",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: ListTile(
                title: Text("SIGN IN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFC69C6D))),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool('login', false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: ListTile(
                title: Text("SIGN OUT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFC69C6D))),
              ),
            ),
          ],
        ),
      ),
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
