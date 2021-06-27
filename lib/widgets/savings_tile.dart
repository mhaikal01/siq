import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:siq/model/savings.dart';
import 'package:siq/theme.dart';

class SavingsTile extends StatefulWidget {
  const SavingsTile({Key? key}) : super(key: key);

  @override
  _SavingsTileState createState() => _SavingsTileState();
}

class _SavingsTileState extends State<SavingsTile> {
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView.builder(
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
              }),
        ),
      ),
    );
  }
}
