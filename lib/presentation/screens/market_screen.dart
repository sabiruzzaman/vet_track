import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vet_track/utils/constants/image_strings.dart';
import 'package:vet_track/utils/constants/svg_utils.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/tab_index_notifier.dart';
import '../widgets/custom_app_bar.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        isGreen: true,
        centerTitle: true,
        title: loc.animalMarket,
        showBackButton: true,
        onBack: () {
          tabIndexNotifier.value = 0;
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildAnimalCard(context, loc),
              const SizedBox(height: 16),
              _buildAnimalCard(context, loc),
              const SizedBox(height: 16),
              _buildAnimalCard(context, loc),
              SizedBox(height: 70,)
            ],
          ),

        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: AppColors.green,
          child: const Icon(Icons.add, color: Colors.white, size: 24),
        ),
      ),
    );
  }

  Widget _buildAnimalCard(BuildContext context, AppLocalizations loc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGray, width: 1.5),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.murrahCrossBuffalo,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(loc.hoursAgo),
                ],
              ),
              const Spacer(),

              const SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.lightGray,
                child: Icon(Icons.favorite_border, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(ImageStrings.buffaloImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImageStrings.priceLabelIcon,
                        colorFilter: svgColor(AppColors.white),
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Tk. 1,50,000',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Text(
                '${loc.breed}: ${loc.murrahCross}',
                style: Theme.of(context).textTheme.labelMedium,
              ),

              const Spacer(),
              Text(
                '${loc.lactation}: 2.5 L',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),

          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${loc.milkCapacity}: 8 Ltr',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.start,
              ),

              const Spacer(),
              Text(
                '${loc.milkYield}: 2340 Ltr',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: AppColors.lightGray, thickness: 1.5),
          ),

          Text(loc.owner, style: Theme.of(context).textTheme.bodySmall),

          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(ImageStrings.onBoardingScreen1),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          loc.kamalKumar,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(loc.animalMarket),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.lightGreen,
                      child: Icon(Icons.call, color: AppColors.primaryGreen),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
