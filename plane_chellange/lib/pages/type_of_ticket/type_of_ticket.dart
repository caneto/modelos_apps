import 'package:flutter/material.dart';
import 'package:plane_chellange/config/colors/colors.dart';
import 'components/components.dart';

class TypeOfTicket extends StatelessWidget {
  const TypeOfTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorGreen,
      body: Column(
        children: [
          SizedBox(height: 20),
          CustomAppBar(),
          CardDetails(),
        ],
      ),
    );
  }
}
