import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Pages/homepage.dart';
import 'package:todo/Pages/list_card_page.dart';
import 'package:todo/Screen/constants.dart';

import 'Provider/Done_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To Do App',
          theme: ThemeData.dark(),
          home: MainScreen()),
    );
  }
}
