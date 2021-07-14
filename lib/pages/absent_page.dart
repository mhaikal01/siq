import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siq/model/save.dart';
import 'package:siq/pages/home_page.dart';
import 'package:siq/providers/save_provider.dart';
import 'package:siq/theme.dart';
import 'package:siq/widgets/save_tile.dart';

class AbsentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SaveProvider>(context);

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
                  child: FutureBuilder(
                    future: saveProvider.getNamaSantri(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Save>? data = snapshot.data as List<Save>?;
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data!
                                .map((item) => SaveTile(save: item))
                                .toList());
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                // NOTE : SUBMITS
                SizedBox(
                  height: 30,
                ),
                Container(
                  width:
                      MediaQuery.of(context).size.width - (2 * defaultMargin),
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
            )
          ],
        ),
      ),
    );
  }
}
