import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:siq/model/savings.dart';
import 'package:siq/pages/splash_page.dart';
import 'package:siq/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(SavingsAdapter());
  await Hive.openBox<Savings>('savings');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MaterialApp(
        title: 'Material App',
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
