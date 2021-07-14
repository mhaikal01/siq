import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:siq/model/savings.dart';
import 'package:siq/pages/login.dart';
import 'package:siq/pages/name_page.dart';
import 'package:siq/providers/save_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SavingsAdapter());
  await Hive.openBox<Savings>('savings');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: NamePage(),
      debugShowCheckedModeBanner: false,
    );

    // ChangeNotifierProvider(
    //   create: (context) => SaveProvider(),
    //   child: MaterialApp(
    //     title: 'Material App',
    //     home: Login(),
    //     debugShowCheckedModeBanner: false,
    //   ),
    // );
  }
}
