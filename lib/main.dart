import 'package:flutter/cupertino.dart';
import 'app/my_app.dart';
import 'helpers/init_helper.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await InitHelper.initApp();
  // DataListResponse<CommentData> dataListResponse= await AppApiService.getInstance().getComments();
  // GetIt.instance.get<CommentDataMapper>().mapToListEntity(dataListResponse.data);
  runApp(const MyApp());
}