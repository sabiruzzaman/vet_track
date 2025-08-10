import 'package:go_router/go_router.dart';
import 'package:vet_track/presentation/screens/add_daily_data_screen.dart';
import 'package:vet_track/presentation/screens/add_member_screen.dart';
import 'package:vet_track/presentation/screens/add_transaction_screen.dart';
import 'package:vet_track/presentation/screens/auth/create_account_screen.dart';
import 'package:vet_track/presentation/screens/auth/forgot_password_screen.dart';
import 'package:vet_track/presentation/screens/auth/reset_password_screen.dart';
import 'package:vet_track/presentation/screens/auth/signin_screen.dart';
import 'package:vet_track/presentation/screens/auth/verify_screen.dart';
import 'package:vet_track/presentation/screens/barn_screen.dart';
import 'package:vet_track/presentation/screens/finance_screen.dart';
import 'package:vet_track/presentation/screens/home_screen.dart';
import 'package:vet_track/presentation/screens/market_screen.dart';
import 'package:vet_track/presentation/screens/profile_screen.dart';
import 'package:vet_track/presentation/screens/settings_screen.dart';
import 'package:vet_track/routes/routes_name.dart';

import '../presentation/screens/dashboard_screen.dart';
import '../presentation/screens/onboarding/onboarding_screen_one.dart';
import '../presentation/screens/onboarding/onboarding_screen_three.dart';
import '../presentation/screens/onboarding/onboarding_screen_two.dart';

/*
class AppRouter {
  late final GoRouter router;

  AppRouter({required String initialLocation}) {
    router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          name: Routes.onboardingOne,
          path: Routes.onboardingOnePath,
          builder: (context, state) => const OnboardingScreenOne(),
        ),
        GoRoute(
          name: Routes.onboardingTwo,
          path: Routes.onboardingTwoPath,
          builder: (context, state) => const OnboardingScreenTwo(),
        ),
        GoRoute(
          name: Routes.onboardingThree,
          path: Routes.onboardingThreePath,
          builder: (context, state) => const OnboardingScreenThree(),
        ),
        GoRoute(
          name: Routes.dashboard,
          path: Routes.dashboardPath,
          builder: (context, state) => const DashboardScreen(),
        ),

        GoRoute(
          name: Routes.signIn,
          path: Routes.signInPath,
          builder: (context, state) => const SignInScreen(),
        ),

        GoRoute(
          name: Routes.createAccount,
          path: Routes.createAccountPath,
          builder: (context, state) => const CreateAccountScreen(),
        ),

        GoRoute(
          name: Routes.forgotPassword,
          path: Routes.forgotPasswordPath,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),


        GoRoute(
          name: Routes.verify,
          path: Routes.verifyPath,
          builder: (context, state) => const VerifyScreen(),
        ),


        GoRoute(
          name: Routes.resetPassword,
          path: Routes.resetPasswordPath,
          builder: (context, state) => const ResetPasswordScreen(),
        ),

        GoRoute(
          name: Routes.settings,
          path: Routes.settingsPath,
          builder: (context, state) => const SettingsScreen(),
        ),

        GoRoute(
          name: Routes.home,
          path: Routes.homePath,
          builder: (context, state) => const HomeScreen(),
        ),

        GoRoute(
          name: Routes.finance,
          path: Routes.financePath,
          builder: (context, state) => const FinanceScreen(),
        ),

        GoRoute(
          name: Routes.barn,
          path: Routes.barnPath,
          builder: (context, state) => const BarnScreen(),
        ),

        GoRoute(
          name: Routes.market,
          path: Routes.marketPath,
          builder: (context, state) => const MarketScreen(),
        ),

      ],
    );
  }
}
*/


class AppRouter {
  late final GoRouter router;

  AppRouter({required String initialLocation}) {
    router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          name: Routes.onboardingOne,
          path: Routes.onboardingOnePath,
          builder: (context, state) => const OnboardingScreenOne(),
        ),
        GoRoute(
          name: Routes.onboardingTwo,
          path: Routes.onboardingTwoPath,
          builder: (context, state) => const OnboardingScreenTwo(),
        ),
        GoRoute(
          name: Routes.onboardingThree,
          path: Routes.onboardingThreePath,
          builder: (context, state) => const OnboardingScreenThree(),
        ),

        GoRoute(
          name: Routes.dashboard,
          path: Routes.dashboardPath,
          builder: (context, state) => const DashboardScreen(),
          routes: [
            GoRoute(
              name: Routes.home,
              path: 'home',
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              name: Routes.finance,
              path: 'finance',
              builder: (context, state) => const FinanceScreen(),
            ),
            GoRoute(
              name: Routes.barn,
              path: 'barn',
              builder: (context, state) => const BarnScreen(),
            ),
            GoRoute(
              name: Routes.market,
              path: 'market',
              builder: (context, state) => const MarketScreen(),
            ),
          ],
        ),

        GoRoute(
          name: Routes.signIn,
          path: Routes.signInPath,
          builder: (context, state) => const SignInScreen(),
        ),

        GoRoute(
          name: Routes.createAccount,
          path: Routes.createAccountPath,
          builder: (context, state) => const CreateAccountScreen(),
        ),

        GoRoute(
          name: Routes.forgotPassword,
          path: Routes.forgotPasswordPath,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),

        GoRoute(
          name: Routes.verify,
          path: Routes.verifyPath,
          builder: (context, state) => const VerifyScreen(),
        ),

        GoRoute(
          name: Routes.resetPassword,
          path: Routes.resetPasswordPath,
          builder: (context, state) => const ResetPasswordScreen(),
        ),

        GoRoute(
          name: Routes.settings,
          path: Routes.settingsPath,
          builder: (context, state) => const SettingsScreen(),
        ),


        GoRoute(
          name: Routes.profile,
          path: Routes.profilePath,
          builder: (context, state) => const ProfileScreen(),
        ),

        GoRoute(
          name: Routes.addMemberScreen,
          path: Routes.addMemberScreenPath,
          builder: (context, state) => const AddMemberScreen(),
        ),

        GoRoute(
          name: Routes.addTransactionScreen,
          path: Routes.addTransactionScreenPath,
          builder: (context, state) => const AddTransactionScreen(),
        ),

        GoRoute(
          name: Routes.addDailyDataScreen,
          path: Routes.addDailyDataScreenPath,
          builder: (context, state) => const AddDailyDataScreen(),
        ),
      ],
    );
  }
}

