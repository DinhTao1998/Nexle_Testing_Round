import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nexle_testing_round/navigation/navigation.dart';
import 'package:nexle_testing_round/resources/resources.dart';
import 'package:get_it/get_it.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(DeviceConstants.designDeviceWidth, DeviceConstants.designDeviceHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.of(context).primaryColor,
              fontFamily: AppTextStyles.fontFamily,
              textTheme: AppTextStyles.textTheme,
            ),
            title: AppStrings.APP_NAME,
            initialRoute: GetIt.instance.get<AppRouter>().initRoute,
            getPages: GetIt.instance.get<AppRouter>().router
        );
      },
    );
  }
}