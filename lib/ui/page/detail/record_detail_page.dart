import 'package:catat_keuangan/domain/record.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';

class RecordDetailPage extends StatelessWidget {
  final Record record;

  const RecordDetailPage({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BG_NORMAL,
        title: const Text('Detail Catatan'),
      ),
      backgroundColor: AppColors.BG_DARK,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tanggal',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(record.date),
            const SizedBox(height: 18),
            const Text(
              'Kategori',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(record.category),
            const SizedBox(height: 18),
            const Text(
              'Pengeluaran',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(record.amount),
            ),
            const SizedBox(height: 18),
            const Text(
              'Catatan',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(record.note),
          ],
        ),
      ),
    );
  }
}
