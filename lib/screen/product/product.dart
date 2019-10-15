import 'package:banananina/screen/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductScreen extends StatefulWidget {
  static String tag = 'product-screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String porductName = '';
  String productTitle = '';

  @override
  void initState() {
    super.initState();
    getProductDetail();
  }

  getProductDetail() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      porductName = prefs.getString('product_name');
      productTitle = prefs.getString('product_title');
    });
  }

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
            SizedBox(height: 8),
            Center(
              child: Text('$productTitle',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            //Bottom Margin
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
