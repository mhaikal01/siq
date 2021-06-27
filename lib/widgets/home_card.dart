import 'package:flutter/material.dart';
import 'package:siq/theme.dart';

class HomeCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;

  HomeCard({
    this.imageUrl,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              imageUrl!,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title!,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
