// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class dot extends StatelessWidget {
  //created index and activePage parameters in order to edit what we want to the dots
  int index;
  int activePage;
  dot({
    Key? key,
    required this.index,
    required this.activePage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: 20,
      width: index == activePage ? 40 : 20,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: index == activePage
              ? Colors.purple
              : Colors.purple.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
