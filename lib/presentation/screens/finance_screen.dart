import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../l10n/app_localizations.dart';
import '../../routes/routes_name.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/svg_utils.dart';
import '../../utils/constants/tab_index_notifier.dart';
import '../widgets/custom_app_bar.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        isGreen: true,
        centerTitle: true,
        title: loc.finance,
        showBackButton: true,
        onBack: () {
          tabIndexNotifier.value = 0;
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Row
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.lightBlue,
                            child: SvgPicture.asset(
                              ImageStrings.walletSelectedIcon,
                              width: 16,
                              height: 16,
                              colorFilter: svgColor(AppColors.darkBlue),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            loc.financeSummary,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            loc.lastWeak,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildFlexibleCard(
                            context,
                            AppColors.lightGreen,
                           loc.income,
                            "5000",
                            ImageStrings.importIcon,
                            AppColors.primaryGreen,
                          ),
                          SizedBox(width: 8),
                          buildFlexibleCard(
                            context,
                            AppColors.lightPink,
                            loc.expense,
                            "4000",
                            ImageStrings.exportIcon,
                            AppColors.pink,
                          ),
                          SizedBox(width: 8),
                          buildFlexibleCard(
                            context,
                            AppColors.lightBlue,
                           loc.balance,
                            "3400",
                            ImageStrings.coinIcon,
                            AppColors.darkBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 26),

              Text(
                loc.transactionHistory,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 10),

              Column(
                children:  [
                  SummaryItem(
                    avatarBgColor: AppColors.lightPink,
                    iconPath: ImageStrings.capsuleIcon,
                    iconColor: AppColors.pink,
                    title: loc.medicines,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$200',
                    amountColor: AppColors.pink,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightGreen,
                    iconPath: ImageStrings.eggIcon,
                    iconColor: AppColors.primaryGreen,
                    title:loc.eggs,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$600',
                    amountColor: AppColors.primaryGreen,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightGreen,
                    iconPath: ImageStrings.milkOrganicIcon,
                    iconColor: AppColors.primaryGreen,
                    title: loc.milkYield,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$200',
                    amountColor: AppColors.primaryGreen,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightPink,
                    iconPath: ImageStrings.capsuleIcon,
                    iconColor: AppColors.pink,
                    title: loc.medicines,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$200',
                    amountColor: AppColors.pink,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightGreen,
                    iconPath: ImageStrings.eggIcon,
                    iconColor: AppColors.primaryGreen,
                    title: loc.eggs,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$600',
                    amountColor: AppColors.primaryGreen,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightGreen,
                    iconPath: ImageStrings.milkOrganicIcon,
                    iconColor: AppColors.primaryGreen,
                    title: loc.milkYield,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$200',
                    amountColor: AppColors.primaryGreen,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightPink,
                    iconPath: ImageStrings.capsuleIcon,
                    iconColor: AppColors.pink,
                    title: loc.medicines,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$200',
                    amountColor: AppColors.pink,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightGreen,
                    iconPath: ImageStrings.eggIcon,
                    iconColor: AppColors.primaryGreen,
                    title: loc.eggs,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$600',
                    amountColor: AppColors.primaryGreen,
                  ),
                  SummaryItem(
                    avatarBgColor: AppColors.lightGreen,
                    iconPath: ImageStrings.milkOrganicIcon,
                    iconColor: AppColors.primaryGreen,
                    title: loc.milkYield,
                    subtitle: '${loc.dummyDate} | ${loc.dummyTime}',
                    amount: '\$200',
                    amountColor: AppColors.primaryGreen,
                  ),

                ],
              ),

              SizedBox(height: 70,)


            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            context.push(Routes.addTransactionScreenPath);
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.green,
          child: const Icon(Icons.add, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}

Widget buildFlexibleCard(
  BuildContext context,
  Color cardColor,
  String animalName,
  String animalCount,
  String imagePath,
  Color svgTintColor,
) {
  return Expanded(
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Card background
        Container(
          height: 85,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(top: 26),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Text(
                "\$$animalCount",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: svgTintColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                animalName,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: svgTintColor,
                ),
              ),
            ],
          ),
        ),

        // Top icon circle
        Positioned(
          top: 0,
          child: Builder(
            builder: (context) {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              final circleColor = isDark ? AppColors.black : Colors.white;

              return Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: circleColor,
                ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cardColor,
                  ),
                  child: SvgPicture.asset(
                    imagePath,
                    width: 24,
                    height: 24,
                    colorFilter: svgColor(svgTintColor),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}



class SummaryItem extends StatelessWidget {
  final Color avatarBgColor;
  final String iconPath;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;

  const SummaryItem({
    super.key,
    required this.avatarBgColor,
    required this.iconPath,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: avatarBgColor,
                child: SvgPicture.asset(
                  iconPath,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
