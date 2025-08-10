import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../l10n/app_localizations.dart';
import '../../routes/routes_name.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import 'package:intl/intl.dart';

import '../widgets/donut_chart_painter_widget.dart';
import '../widgets/legend_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final loc = AppLocalizations.of(context)!;

    List<BarChartGroupData> barGroups() {
      final actualValues = [35, 40, 40, 40, 40, 30, 40];
      final maxValues = [50, 50, 50, 50, 50, 40, 60];

      return List.generate(7, (index) {
        final actual = actualValues[index].toDouble();
        final max = maxValues[index].toDouble();

        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: max, // max height
              width: 14,
              borderRadius: BorderRadius.circular(6),
              rodStackItems: [
                BarChartRodStackItem(0, actual, AppColors.darkYellow),
                // Actual (filled)
                BarChartRodStackItem(actual, max, AppColors.lightYellow),
                // Remaining part (lighter fill)
              ],
            ),
          ],
        );
      });
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 16,
          right: 16,
          bottom: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  // ✅ This will open the parent drawer
                  GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(ImageStrings.onBoardingScreen1),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.goodMorning,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(loc.staticPhonNumber),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    ImageStrings.searchIcon,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        ImageStrings.notificationIcon,
                        width: 30,
                        height: 30,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.primaryGreen,
                          child: const Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              TopFilterBar(
                selectedAnimal: loc.buffalo,
                onAnimalTap: () {},
                startDate: DateTime(2023, 1, 1),
                endDate: DateTime(2024, 1, 28),
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  buildFlexibleCard(
                    context,
                    loc.buffalo,
                    '10',
                    ImageStrings.petSelectedIcon,
                  ),
                  SizedBox(width: 8),
                  buildFlexibleCard(
                    context,
                    loc.sick,
                    '05',
                    ImageStrings.thermometerIcon,
                  ),
                  SizedBox(width: 8),
                  buildFlexibleCard(
                    context,
                    loc.vaccinated,
                    '02',
                    ImageStrings.syringeIcon,
                  ),
                  SizedBox(width: 8),
                  buildFlexibleCard(
                    context,
                    loc.pregnant,
                    '04',
                    ImageStrings.lovelyIcon,
                  ),
                ],
              ),

              SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.lightYellow,
                                child: SvgPicture.asset(
                                  ImageStrings.eggIcon,
                                  width: 20,
                                  height: 20,
                                ),
                              ),

                              const SizedBox(width: 8),
                              Text(
                                loc.eggReport,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            loc.lastWeak,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            gridData: FlGridData(
                              show: true,
                              drawHorizontalLine: true,
                              drawVerticalLine: false,
                              horizontalInterval: 10,
                              checkToShowHorizontalLine: (value) {
                                // মধ্যবর্তী সব interval দেখাবে
                                return value % 10 == 0 && value > 0 && value < 60;
                              },
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  strokeWidth: 1,
                                );
                              },
                            ),
                            borderData: FlBorderData(show: false),
                            minY: 0,
                            maxY: 60,
                            // 🔹 0 আর 60 এর জন্য extra লাইন
                            extraLinesData: ExtraLinesData(
                              horizontalLines: [
                                HorizontalLine(
                                  y: 0,
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  strokeWidth: 1,
                                ),
                                HorizontalLine(
                                  y: 60,
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  strokeWidth: 1,
                                ),
                              ],
                            ),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 10,
                                  getTitlesWidget: (value, _) {
                                    if (value % 10 == 0 &&
                                        value >= 0 &&
                                        value <= 60) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: const TextStyle(fontSize: 12),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ),

                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 1,
                                  reservedSize: 30, // Increase if needed
                                  getTitlesWidget: (value, meta) {
                                    final days = [
                                      'Mon',
                                      'Tue',
                                      'Wed',
                                      'Thu',
                                      'Fri',
                                      'Sat',
                                      'Sun',
                                    ];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        days[value.toInt() % days.length],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            barGroups: barGroups(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Row
                      Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.lightBlue,
                                child: SvgPicture.asset(
                                  ImageStrings.milkIcon,
                                  width: 20,
                                  height: 20,
                                ),
                              ),

                              const SizedBox(width: 8),
                              Text(
                                loc.milkYield,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            loc.lastWeak,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Donut + Legends Row
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Donut Chart (fixed size)
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CustomPaint(
                                painter: DonutChartPainter(
                                  values: [324, 182, 100],
                                  colors: const [
                                    AppColors.darkBlue,
                                    AppColors.primaryDark,
                                    AppColors.lightBlue,
                                  ],
                                ),
                              ),
                            ),

                            const Spacer(), // ✅ চার্ট আর লেজেন্ডকে আলাদা করবে
                            // Legends ডান পাশে
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LegendItem(
                                  color: AppColors.darkBlue,
                                  title: "324 Ltr",
                                  subtitle: loc.buffaloMilk,
                                ),
                                SizedBox(height: 8),
                                LegendItem(
                                  color: AppColors.primaryDark,
                                  title: "182 Ltr",
                                  subtitle: loc.cattleMilk,
                                ),
                                SizedBox(height: 8),
                                LegendItem(
                                  color: AppColors.lightBlue,
                                  title: "12 Ltr",
                                  subtitle: loc.goatMilk,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Row
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.lightGreen,
                            child: SvgPicture.asset(
                              ImageStrings.burgerIcon,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            loc.feedSummary,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            loc.lastWeak,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Donut + Legends Row
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Donut Chart (fixed size)
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CustomPaint(
                                painter: DonutChartPainter(
                                  values: [324, 182, 100],
                                  colors: const [
                                    AppColors.green,
                                    AppColors.primaryDark,
                                    AppColors.lightGreen,
                                  ],
                                ),
                              ),
                            ),

                            const Spacer(), // ✅ চার্ট আর লেজেন্ডকে আলাদা করবে
                            // Legends ডান পাশে
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                LegendItem(
                                  color: AppColors.green,
                                  title: "500 Kg",
                                  subtitle: "Green Fodder",
                                ),
                                SizedBox(height: 8),
                                LegendItem(
                                  color: AppColors.primaryDark,
                                  title: "340 Kg",
                                  subtitle: "Dry Fodder",
                                ),
                                SizedBox(height: 8),
                                LegendItem(
                                  color: AppColors.lightGreen,
                                  title: "200 Kg",
                                  subtitle: "Concentrate",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80,)
            ],
          ),
        ),


      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            context.push(Routes.addDailyDataScreenPath);
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.green,
          child: const Icon(Icons.add, color: Colors.white, size: 24),
        ),
      ),
    );

  }
}

class TopFilterBar extends StatelessWidget {


  final String selectedAnimal;
  final VoidCallback onAnimalTap;
  final DateTime startDate;
  final DateTime endDate;

  const TopFilterBar({
    super.key,
    required this.selectedAnimal,
    required this.onAnimalTap,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final dateRange =
        "${DateFormat('dd MMM yy').format(startDate)} - ${DateFormat('dd MMM yy').format(endDate)}";

    return Row(

      children: [
        GestureDetector(
          onTap: onAnimalTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppColors.primaryDark : Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  selectedAnimal,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: isDark ? AppColors.white : AppColors.primaryDark,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Text(
          dateRange,
          style: const TextStyle(
            color: Color(0xFF8A8A8E),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

Widget buildFlexibleCard(
  BuildContext context,
  String animalName,
  String animalCount,
  String imagePath,
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
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Text(
                animalCount,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                animalName,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD7F5DD),
                  ),
                  child: SvgPicture.asset(imagePath, width: 24, height: 24),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
