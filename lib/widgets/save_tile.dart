import 'package:flutter/material.dart';
import 'package:siq/model/save.dart';
import 'package:siq/theme.dart';

class SaveTile extends StatelessWidget {
  final Save? save;

  SaveTile({
    this.save,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  save!.imageUrl!,
                ),
              ),
            ),
          ),
          title: Text(
            save!.name!,
            style: blackTextStyle.copyWith(fontSize: 18),
          ),
          // trailing: Container(
          //   height: 32,
          //   width: 32,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //           save!.isLocked! ? 'assets/tick.png' : 'assets/tick.png'),
          //     ),
          //   ),
          // ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
