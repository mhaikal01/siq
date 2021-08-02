import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siq/pages/akun_page.dart';
import 'package:siq/pages/name_page.dart';
import 'package:siq/pages/riwayat_page.dart';
import 'package:siq/pages/save_page.dart';
import 'package:siq/theme.dart';
import 'package:siq/widgets/bottom_navbar_item.dart';
import 'package:siq/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  final User? user;
  HomePage(this.user);

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
              Text(
                'Home Page',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo_iq.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),

              // NOTE: WIDGETS HOME -> SAVE PAGE

              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NamePage(),
                          ),
                        );
                      },
                      child: HomeCard(
                        imageUrl: 'assets/absen.png',
                        title: 'Absen',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SavePage(),
                          ),
                        );
                      },
                      child: HomeCard(
                        imageUrl: 'assets/dompet.png',
                        title: 'Saku',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),

      // NOTE : FLOAT BUTTON -> BOTTOM NAVBAR ITEM

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(user),
                  ),
                );
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/home.png',
                isActive: true,
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
                isActive: false,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
