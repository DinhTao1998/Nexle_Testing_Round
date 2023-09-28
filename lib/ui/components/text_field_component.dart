import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:nexle_testing_round/resources/constants/size_constants.dart';
import 'package:nexle_testing_round/resources/resources.dart';
class TextFieldComponent extends StatelessWidget {
  final Widget ?title;
  final bool obscureText;
  final String hintText;
  final String? initValue;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffix;
  final EdgeInsetsGeometry? padding;
  final int ?maxLength;
  final double? fontSize;
  final int maxLine;
  final bool validate;
  final bool readOnly;
  final TextEditingController? controller;
  final FocusNode? focus;
  final CallbackFunction<String> callbackUpdate;
  final GestureTapCallback? callback;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextStyle textStyle;
  final InputBorder ?focusedBorder;
  final InputBorder ?enabledBorder;
  final InputBorder ?border;
  final List<TextInputFormatter> textInputFormatters;
  final InputValidateFunction<String> ?validateFunction;

  const TextFieldComponent(
      {Key? key,
        required this.keyboardType,
        this.textAlign = TextAlign.left,
        this.title,
        this.hintText = '',
        this.obscureText = false,
        this.prefixIcon,
        this.focus,
        this.suffix,
        this.padding,
        this.fontSize,
        this.maxLine = 1,
        this.controller,
        this.validate = true,
        this.maxLength,
        this.textAlignVertical,
        required this.callbackUpdate,
        this.callback,
        this.initValue,
        this.readOnly = false,
        required this.textStyle,
        this.border,
        this.enabledBorder,
        this.focusedBorder,
        this.textInputFormatters = const [],
        this.validateFunction,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateFunction,
      inputFormatters:textInputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      initialValue: initValue,
      focusNode: focus,
      onTap: callback,
      readOnly: readOnly,
      textAlign: textAlign,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: '*',
      maxLength: maxLength,
      maxLines: maxLine,
      cursorColor: AppColors.current.secondaryColor,
      onChanged: (value) {
        callbackUpdate(value);
      },
      style: textStyle,
      textAlignVertical: textAlignVertical,
      decoration: InputDecoration(
        filled: true,
        fillColor: readOnly?Colors.grey.withOpacity(0.3):Colors.transparent,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints(),
        prefixIcon: prefixIcon,
        hintText: hintText.toLowerCase(),
        contentPadding: const EdgeInsets.only(),
        focusedBorder: focusedBorder??UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.current.secondaryColor,width: 1),

        ),
        enabledBorder: enabledBorder??UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.current.secondaryColor,width: 1)
        ),
        border: border??UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.current.secondaryColor,width: 1)
        ),
      ),
    );
  }

  // String ? validateFunction(String? value){
  //   if ((value == null || value.isEmpty) && validate) {
  //     return 'Field is required';
  //   }
  //   return null;
  // }
}
