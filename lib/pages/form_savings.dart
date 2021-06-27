import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:siq/model/savings.dart';
import 'package:siq/pages/save_page.dart';
import 'package:siq/theme.dart';

// ignore: must_be_immutable
class FormSavings extends StatefulWidget {
  bool? isEdit;
  int? position;
  Savings? savingsModel;

  FormSavings({this.isEdit, this.position, this.savingsModel});

  @override
  State<StatefulWidget> createState() {
    return _FormSavingsState();
  }
}

class _FormSavingsState extends State<FormSavings> {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerMoney = new TextEditingController();
  TextEditingController controllerDorm = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.isEdit!) {
      controllerName.text = widget.savingsModel!.name!;
      controllerName.text = widget.savingsModel!.money!.toString();
      controllerName.text = widget.savingsModel!.dorm!.toString();
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Nama: ',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller: controllerName,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Simpanan: ',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller: controllerMoney,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 80,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: butonColor,
                      primary: Colors.white,
                    ),
                    child: Text(
                      'Submit',
                    ),
                    onPressed: () async {
                      var getName = controllerName.text;
                      var getMoney = controllerMoney.text;
                      var getDorm = controllerDorm.text;
                      if (getName.isNotEmpty) {
                        if (widget.isEdit!) {
                          Savings updateSavings = new Savings(
                            name: getName,
                            money: getMoney,
                            dorm: getDorm,
                          );
                          var box = await Hive.openBox<Savings>('savings');
                          box.putAt(widget.position!, updateSavings);
                        } else {
                          Savings addSavings = new Savings(
                            name: getName,
                            money: getMoney,
                            dorm: getDorm,
                          );
                          var box = await Hive.openBox<Savings>('savings');
                          box.add(addSavings);
                        }
                      }
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SavePage()),
                          (route) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
