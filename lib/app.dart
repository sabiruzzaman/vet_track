import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/locale_bloc/locale_bloc.dart';
import '../l10n/app_localizations.dart';
import 'bloc/locale_bloc/locale_state.dart';
import 'bloc/theme_bloc/theme_bloc.dart';
import 'routes/router.dart' as app_router;


class App extends StatefulWidget {
  final String initialRoute;
  const App({super.key, required this.initialRoute});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final _appRouter = app_router.AppRouter(initialLocation: widget.initialRoute);

  @override
  Widget build(BuildContext context) {
    final router = _appRouter.router;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp.router(
              theme: themeState.themeData,
              locale: localeState.selectedLanguage.value,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}

