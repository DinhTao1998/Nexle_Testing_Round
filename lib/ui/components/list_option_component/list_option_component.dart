import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/resources/constants/size_constants.dart';
import 'package:nexle_testing_round/resources/dimens/dimens.dart';
import 'option_item_mapper.dart';
import 'package:get/get.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'option_item_component.dart';

class ListOptionComponent<T extends BaseOptionItemMapper> extends StatelessWidget{
  const ListOptionComponent({super.key, required this.listModel,this.selectList = const [], required this.onSelect, required this.onUnselect});
  final List listModel;
  final List selectList;
  final CallbackFunction<T> onSelect;
  final CallbackFunction<T> onUnselect;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: SizeConstants.defaultPadding),
      crossAxisCount: 3,
      crossAxisSpacing: Dimens.d5,
      mainAxisSpacing: Dimens.d5,
      childAspectRatio: 3/2,
      children: listModel.map((e) => OptionItemComponent<T>(
          model: GetIt.instance.get<T>(param1: e,param2: selectList.contains(e).obs),
        onSelect: onSelect,
        onUnselect: onUnselect,
      )).toList(),
    );
  }
}