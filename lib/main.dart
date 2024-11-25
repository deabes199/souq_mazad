import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_mazad/core/di/dependancy_injection.dart';
import 'package:souq_mazad/core/helper/bloc_observer.dart';
import 'package:souq_mazad/core/router/app_router.dart';
import 'package:souq_mazad/core/router/routes.dart';

void main() async {
  await setupGitIt();
  Bloc.observer = ProductBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
