import 'package:banananina/screen/cart/cart.dart';
import 'package:banananina/screen/home/home.dart';
import 'package:banananina/screen/login/login.dart';
import 'package:banananina/screen/product/product.dart';
import 'package:banananina/screen/registration/registration.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  LoginScreen.tag: (context) => LoginScreen(),
  HomeScreen.tag: (context) => HomeScreen(),
  RegistrationScreen.tag: (context) => RegistrationScreen(),
  ProductScreen.tag: (context) => ProductScreen(),
  CartScreen.tag: (context) => CartScreen(),
};
