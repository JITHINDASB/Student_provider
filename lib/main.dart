import 'package:flutter/material.dart';

import 'package:prostudent/provider/alert.dart';
import 'package:prostudent/provider/image_form.dart';
import 'package:prostudent/provider/student_form.dart';
import 'package:prostudent/screen/home.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prostudent/models/models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Studentdata()),
        ChangeNotifierProvider(create: (context) => StudentImage()),
        ChangeNotifierProvider(create: (context) => AlertProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
