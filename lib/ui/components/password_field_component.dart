import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:nexle_testing_round/ui/ui.dart';
import 'package:nexle_testing_round/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PasswordFieldComponent extends StatefulWidget{
  const PasswordFieldComponent({super.key, required this.passwordStrength,this.controller,this.focusNode});
  final PasswordStrength passwordStrength;
  final TextEditingController ?controller;
  final FocusNode ?focusNode;

  @override
  State<PasswordFieldComponent> createState() => _PasswordFieldComponentState();
}

class _PasswordFieldComponentState extends State<PasswordFieldComponent> {
  RxBool obscureText = true.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Obx(() => SizedBox(
          height: SizeConstants.inputHeight,
          child: TextFieldComponent(
            validateFunction: (value){
              if ((value == null || value == '')) {
                return 'Field is required';
              }
            },
            textInputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[^-\s]")),
            ],
            controller: widget.controller,
            focus: widget.focusNode,
            maxLength: 18,
            obscureText: obscureText.value,
            validate: widget.passwordStrength.index==-1?false:true,
            suffix: _buildSuffixIcon(),
            textStyle: AppTextStyles.s16w400Primary(),
            keyboardType: TextInputType.emailAddress,
            callbackUpdate: (String value) {  },
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),),
        LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          color: widget.passwordStrength.color,
          minHeight: 1,
          value: widget.passwordStrength.value,
        ),
        const SizedBox(height: SizeConstants.defaultPadding/2,),
        Text(widget.passwordStrength.label,style: AppTextStyles.s12w400Primary().copyWith(color: widget.passwordStrength.color),)
      ],
    );
  }
  Widget _buildSuffixIcon(){
    return GestureDetector(
      onTap: (){
        obscureText.value = !obscureText.value;
        setState(() {});},
      child: Icon(
        obscureText.value?Icons.visibility_sharp:Icons.visibility_off_sharp,
        color: Colors.white.withOpacity(0.5),
        size: Dimens.d20.sp,),
    );
  }
}