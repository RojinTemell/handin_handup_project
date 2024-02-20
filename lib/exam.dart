import 'package:flutter/material.dart';

import 'features/widget/listtitle_widget.dart';

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomListTitle(),
            CustomListTitle(),
            CustomListTitle(),

          ],
        ),
      ),
    );
  }
}
