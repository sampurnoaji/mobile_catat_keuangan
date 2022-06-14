import 'package:catat_keuangan/ui/dummy_data.dart';
import 'package:catat_keuangan/ui/list/card_record.dart';
import 'package:catat_keuangan/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BG_NORMAL,
        title: Text('Catatan Pengeluaran'),
      ),
      backgroundColor: AppColors.BG_DARK,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView(children: [
          for (final record in records)
            CardRecordView(record: record,)
        ]),
      ),
    );
  }
}
