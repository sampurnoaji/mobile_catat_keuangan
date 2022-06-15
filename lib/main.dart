import 'package:catat_keuangan/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'ui/page/list/record_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
                primary: AppColors.BG_NORMAL,
              ),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.white,
              ),
            ),
            floatingLabelStyle: TextStyle(
              color: Colors.white,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
          )),
      home: const RecordListPage(),
    );
  }
}
