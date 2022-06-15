import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../dummy_data.dart';
import '../add/record_add_page.dart';
import '../../widget/card_record_view.dart';

class RecordListPage extends StatefulWidget {
  const RecordListPage({Key? key}) : super(key: key);

  @override
  State<RecordListPage> createState() => _RecordListPageState();
}

class _RecordListPageState extends State<RecordListPage> {
  bool isAlreadyAddRecord = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Pengeluaran'),
      ),
      backgroundColor: AppColors.BG_DARK,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.BLUE_NORMAL,
        child: const Icon(Icons.add),
        onPressed: () {
          _addRecord(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: (isAlreadyAddRecord)
            ? ListView(children: [
                for (final record in records)
                  CardRecordView(
                    record: record,
                  )
              ])
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.search, color: Colors.white, size: 64),
                    SizedBox(height: 8),
                    Text('Belum ada catatan, klik button + untuk menambah'),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _addRecord(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecordAddPage()),
    );
    if (result) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text('Catatan berhasil ditambahkan'),
          backgroundColor: Colors.green,
        ));
      setState(() {
        isAlreadyAddRecord = true;
      });
    }
  }
}
