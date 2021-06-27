import 'package:flutter/material.dart';
import 'package:siq/pages/home_page.dart';
import 'package:siq/theme.dart';

class Login extends StatelessWidget {
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
                  height: 100,
                  width: 100,
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username',
                          labelText: 'oyy',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
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
