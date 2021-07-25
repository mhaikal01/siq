import 'package:flutter/material.dart';
import 'package:siq/pages/home_page.dart';
import 'package:siq/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo_iq.png'),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'SIQ',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 43,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Smart of Insan Qurani',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontSize: 25),
            ),
            SizedBox(
              height: 96,
            ),
            Container(
              width: MediaQuery.of(context).size.width - (2 * defaultMargin),
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  primary: Colors.white,
                ),
                child: Text(
                  'Mulai',
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
            )
          ],
        ),
      ),
    );
  }
}
