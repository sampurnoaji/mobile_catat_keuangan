import 'package:catat_keuangan/ui/widget/edit_text_view.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class RecordAddPage extends StatefulWidget {
  const RecordAddPage({Key? key}) : super(key: key);

  @override
  State<RecordAddPage> createState() => _RecordAddPageState();
}

class _RecordAddPageState extends State<RecordAddPage> {
  String date = '';
  String category = '';
  String amount = '';
  String note = '';
  bool isErrorForm = false;

  void setError(bool isVisible) {
    setState(() {
      isErrorForm = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.BG_NORMAL,
          title: const Text('Tambah Catatan'),
        ),
        backgroundColor: AppColors.BG_DARK,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Column(
              children: [
                EditTextView(
                  label: 'Tanggal',
                  onChanged: (value) {
                    date = value;
                  },
                ),
                const SizedBox(height: 16),
                EditTextView(
                  label: 'Kategori',
                  onChanged: (value) {
                    category = value;
                  },
                ),
                const SizedBox(height: 16),
                EditTextView(
                  label: 'Rupiah',
                  onChanged: (value) {
                    amount = value;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                EditTextView(
                  label: 'Catatan',
                  onChanged: (value) {
                    note = value;
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  (isErrorForm) ? 'Lengkapi isian form' : '',
                  style: const TextStyle(color: Colors.redAccent),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (date.isNotEmpty &&
                            category.isNotEmpty &&
                            amount.isNotEmpty &&
                            note.isNotEmpty) {
                          Navigator.pop(context, true);
                        } else {
                          setError(true);
                        }
                      },
                      child: const Text('Simpan'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.BLUE_NORMAL),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
