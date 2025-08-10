import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_track/utils/constants/tab_index_notifier.dart';
import '../../l10n/app_localizations.dart';
import '../../routes/routes_name.dart';
import '../../utils/constants/colors.dart';
import '../widgets/custom_app_bar.dart';

class BarnScreen extends StatefulWidget {
  const BarnScreen({super.key});

  @override
  State<BarnScreen> createState() => _BarnScreenState();
}

class _BarnScreenState extends State<BarnScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        isGreen: true,
        centerTitle: true,
        title: loc.barn,
        showBackButton: true,
        onBack: () {
          tabIndexNotifier.value = 0;
        },
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Total Animals Container
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              padding:  EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    loc.totalAnimalsInBarn,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '30',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Custom TabBar
            SizedBox(
              height: 100,
              child: TabBar(
                controller: _tabController,
                tabs: [
                  _buildTab('7', loc.buffalo, 0),
                  _buildTab('3', loc.cow, 1),
                  _buildTab('20', loc.chicken, 2),
                  _buildTab('2', loc.goat, 3),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 16,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.lightGray,
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        loc.murrahCross,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                      ),
                                      Text('${loc.tagNo}: 124924'),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    '(${loc.jersey})',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                  const SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.lightGreen,
                                    child: Icon(
                                      Icons.more_vert,
                                      color: AppColors.primaryGreen,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: AppColors.lightGray, thickness: 1.5),

                              Column(
                                children:  [
                                  InfoRow(label: loc.pregnant, status: loc.yes, note: '87 days left'),
                                  InfoRow(label: loc.inMilk, status: loc.yes, note: ''),
                                  InfoRow(label: loc.dry, status: loc.no, note: ''),
                                  InfoRow(label: loc.milkCapacity, status: '', note: '10 Ltr/Day'),
                                  InfoRow(label: loc.vaccination, status: loc.yes, note: ''),
                                  InfoRow(label: loc.lastVaccineDate, status: '', note: '2023-10-01'),
                                  InfoRow(label: loc.feed, status: '', note: '${loc.greenFodder}, ${loc.dryFodder}'),
                                ],
                              )



                            ],
                          ),
                        ),
                        SizedBox(height: 16,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.lightGray,
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        loc.murrahCross,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                      ),
                                      Text('${loc.tagNo}: 124924'),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    '(${loc.jersey})',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                  const SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.lightGreen,
                                    child: Icon(
                                      Icons.more_vert,
                                      color: AppColors.primaryGreen,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: AppColors.lightGray, thickness: 1.5),

                              Column(
                                children:  [
                                  InfoRow(label: loc.pregnant, status: loc.yes, note: '87 days left'),
                                  InfoRow(label: loc.inMilk, status: loc.yes, note: ''),
                                  InfoRow(label: loc.dry, status: loc.no, note: ''),
                                  InfoRow(label: loc.milkCapacity, status: '', note: '10 Ltr/Day'),
                                  InfoRow(label: loc.vaccination, status: loc.yes, note: ''),
                                  InfoRow(label: loc.lastVaccineDate, status: '', note: '2023-10-01'),
                                  InfoRow(label: loc.feed, status: '', note: '${loc.greenFodder}, ${loc.dryFodder}'),
                                ],
                              )



                            ],
                          ),
                        ),
                        SizedBox(height: 70,)

                      ],
                    ),

                  ),
                  Column(
                    children: [
                      SizedBox(height: 16,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.lightGray,
                            width: 1.5,
                          ),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      loc.sahiwal,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
                                    ),
                                    Text('${loc.tagNo}: 124924'),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  '(${loc.jersey})',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                const SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.lightGreen,
                                  child: Icon(
                                    Icons.more_vert,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: AppColors.lightGray, thickness: 1.5),

                            Column(
                              children:  [
                                InfoRow(label: loc.pregnant, status: loc.yes, note: '87 days left'),
                                InfoRow(label: loc.inMilk, status: loc.yes, note: ''),
                                InfoRow(label: loc.dry, status: loc.no, note: ''),
                                InfoRow(label: loc.milkCapacity, status: '', note: '10 Ltr/Day'),
                                InfoRow(label: loc.vaccination, status: loc.yes, note: ''),
                                InfoRow(label: loc.lastVaccineDate, status: '', note: '2023-10-01'),
                                InfoRow(label: loc.feed, status: '', note: '${loc.greenFodder}, ${loc.dryFodder}'),
                              ],
                            )



                          ],
                        ),
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.lightGray,
                            width: 1.5,
                          ),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      loc.deshi,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                                const Spacer(),

                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.lightGreen,
                                  child: Icon(
                                    Icons.more_vert,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: AppColors.lightGray, thickness: 1.5),

                            Column(
                              children:  [
                                InfoRow(label: loc.noOfBirds,status:  '', note: '20'),
                                InfoRow(label: loc.eggProductionPerBird, status: '', note: '1/Day'),
                                InfoRow(label: loc.vaccination, status: loc.yes, note: ''),
                                InfoRow(label: loc.lastVaccineDate, status: '', note: '2023-10-01'),
                                InfoRow(label: loc.feed, status: '', note: '${loc.mixedFeed}, ${loc.corn}'),
                              ],
                            )



                          ],
                        ),
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.lightGray,
                            width: 1.5,
                          ),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      loc.blackBengal,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                                const Spacer(),

                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.lightGreen,
                                  child: Icon(
                                    Icons.more_vert,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: AppColors.lightGray, thickness: 1.5),

                            Column(
                              children:  [
                                InfoRow(label: loc.noOfGoats,status:  '', note: '20'),
                                InfoRow(label: loc.milkCapacity, status: '', note: '1Ltr/Day'),
                                InfoRow(label: loc.vaccination, status: loc.yes, note: ''),
                                InfoRow(label: loc.lastVaccineDate, status: '', note: '2023-10-01'),
                                InfoRow(label: loc.feed, status: '', note: '${loc.mixedFeed}, ${loc.corn}'),
                              ],
                            )



                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            context.push(Routes.addMemberScreenPath);
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.green,
          child: const Icon(Icons.add, color: Colors.white, size: 24),
        ),
      ),
    );
  }

  // Tab Builder
  Widget _buildTab(String number, String label, int index) {
    bool isSelected = _tabController.index == index;

    return PreferredSize(
      preferredSize: const Size(90, 70), // force height and width
      child: Container(
        width: 90,
        height: 70,
        //  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.lightGray,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String status;
  final String note;

  const InfoRow({
    super.key,
    required this.label,
    required this.status,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label - Left aligned
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: textTheme.bodyMedium,
              ),
            ),
          ),
          // Status - Center aligned
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                status,
                style: textTheme.bodyLarge?.copyWith(
                  color:AppColors.primaryGreen,
                  fontWeight: (status.toLowerCase() == 'yes' || status.toLowerCase() == 'no')
                      ? FontWeight.w600
                      : null,
                ),
              ),
            ),
          ),
          // Note - Right aligned
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                note,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}






