import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siq/model/kehadiran.dart';
import 'package:siq/pages/akun_page.dart';
import 'package:siq/pages/home_page.dart';
import 'package:siq/providers/santri_provider.dart';
import 'package:siq/theme.dart';
import 'package:siq/widgets/bottom_navbar_item.dart';

class RiwayatPage extends StatefulWidget {
  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  late List<Kehadiran> _kehadirans = [];
  late bool _loading;

  User? user;

  @override
  void initState() {
    super.initState();

    _loading = true;
    SantriProvider.getKehadiran().then((kehadirans) {
      setState(() {
        _kehadirans = kehadirans;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(_loading ? 'loading..' : 'kehadiran'),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          ListView.builder(
            itemCount: _kehadirans.length,
            itemBuilder: (context, index) {
              Kehadiran kehadiran = _kehadirans[index];
              return Card(
                child: ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/user.png'),
                      ),
                    ),
                  ),
                  title: Text(kehadiran.nameSantri!),
                  subtitle: Text(kehadiran.information!),
                ),
              );
            },
          )
        ],
      )),
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
