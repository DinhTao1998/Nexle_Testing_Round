import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'controller/sign_up_screen_controller.dart';
import 'package:nexle_testing_round/ui/ui.dart';
import 'package:nexle_testing_round/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SignUpScreen extends GetWidget<SignUpScreenController>{
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBanner(),
          _buildContent(),
          _buildAppbar(),
          _buildStateLoading(),
        ],
      ),
    );
  }

  Widget _buildAppbar(){
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding,vertical: SizeConstants.defaultPadding/2),
      child: IconButton(
        constraints: const BoxConstraints(minWidth: Dimens.d20, maxWidth: Dimens.d20),
        onPressed: (){},
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: Dimens.d20,),
      ),
    ));
  }


  Widget _buildBanner(){
    return const AssetImageComponent(image: ImageStrings.BANNER_SIGN_UP);
  }

  Widget _buildContent(){
    return GestureDetector(
      onTap: controller.unFocusController,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black
              ],
              transform: GradientRotation(0),
              stops: [0.1,0.6]
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: Get.height*0.35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Let’s get you started!',style: AppTextStyles.s22w400Primary(),),
                const SizedBox(height: 2.5*SizeConstants.defaultPadding,),
                _buildSignUpForm()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpForm(){
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your email',style: AppTextStyles.s12w400Primary(opacity: 0.5),),
          TextFieldComponent(
            controller: controller.email,
            focus: controller.emailFocus,
            textInputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[^-\s]")),
            ],
            title: Text(
              'Your email',
              style: AppTextStyles.s12w400Primary(opacity: 0.5),
            ),
            validateFunction: (value){
              if ((value == null || value == '')) {
                return 'Field is required';
              }
              return GetIt.instance.get<ValidatorEmail>().validate(value);
            },
            textStyle: AppTextStyles.s16w400Primary(),
            keyboardType: TextInputType.emailAddress,
            callbackUpdate: (String value) {  },
          ),
          const SizedBox(height: SizeConstants.defaultPadding,),
          Text('Your password',style: AppTextStyles.s12w400Primary(opacity: 0.5),),
          Obx(() => PasswordFieldComponent(
            passwordStrength: controller.passwordStrength.value,
            controller: controller.password,
            focusNode: controller.passwordFocus,
          ),),
          const SizedBox(height:1.5*SizeConstants.defaultPadding,),
          _buildCheckboxAge(),
          const SizedBox(height:SizeConstants.defaultPadding,),
          _buildPolicy(),
          const SizedBox(height:1.5*SizeConstants.defaultPadding,),
          _buildSingUpButton(),
        ],
      ),
    );
  }

  Widget _buildCheckboxAge(){
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.actionCheckBox(!controller.validateAge.value),
          child: Container(
            margin: const EdgeInsets.only(right: SizeConstants.defaultPadding/2),
            constraints: BoxConstraints(
                maxHeight: Dimens.d24.sp,
                maxWidth: Dimens.d24.sp
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.current.secondaryColor),
                borderRadius: BorderRadius.circular(Dimens.d4)
            ),
            child: Obx(() => Checkbox(
                activeColor: Colors.transparent,
                value: controller.validateAge.value,
                onChanged: (value) => controller.actionCheckBox(value)
            )),
          ),
        ),
        Text('I am over 16 years of age',style: AppTextStyles.s14w400Primary(),),
      ],
    );
  }

  Widget _buildPolicy(){
    return RichText(
      text: TextSpan(
        style: AppTextStyles.s12w400Primary(opacity: 0.5),
        text: 'By clicking Sign Up, you are indicating that you have read and agree to the',
        children: [
          TextSpan(
            text: ' Terms of Service',
            style: AppTextStyles.s12w400Secondary()
          ),
          const TextSpan(
              text: ' and',
          ),
          TextSpan(
              text: ' Privacy Policy',
              style: AppTextStyles.s12w400Secondary()
          ),
        ]
      ),
    );
  }

  Widget _buildSingUpButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Sign Up',style: AppTextStyles.s16w400Primary(),),
        Obx(() => controller.validate.value?GestureDetector(
          onTap: controller.pressSignUpButton,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.current.secondaryColor),
                borderRadius: BorderRadius.circular(Dimens.d54.sp)
            ),
            height: Dimens.d54.sp,
            width: Dimens.d54.sp,
            child: Icon(Icons.east_outlined,color: Colors.white,size: Dimens.d20.sp,),
          ),
        ):const SizedBox())
      ],
    );
  }

  Widget _buildStateLoading(){
    return Obx(() => controller.screenLoading.value ?Opacity(
      opacity:0.7,
      child: Container(
        width: Get.width,
        height: Get.height,
        color: AppColors.current.secondaryColor,
        child: const Center(
          child: SpinKitThreeBounce(
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ),
    ):const SizedBox());
  }
}