import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Core/dependency/provider.dart';
import 'Core/navigation/router.dart';
import 'Core/utils/themes.dart';
import 'Features/CategoriesDetail/presentation/widgets/ism.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => NameCubit(),
          child: MultiProvider(
            providers: providers,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.darkTheme,
              routerConfig: router,
            ),
          ),
        );
      },
    );
  }
}
