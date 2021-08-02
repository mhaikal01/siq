import 'package:flutter/material.dart';
import 'package:siq/theme.dart';
import 'package:siq/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 262,
                  width: 258,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo_iq.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'email',
                          labelText: 'email',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          labelText: 'Pass',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width -
                            (2 * defaultMargin),
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: butonColor,
                            primary: Colors.white,
                          ),
                          child: Text(
                            'Masuk',
                          ),
                          onPressed: () async {
                            await AuthServices.signIn(
                                emailController.text, passwordController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
