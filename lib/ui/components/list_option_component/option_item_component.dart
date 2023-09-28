import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:nexle_testing_round/resources/resources.dart';
import 'package:nexle_testing_round/ui/components/list_option_component/option_item_mapper.dart';
class OptionItemComponent<T extends BaseOptionItemMapper> extends StatelessWidget{
  const OptionItemComponent({super.key,required this.model, required this.onSelect, required this.onUnselect});
  final T model;
  final CallbackFunction<T> onSelect;
  final CallbackFunction<T> onUnselect;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        model.selected.value = !model.selected.value;
        if(model.selected.value){
          onSelect(model);
        }else{
          onUnselect(model);
        }
      },
      child: Obx(() => model.selected.value?_buildSelected():_buildUnselected()),
    );
  }

  Widget _buildSelected(){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.d8),
        gradient: const LinearGradient(
          begin: FractionalOffset.topRight,
          end: FractionalOffset.bottomLeft,
          colors: [
            Color(0xFF8A32A9),
            Color(0xFF8A00FF),
          ],
        ),
      ),
      child: Text(model.getName(),style: AppTextStyles.s14w400Primary(),),
    );
  }

  Widget _buildUnselected(){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.12)),
          borderRadius: BorderRadius.circular(Dimens.d8)
      ),
      child: Text(model.getName(),style: AppTextStyles.s14w400Primary(),),
    );
  }
}
