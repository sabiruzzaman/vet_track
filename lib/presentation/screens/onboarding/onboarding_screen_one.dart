import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/locale_bloc/locale_bloc.dart';
import '../../../bloc/locale_bloc/locale_event.dart';
import '../../../bloc/locale_bloc/locale_state.dart';
import '../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../bloc/onboarding/onboarding_event.dart';
import '../../../bloc/onboarding/onboarding_state.dart';
import '../../../l10n/app_localizations.dart';
import 'package:vet_track/model/language.dart';
import '../../../utils/constants/colors.dart';
import '../../../routes/routes_name.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/svg_utils.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.chooseLanguage)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.3,
                        ),
                    itemCount: Language.values.length,
                    itemBuilder: (context, index) {
                      final lang = Language.values[index];
                      final isSelected = state.selectedLanguage == lang;

                      return GestureDetector(
                        onTap: () {
                          context.read<LocaleBloc>().add(
                            ChangeLocaleEvent(selectedLanguage: lang),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.lightGreen
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primaryGreen
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lang.text,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? AppColors.primaryGreen
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                   child: SvgPicture.asset(
                                     index==0
                                        ? ImageStrings.enLanguageIcon
                                        : ImageStrings.bnLanguageIcon,
                                      width: 50,
                                      height: 50,
                                      colorFilter: svgColor(
                                        isSelected
                                            ? AppColors.primaryGreen
                                            : Colors.grey,
                                      ),)
                                   /* child: Text(
                                      lang.value.languageCode.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? AppColors.primaryGreen
                                            : Colors.grey,
                                      ),
                                    ),*/
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<OnboardingBloc>().add(ChangeStepEvent(1));
                        context.go(Routes.onboardingTwoPath);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Incomplete part (faded)
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(
                                  value: 1.0, // Full circle
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.green.withValues(alpha: 0.1),
                                  ),
                                ),
                              ),
                              // Completed part (solid)
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(
                                  value: state.progress, // Actual progress
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.green,
                                  ),
                                  backgroundColor: Colors
                                      .transparent, // Let bottom ring show
                                ),
                              ),
                              // Center button with arrow
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
