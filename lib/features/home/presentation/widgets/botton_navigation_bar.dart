import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomAppBar bottomNavigationBar() {
  return BottomAppBar(
    height: 70,
    child: Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            width: 30,
            height: 30,
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/task.svg',
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(width: 48),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/bell.svg',
            width: 30,
            height: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/settings.svg',
            width: 30,
            height: 30,
          ),
        ),
      ],
    ),
  );
}
