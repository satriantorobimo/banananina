import 'package:banananina/screen/cart/cart.dart';
import 'package:banananina/screen/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeScreen extends StatefulWidget {
  static String tag = 'home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void gotoProduct(String productName, String productTitle) {}

  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token) {
      print("token : $token");
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/icon/icon-bag.png',
              ),
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
            Image.asset('assets/images/banner_-_warm_fuzzy_feeling.jpg'),
            SizedBox(height: 8),
            Image.asset('assets/images/sept-announce-sell-2.jpg'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-sale.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('SALE',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-new-in.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('NEW IN',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-bags.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('BAGS',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  //padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-preloved.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('PRELOVED',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-accessories.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('ACCESSORIES',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-shoes.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('SHOES',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-men.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('MEN',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-designer.jpg',
                        scale: MediaQuery.of(context).size.width * 0.012,
                      ),
                      SizedBox(height: 8),
                      Text('DESIGNER',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 16),
            Column(
              children: <Widget>[
                Image.asset('assets/images/sept-gift-wraping.jpg'),
                SizedBox(height: 8),
                Text('Gift Wrapping',
                    style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('LEARN MORE',
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 12),
            Column(
              children: <Widget>[
                Image.asset('assets/images/sept-preorder.jpg'),
                SizedBox(height: 8),
                Text('Pre-Order Service by Banananina',
                    style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('LEARN MORE',
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 12),
            Column(
              children: <Widget>[
                Image.asset('assets/images/sept-under-3-mio.jpg'),
                SizedBox(height: 8),
                Text('Gift Guide under 3 mio',
                    style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('LEARN MORE',
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 12),
            Column(
              children: <Widget>[
                Image.asset('assets/images/sept-preloved-big.jpg'),
                SizedBox(height: 8),
                Text('Preloved by Banananina',
                    style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('LEARN MORE',
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 12),
            Column(
              children: <Widget>[
                Image.asset('assets/images/sept-minis.jpg'),
                SizedBox(height: 8),
                Text('Classic Minis',
                    style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('LEARN MORE',
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 12),
            Column(
              children: <Widget>[
                Image.asset('assets/images/sept-brand-we-love.gif'),
                SizedBox(height: 8),
                Text('Brand We Love: Gucci',
                    style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('LEARN MORE',
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 12),
            Container(
              width: double.infinity,
              child: Divider(),
            ),

            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-totebags.jpg',
                        scale: 2.5,
                      ),
                      SizedBox(height: 8),
                      Text('TOTES',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-crossbody.jpg',
                        scale: 2.5,
                      ),
                      SizedBox(height: 8),
                      Text('CROSSBODY',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-shoulder.jpg',
                        scale: 2.5,
                      ),
                      SizedBox(height: 8),
                      Text('SHOULDER BAGS',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-wallets.jpg',
                        scale: 2.5,
                      ),
                      SizedBox(height: 8),
                      Text('WALLETS',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-watches.jpg',
                        scale: 2.5,
                      ),
                      SizedBox(height: 8),
                      Text('WATCHES',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/sept-shoes-2.jpg',
                        scale: 2.5,
                      ),
                      SizedBox(height: 8),
                      Text('SHOES',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),
            Container(
              width: double.infinity,
              child: Divider(),
            ),

            SizedBox(height: 16),
            Center(
                child: Text('NEW THIS WEEK',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold))),

            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/00548556_m.jpg',
                        scale: 4.2,
                      ),
                      SizedBox(height: 8),
                      Text('LONGCHAMP',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Le Pliage LGP Medium SH Black White',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.020)),
                      SizedBox(height: 8),
                      Text('IDR 4.000.000',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/00548549_m.jpg',
                        scale: 4.2,
                      ),
                      SizedBox(height: 8),
                      Text('LONGCHAMP',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Le Pliage LGP Medium SH Black White',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.020)),
                      SizedBox(height: 8),
                      Text('IDR 4.000.000',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/00548532_m.jpg',
                        scale: 4.2,
                      ),
                      SizedBox(height: 8),
                      Text('SHOULDER BAGS',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Le Pliage LGP Medium SH Black White',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.020)),
                      SizedBox(height: 8),
                      Text('IDR 4.000.000',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/00548525_m.jpg',
                          scale: 4.2,
                        ),
                        SizedBox(height: 8),
                        Text('WALLETS',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.030,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Le Pliage LGP Medium SH Black White',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.020)),
                        SizedBox(height: 8),
                        Text('IDR 4.000.000',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.030,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Bottom Margin
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
