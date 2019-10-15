import 'package:banananina/screen/home/home.dart';
import 'package:banananina/screen/login/login.dart';
import 'package:banananina/screen/product/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}

class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
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
    );
  }
}
