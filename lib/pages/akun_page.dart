import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siq/pages/login_page.dart';
import 'package:siq/pages/riwayat_page.dart';
import 'package:siq/pages/splash_page.dart';
import 'package:siq/widgets/bottom_navbar_item.dart';
import '../theme.dart';
import 'home_page.dart';
import 'package:siq/services/auth_services.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  late Future<void> _auth = AuthServices.signOut();
  late bool signOut = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Akun Page'),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 172,
                height: 172,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Avatar.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 98,
              ),
              Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: butonColor,
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Ganti Password',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Container(
                width: 182,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: butonColor,
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Log Out',
                  ),
                  onPressed: () async {
                    await _auth.then((_auth) {
                      setState(() {
                        _auth = _auth;
                        signOut = true;
                      });
                    });
                    if (signOut = true) {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }), (route) => false);
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: navbarColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                User? user;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(user),
                  ),
                );
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/home.png',
                isActive: false,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiwayatPage(),
                  ),
                );
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/riwayat.png',
                isActive: false,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AkunPage(),
                  ),
                );
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/profil.png',
                isActive: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
