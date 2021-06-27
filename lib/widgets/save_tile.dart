import 'package:flutter/material.dart';
import 'package:siq/theme.dart';

class SaveTile extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final bool? islocked;

  SaveTile({this.imageUrl, this.islocked, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl!,
            ),
          ),
        ),
      ),
      title: Text(
        title!,
        style: blackTextStyle.copyWith(fontSize: 18),
      ),
      trailing: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage(islocked! ? 'assets/tick.png' : 'assets/tick.png'),
          ),
        ),
      ),
    );
  }
}
