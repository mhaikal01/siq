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

  late List<Savings> list;
  String text = '';

  void getSavings() async {
    final box = await Hive.openBox<Savings>('savings');
    // var list = listSavings;
    setState(() {
      listSavings = box.values.toList();
      list = listSavings;
    });
  }

  @override
  void initState() {
    getSavings();
    list = listSavings;
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
              padding: EdgeInsets.only(
                top: 225,
                bottom: 80,
              ),
              itemCount: list.length,
              itemBuilder: (context, position) {
                Savings getSaving = list[position];
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
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: 'Searc....',
                      ),
                      onChanged: (text) {
                        text = text;
                        list = listSavings.where((getSaving) {
                          final saveName = getSaving.name!.toLowerCase();
                          final searchLower = text.toLowerCase();
                          return saveName.contains(searchLower);
                        }).toList();
                        setState(() {
                          this.list = list;
                          this.text = text;
                        });
                      },
                    ),
                  ),
                ],
              ),
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
