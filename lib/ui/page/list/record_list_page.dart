import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../dummy_data.dart';
import '../add/record_add_page.dart';
import '../../widget/card_record_view.dart';

class RecordListPage extends StatelessWidget {
  const RecordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.BG_NORMAL,
        title: Text('Catatan Pengeluaran'),
      ),
      backgroundColor: AppColors.BG_DARK,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.BLUE_NORMAL,
        child: Icon(Icons.add),
        onPressed: () {
          _addRecord(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView(children: [
          for (final record in records)
            CardRecordView(
              record: record,
            )
        ]),
      ),
    );
  }

  Future<void> _addRecord(BuildContext context) async {
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const RecordAddPage()),
    );
    if (result) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Catatan berhasil ditambahkan'),
          backgroundColor: Colors.green,));
    }
  }
}
