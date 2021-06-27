import 'package:flutter/material.dart';
import 'package:siq/pages/home_page.dart';
import 'package:siq/theme.dart';
import 'package:siq/widgets/save_tile.dart';

class AbsentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/backcopy.jpg',
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.cover,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 250,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       fit: BoxFit.fill,
            //       image: AssetImage('assets/backcopy.jpg'),
            //     ),
            //   ),
            // ),

            // NOTE : BACK BUTTOM

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 20,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/back.png',
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 225,
                ),

                // NOTE : LIST WIDGETS -> SAVE TILE
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    color: backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'disini list nama',
                        style: blackTextStyle.copyWith(fontSize: 22),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'ini namanya',
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon1.png',
                        title: 'name1',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon2.png',
                        title: 'name2',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SaveTile(
                        imageUrl: 'assets/icon3.png',
                        title: 'name3',
                        islocked: false,
                      ),

                      // NOTE : SUBMITS

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
                            'Submit',
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
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),

      // NOTE : FLOAT BUTTON -> BOTTOM NAVBAR ITEM

      // floatingActionButton: Container(
      //   height: 65,
      //   width: MediaQuery.of(context).size.width - (2 * edge),
      //   margin: EdgeInsets.symmetric(
      //     horizontal: edge,
      //   ),
      //   decoration: BoxDecoration(
      //     color: navbarColor,
      //     borderRadius: BorderRadius.circular(23),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => HomePage(),
      //             ),
      //           );
      //         },
      //         child: BottomNavbarItem(
      //           imageUrl: 'assets/home.png',
      //           isActive: false,
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => RiwayatPage(),
      //             ),
      //           );
      //         },
      //         child: BottomNavbarItem(
      //           imageUrl: 'assets/riwayat.png',
      //           isActive: false,
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => AkunPage(),
      //             ),
      //           );
      //         },
      //         child: BottomNavbarItem(
      //           imageUrl: 'assets/profil.png',
      //           isActive: false,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
