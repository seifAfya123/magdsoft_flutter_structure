import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_i18n/flutter_i18n.dart';

late LocalizationDelegate delegate;
bool islogedin = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      final locale =
          CacheHelper.getDataFromSharedPreference(key: 'language') ?? "ar";
      islogedin = CacheHelper.getDataFromSharedPreference(key: 'logedin');
      delegate = await LocalizationDelegate.create(
        fallbackLocale: locale,
        supportedLocales: ['ar', 'en'],
      );
      await delegate.changeLocale(Locale(locale));
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(e.toString());
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()),
        ),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LocalizedApp(
                delegate,
                LayoutBuilder(builder: (context, constraints) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Werash',
                    localizationsDelegates: [
                      GlobalCupertinoLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      delegate,
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocaleLanguage in supportedLocales) {
                        if (supportedLocaleLanguage.languageCode ==
                                locale!.languageCode &&
                            supportedLocaleLanguage.countryCode ==
                                locale.countryCode) {
                          return supportedLocaleLanguage;
                        }
                      }

                      // If device not support with locale to get language code then default get first on from the list
                      return supportedLocales.first;
                    },
                    locale: delegate.currentLocale,
                    supportedLocales: delegate.supportedLocales,
                    onGenerateRoute: widget.appRouter.onGenerateRoute,
                    initialRoute: islogedin ? '/loged' : '/',
                    theme: ThemeData(
                      fontFamily: 'cairo',
                      scaffoldBackgroundColor: AppColor.blue,
                      appBarTheme: const AppBarTheme(
                        elevation: 0.0,
                        systemOverlayStyle: SystemUiOverlayStyle(
                          //statusBarColor: AppColors.transparent,
                          statusBarIconBrightness: Brightness.dark,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}
