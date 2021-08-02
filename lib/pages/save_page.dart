import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:siq/model/savings.dart';
import 'package:siq/pages/form_savings.dart';
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
      appBar: AppBar(
        title: Text('Saku'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/backcopy.jpg'),
                ),
              ),
            ),

            // NOTE : LIST WIDGETS -> SAVE TILE

            ListView.builder(
              padding: EdgeInsets.only(top: 225),
              itemCount: listSavings.length,
              itemBuilder: (context, position) {
                Savings getSaving = listSavings[position];
                var money = getSaving.money;
                var dorm = getSaving.dorm;
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
                            getSaving.name ?? "",
                            style: blackTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 80),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => FormSavings(
                                      isEdit: true,
                                      position: position,
                                      savingsModel: getSaving,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 40),
                            child: IconButton(
                              onPressed: () {
                                final box = Hive.box<Savings>('savings');
                                box.add(Savings(
                                  name: getSaving.name,
                                  money: getSaving.money,
                                  dorm: getSaving.dorm,
                                ));
                                setState(() {
                                  listSavings.add(
                                    Savings(
                                      name: getSaving.name,
                                      money: getSaving.money,
                                      dorm: getSaving.dorm,
                                    ),
                                  );
                                });
                              },
                              icon: Icon(Icons.copy),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              final box = Hive.box<Savings>('savings');
                              box.deleteAt(position);
                              setState(() {
                                listSavings.removeAt(position);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Simpanan: $money | Asrama: $dorm',
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
              builder: (context) => FormSavings(isEdit: false),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
