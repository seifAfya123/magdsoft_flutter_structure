import 'package:flutter/material.dart';
// import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
// import 'package:magdsoft_flutter_structure/data/models/my_repo.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/home%20screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';

class AppRouter {
  // late MyRepo myRepo;
  // late GlobalCubit globalCubit;
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => SplashScreen(screen: LoginScreen()));
      case '/loged':
        return MaterialPageRoute(
            builder: (_) => SplashScreen(screen: HomeScreen()));
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case RegisterScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      default:
        return null;
    }
  }
}
