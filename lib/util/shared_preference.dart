import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  Future setProduct(String productName, String productTitle) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('product_name', productName);
    prefs.setString('product_title', productTitle);
  }

  Future<String> getProductName() async {
    var prefs = await SharedPreferences.getInstance();
    print('Product Name : ${prefs.getString('product_name')}');
    return prefs.getString('product_name');
  }

  Future<String> getProductTitle() async {
    var prefs = await SharedPreferences.getInstance();
    print('Product Title : ${prefs.getString('product_title')}');
    return prefs.getString('product_title');
  }
}
