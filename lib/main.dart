import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/locale_bloc/locale_event.dart';
import 'bloc/onboarding/onboarding_bloc.dart';
import 'bloc/onboarding/onboarding_event.dart';
import 'bloc/theme_bloc/theme_bloc.dart';
import 'bloc/locale_bloc/locale_bloc.dart';
import 'app.dart';
import 'routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Read onboarding state from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final completed = prefs.getBool('isOnboardingCompleted') ?? false;
  final step = prefs.getInt('onboarding_step') ?? 0;

  String initialRoute;
  if (completed) {
    initialRoute = Routes.dashboardPath;
  } else {
    initialRoute = step == 0
        ? Routes.onboardingOnePath
        : step == 1
        ? Routes.onboardingTwoPath
        : Routes.onboardingThreePath;
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..add(LoadThemeEvent()),
        ),
        BlocProvider<LocaleBloc>(
          create: (_) => LocaleBloc()..add(LoadLocaleEvent()),
        ),
        BlocProvider<OnboardingBloc>(
          create: (_) => OnboardingBloc()..add(LoadOnboardingEvent()),
        ),
      ],
      child: App(initialRoute: initialRoute),
    ),
  );

}
