import 'package:banananina/model/login_model.dart';
import 'package:banananina/screen/home/home.dart';
import 'package:banananina/screen/registration/registration.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:banananina/helper/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  LoginModel _loginData = LoginModel();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Center(
              child: Form(
                key: _key,
                autovalidate: _validate,
                child: _getFormUI(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFormUI() {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/banananina_logo_mobile.png',
          height: 100,
          width: 100,
        ),
        SizedBox(height: 25.0),
        Text(
          'SIGN IN',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 25.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
          ),
          validator: FormValidator().validateEmail,
          onSaved: (String value) {
            _loginData.email = value;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
            validator: FormValidator().validatePassword,
            onSaved: (String value) {
              _loginData.password = value;
            }),
        FlatButton(
            child: Text(
              'Forgot password?',
              style: TextStyle(color: const Color(0xFFC69C6D)),
            ),
            onPressed: _sendError
            //_showForgotPasswordDialog,
            ),
        Padding(
          padding: EdgeInsets.only(top: 3.0),
          child: Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _sendToServer,
              padding: EdgeInsets.all(12),
              color: Colors.black,
              child: Text('LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _sendToRegisterPage,
              padding: EdgeInsets.all(12),
              color: Colors.black,
              child: Text('REGISTER',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Row(
          children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Divider(
                    color: Colors.black,
                    height: 36,
                  )),
            ),
            Text(
              'OR',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Divider(
                    color: Colors.black,
                    height: 36,
                  )),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        Text(
          'SIGN IN WITH...',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.all(12),
                color: const Color(0xFF3b5998),
                child: Text('FACEBOOK',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.all(12),
                color: const Color(0xFFd62d20),
                child: Text('GOOGLE',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              ),
            ),
          ],
        )
      ],
    );
  }

  _sendToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  _sendToServer() async {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Email ${_loginData.email}");
      print("Password ${_loginData.password}");
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', true);
      bool isLogin = prefs.getBool('login');
      print("Login Status : $isLogin");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  Future<Null> _showForgotPasswordDialog() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please enter your Email'),
            contentPadding: EdgeInsets.all(25.0),
            content: TextField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (String value) {
                _loginData.email = value;
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok", style: TextStyle(color: Colors.blue)),
                onPressed: () async {
                  _loginData.email = "";
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Cancel", style: TextStyle(color: Colors.red)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  void _sendError() {
    Crashlytics.instance.setString('foo', 'bar');
  }
}
