import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/features/member/home/manager/food_cubit.dart';
import 'package:gym_app/features/member/home/manager/member_cubit.dart';
import 'core/cubit/language/language_cubit.dart';
import 'core/rouets/app_router.dart';

import 'features/member/home/manager/bottom_nav_bar_cubit.dart';
import 'features/member/shop/manager/cart_cubit.dart';
import 'features/member/shop/manager/market_cubit.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
    BlocProvider(create: (_) => BottomNavBarCubit()),
    BlocProvider(create: (_) => CartCubit()),
    BlocProvider(create: (_) => FoodCubit()..loadFoods()),
    BlocProvider(create: (_) => MarketCubit()..loadProducts()),
    BlocProvider(create: (_) => MemberCubit()..loadMember()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            final cubit = context.read<LanguageCubit>();
            bool isArabic = cubit.isArabic ?? false;

            if (state is LanguageChanged) {
              isArabic = state.isArabic;
            }

            final currentLocale = isArabic
                ? const Locale('ar')
                : const Locale('en');

            return MaterialApp.router(
              routerConfig: AppRouter.getRouter(
                isNotFirstLogin: false,
                token: '',
              ),
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),

              locale: currentLocale,
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(1.0)),
                  child: widget!,
                );
              },
            );
          },
        );
      },
    );
  }
}
