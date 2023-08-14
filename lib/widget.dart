import 'package:flutter/material.dart';

class CustomPlaceHolder extends StatelessWidget {
   final String pageName;
    const CustomPlaceHolder(
      {super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(pageName),
    );
  }
}

