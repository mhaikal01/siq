import 'package:flutter/material.dart';
import 'package:siq/pages/akun_page.dart';
import 'package:siq/pages/home_page.dart';
import 'package:siq/theme.dart';
import 'package:siq/widgets/bottom_navbar_item.dart';

class RiwayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text('riwayat page'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
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
                isActive: true,
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
