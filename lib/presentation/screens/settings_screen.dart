import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_track/routes/routes_name.dart';
import 'package:vet_track/utils/constants/colors.dart';
import 'package:vet_track/utils/constants/image_strings.dart';

import '../../bloc/locale_bloc/locale_bloc.dart';
import '../../bloc/locale_bloc/locale_event.dart';
import '../../bloc/locale_bloc/locale_state.dart';
import '../../bloc/theme_bloc/theme_bloc.dart';
import '../../l10n/app_localizations.dart';
import '../../model/language.dart';
import '../widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final loc = AppLocalizations.of(context)!;

    final textTheme = Theme.of(context).textTheme;
    final arrowIcon = Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primaryGreen);

    Widget sectionHeader(String title) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(title.toUpperCase(),
          style: textTheme.labelMedium?.copyWith(color: Colors.grey)),
    );

    Widget settingRow(String label, {String? trailing, VoidCallback? onTap}) => InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Text(label, style: textTheme.titleMedium),
            const Spacer(),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(trailing, style: textTheme.bodyMedium),
              ),
            arrowIcon,
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: loc.settings,
        centerTitle: true,
        showBackButton: true,
        isGreen: true,
        onBack: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            context.goNamed(Routes.dashboard); // Navigate to home if no back stack
          }
        },
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          sectionHeader(loc.preferences),

          BlocSelector<LocaleBloc, LocaleState, Language>(
            selector: (state) => state.selectedLanguage,
            builder: (context, lang) {
              return settingRow(
                loc.language,
                trailing: lang == Language.english ? 'English' : 'বাংলা',
                onTap: () => showLanguageSelectorBottomSheet(context,loc),
              );
            },
          ),



          BlocSelector<ThemeBloc, ThemeState, bool>(
            selector: (state) => state.themeData.brightness == Brightness.dark,
            builder: (context, isDark) {
              return settingRow(
                loc.theme,
                trailing: isDark ? loc.darkMode : loc.lightMode,
                onTap: () {
                  showThemeSelectorBottomSheet(context, loc);
                },
              );
            },
          ),



          settingRow(loc.pushNotifications, onTap: () {}),
          settingRow(loc.categories, onTap: () {}),
          const Divider(height: 30, thickness: 0.5, indent: 20, endIndent: 20),
          sectionHeader(loc.support),
          settingRow(loc.featuresRequest, onTap: () {}),
          settingRow(loc.contactUs, onTap: () {}),
          settingRow(loc.requestDataReport, onTap: () {}),
          settingRow(loc.reportBug, onTap: () {}),
          const Divider(height: 30, thickness: 0.5, indent: 20, endIndent: 20),
          sectionHeader(loc.about),
          settingRow(loc.privacyPolicy, onTap: () {}),
          settingRow(loc.termsAndConditions, onTap: () {}),
          const SizedBox(height: 20),


        ],
      ),
    );
  }
}


void showLanguageSelectorBottomSheet(BuildContext context, AppLocalizations loc ) {
  final bloc = context.read<LocaleBloc>();
  final selectedLang = bloc.state.selectedLanguage;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Top small indicator bar
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 12),

            /// Title with Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
              loc.selectYourLanguage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            const SizedBox(height: 8),
            const Divider(thickness: 0.8),

            /// Language List
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(ImageStrings.englishFlag),
                radius: 16,
              ),
              title: Text(loc.english),
              trailing: selectedLang == Language.english
                  ? const Icon(Icons.check, color: AppColors.primaryGreen)
                  : null,
              onTap: () {
                bloc.add(ChangeLocaleEvent(selectedLanguage: Language.english));
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(ImageStrings.bangladeshFlag),
                radius: 16,
              ),
              title:  Text(loc.bangla),
              trailing: selectedLang == Language.bangla
                  ? const Icon(Icons.check, color: AppColors.primaryGreen)
                  : null,
              onTap: () {
                bloc.add(ChangeLocaleEvent(selectedLanguage: Language.bangla));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

void showThemeSelectorBottomSheet(BuildContext context,  AppLocalizations loc) {
  final bloc = context.read<ThemeBloc>();
  final isDarkTheme = bloc.state.themeData.brightness == Brightness.dark;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Top small indicator bar
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 12),

            /// Title with Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                   loc.selectYourTheme,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            const SizedBox(height: 8),
            const Divider(thickness: 0.8),

            /// Light Theme
            ListTile(
              leading: const Icon(Icons.light_mode),
              title:  Text(loc.lightMode),
              trailing: !isDarkTheme
                  ? const Icon(Icons.check, color: AppColors.primaryGreen)
                  : null,
              onTap: () async {
                if (isDarkTheme) {
                  bloc.add(ToggleThemeEvent());
                }
                Navigator.pop(context);
              },
            ),

            /// Dark Theme
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title:  Text(loc.darkMode),
              trailing: isDarkTheme
                  ? const Icon(Icons.check, color: AppColors.primaryGreen)
                  : null,
              onTap: () async {
                if (!isDarkTheme) {
                  bloc.add(ToggleThemeEvent());
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}


