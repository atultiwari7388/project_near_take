import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';

import '../constants/dimensions.const.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmitValue,
    required this.keyboardType,
    required this.obscureText,
    required this.hintText,
    required this.formFieldValidator,
    this.enable = true,
    this.autoFocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmitValue;
  final FormFieldValidator formFieldValidator;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.getHeight(7)),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitValue,
        validator: formFieldValidator,
        keyboardType: keyboardType,
        cursorColor: kPrimaryCursorColor,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(height: 0, fontSize: AppDimensions.getHeight(19)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(AppDimensions.getHeight(10)),
          hintText: hintText,
          enabled: enable,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(height: 0, color: kPrimaryCursorColor.withOpacity(.8)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kTextFieldDefaultColor),
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.getHeight(8)),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryCursorColor),
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.getHeight(8))),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRedColor),
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.getHeight(8))),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryCursorColor),
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.getHeight(8))),
          ),
        ),
      ),
    );
  }
}
