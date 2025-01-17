import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValiidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      )
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Adress',
        hintText: 'you@example.com'
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      }
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Type Password'
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      }
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blueAccent[100],
      onPressed: () {
        print(formKey.currentState.validate());
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          formKey.currentState.reset();
          print('Good to go! $email $password');

        }
      },
    );
  }

}

