import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModalSheetLine extends ConsumerWidget {
  const ModalSheetLine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
