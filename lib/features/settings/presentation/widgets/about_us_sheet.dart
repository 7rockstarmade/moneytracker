import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/shared/presentation/modal_sheet_line.dart';

class AboutUsSheet extends ConsumerWidget {
  const AboutUsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: .stretch,
        children: [
          Center(child: ModalSheetLine()),
          Text(
            "Hello",
            textAlign: .center,
            style: TextStyle(
              color: AppColors.neutral2,
              fontWeight: .w600,
              fontSize: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "There is some fake data about us, my github: 7rockstarmade, i make it solo",
              textAlign: .center,
              style: TextStyle(color: AppColors.neutral2, fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.directional(
              start: 15,
              end: 15,
              bottom: 5,
            ),
            child: ClipRRect(
              borderRadius: .circular(15),
              child: Image.asset('assets/images/us.jpg'),
            ),
          ),
          Text(
            "me with my friends btw",
            textAlign: .center,
            style: TextStyle(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
