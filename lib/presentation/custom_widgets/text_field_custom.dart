import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_test/app/config/assets_manager.dart';
import 'package:medical_test/app/config/color_manager.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/config/style_manager.dart';
import 'package:medical_test/app/config/values_manager.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isValid = true;
  final bool isNumberPhone;
  const TextFieldCustom(
      {super.key,
      required this.title,
      required this.controller,
      this.isNumberPhone = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8, bottom: AppPadding.p16),
            child: TextFormField(
              style: StyleManager.h4_Regular(),
              controller: controller,
              keyboardType:
                  isNumberPhone ? TextInputType.phone : TextInputType.name,
              decoration: InputDecoration(
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: SvgPicture.asset(
                //     'asset/mail_icon.svg',
                //     height: 24.0,
                //     width: 24.0,
                //   ),
                // ),
                labelText: title,
                labelStyle:
                    StyleManager.h4_Regular(color: ColorManager.primary5Color),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: ColorManager.firstColor),
                ),
                filled: true,
                fillColor: ColorManager.primary1Color,
                errorText: isValid ? null : 'Please enter a valid email',
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
