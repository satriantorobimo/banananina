import 'package:banananina/helper/validator.dart';
import 'package:banananina/model/registration_model.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String tag = 'register-screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  RegistrationModel _registrationData = RegistrationModel();
  bool _obscureText = true;
  TextEditingController _passwordCtrl = TextEditingController();

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
          'REGISTER ACCOUNT',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 25.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'First Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
          ),
          validator: FormValidator().validateLastFirstName,
          onSaved: (String value) {
            _registrationData.firstName = value;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Last Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
          ),
          validator: FormValidator().validateLastFirstName,
          onSaved: (String value) {
            _registrationData.lastName = value;
          },
        ),
        SizedBox(height: 20.0),
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
            _registrationData.email = value;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
            autofocus: false,
            controller: _passwordCtrl,
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
              _registrationData.password = value;
            }),
        SizedBox(height: 20.0),
        TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
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
            validator: (value) {
              if (value != _passwordCtrl.text) {
                return 'Password is not Matching';
              }
            },
            onSaved: (String value) {
              _registrationData.password = value;
            }),
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.only(top: 3.0),
          child: Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                _sendToRegisterPage();
              },
              padding: EdgeInsets.all(12),
              color: Colors.black,
              child: Text('SUBMIT',
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
        SizedBox(height: 10.0),
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
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Email ${_registrationData.email}");
      print("Password ${_registrationData.password}");
      print("Password ${_registrationData.lastName}");
      print("Password ${_registrationData.firstName}");
      Navigator.pop(context);
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
