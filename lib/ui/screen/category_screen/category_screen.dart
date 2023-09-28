import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing_round/data/data.dart';
import 'package:nexle_testing_round/ui/components/list_option_component/option_item_mapper.dart';
import 'controller/category_screen_controller.dart';
import 'package:nexle_testing_round/ui/ui.dart';
import 'package:nexle_testing_round/resources/resources.dart';
class CategoryScreen extends GetWidget<CategoryScreenController>{
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBanner(),
          _buildContent(),
          _buildAppbar()
        ],
      ),
    );
  }

  Widget _buildAppbar(){
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding,vertical: SizeConstants.defaultPadding/2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            constraints: const BoxConstraints(minWidth: Dimens.d20, maxWidth: Dimens.d20),
            onPressed: (){},
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: Dimens.d20,),
          ),
          Obx(() => !controller.showButtonSave.value
            ?const SizedBox()
            :GestureDetector(
              onTap: controller.pressButtonDone,
              child: Text('Done',style: AppTextStyles.s14w400Primary(),),
            )
          )
        ],
      ),
    ));
  }

  Widget _buildBanner(){
    return AssetImageComponent(
      image: ImageStrings.BANNER_CATEGORY,
      width: Get.width,
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildContent(){
    return Container(
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
            stops: [0.2,0.38]
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height*0.25),
          _buildTitle(),
          const SizedBox(height: Dimens.d5,),
          Obx(() => controller.isLoading.value?const SizedBox():Expanded(child:ListOptionComponent<CategoryOptionMapper>(
            listModel: controller.listCategory,
            selectList: controller.listSelectedCategory,
            onUnselect: (CategoryOptionMapper value){
              controller.unSelected(value.model);
            },
            onSelect: (CategoryOptionMapper value){
              controller.selected(value.model);
            },
          ))),
        ],
      ),
    );
  }

  Widget _buildTitle(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Wellcome to Flutter Test',style: AppTextStyles.s22w400Primary(),),
        const SizedBox(height: SizeConstants.defaultPadding/2,),
        Text('Please select categories what you would like to see on your feed. You can set this later on Filter.',
          style: AppTextStyles.s14w400Primary(opacity: 0.82).copyWith(height: 1.8),),
      ],
    );
  }

}