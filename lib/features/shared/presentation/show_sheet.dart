import 'package:flutter/material.dart';

void showSheet(BuildContext context, Widget sheet) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    useSafeArea: true,
    useRootNavigator: true,
    isScrollControlled: true,
    builder: (context) => sheet,
  );
}
