import 'package:flutter/material.dart';
import 'package:medical_test/screens/utils/string_manager.dart';
import 'package:medical_test/screens/utils/style_manager.dart';
import 'package:medical_test/screens/utils/values_manager.dart';

class TopDoctorList extends StatefulWidget {
  const TopDoctorList({super.key});

  @override
  State<TopDoctorList> createState() => _TopDoctorListState();
}

class _TopDoctorListState extends State<TopDoctorList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Text(
            StringManager.topDocktorText,
            style: StyleManager.h3_Bold(),
          ),
        ),
      ],
    );
  }
}
