import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:siq/model/savings.dart';
import 'package:siq/pages/form_savings.dart';
import 'package:siq/pages/home_page.dart';
import 'package:siq/theme.dart';

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  List<Savings> listSavings = [];

  void getSavings() async {
    final box = await Hive.openBox<Savings>('savings');
    setState(() {
      listSavings = box.values.toList();
    });
  }

  @override
  void initState() {
    getSavings();
    super.initState();
  }

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

            // NOTE : LIST WIDGETS -> SAVE TILE

            ListView.builder(
                itemCount: listSavings.length,
                itemBuilder: (context, position) {
                  Savings getSavings = listSavings[position];
                  var money = getSavings.money;
                  var dorm = getSavings.dorm;
                  return Card(
                    elevation: 8,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              getSavings.name!,
                              style: blackTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 45),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Simpanan: $money | Asrama: $dorm',
                              style: blackTextStyle.copyWith(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
            //   (
            //   padding: EdgeInsets.zero,
            //   children: [
            //     SizedBox(
            //       height: 225,
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: defaultMargin,
            //       ),
            //       decoration: BoxDecoration(
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(30)),
            //         color: backgroundColor,
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             height: 30,
            //           ),
            //           Text(
            //             'disini list nama Savingssss',
            //             style: blackTextStyle.copyWith(fontSize: 22),
            //           ),
            //           SizedBox(
            //             height: 25,
            //           ),
            //           Text(
            //             'ini namanya',
            //             style: blackTextStyle.copyWith(fontSize: 18),
            //           ),
            //           SizedBox(
            //             height: 15,
            //           ),

            //           // SavingsTile(),

            //           // NOTE : SUBMITS

            //           SizedBox(
            //             height: 30,
            //           ),
            //           Container(
            //             width: MediaQuery.of(context).size.width -
            //                 (2 * defaultMargin),
            //             height: 50,
            //             child: TextButton(
            //               style: TextButton.styleFrom(
            //                 backgroundColor: butonColor,
            //                 primary: Colors.white,
            //               ),
            //               child: Text(
            //                 'Submit',
            //               ),
            //               onPressed: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => HomePage(),
            //                   ),
            //                 );
            //               },
            //             ),
            //           ),
            //           SizedBox(
            //             height: 80,
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),

      // NOTE : FLOAT BUTTON -> BOTTOM NAVBAR ITEM

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormSavings(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
