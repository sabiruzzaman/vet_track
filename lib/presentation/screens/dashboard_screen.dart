import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_track/utils/constants/colors.dart';
import 'package:vet_track/utils/constants/image_strings.dart';
import '../../l10n/app_localizations.dart';
import '../../routes/routes_name.dart';
import '../../utils/constants/tab_index_notifier.dart';
import 'barn_screen.dart';
import 'finance_screen.dart';
import 'home_screen.dart';
import 'market_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen ({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    FinanceScreen(),
    BarnScreen(),
    MarketScreen(),
  ];

  @override
  void initState() {
    super.initState();
    tabIndexNotifier.addListener(() {
      setState(() {
        _currentIndex = tabIndexNotifier.value;
      });
    });
  }

  @override
  void dispose() {
    tabIndexNotifier.removeListener(() {});
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;


    return Scaffold(

      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:MediaQuery.of(context).padding.top + 10),
            // Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(ImageStrings.onBoardingScreen1),
                      radius: 25,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          loc.kamalKumar,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          loc.editProfile,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  context.go(Routes.profilePath);
                },
              )
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 1, color: Colors.black12), // Divider added
            // Menu Items
            ListTile(
              leading: SvgPicture.asset(
                ImageStrings.routeIcon,
                width: 30,
                height: 30,
              ),
              title:  Text(loc.vetNearMe),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                ImageStrings.noteIcon,
                width: 30,
                height: 30,
              ),
              title:  Text(loc.notes),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                ImageStrings.settingIcon,
                width: 30,
                height: 30,
              ),
              title: Text(loc.settings),
              onTap: () {
                context.go(Routes.settingsPath);
              },
            ),

            const Spacer(),

            // Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                leading: SvgPicture.asset(
                  ImageStrings.logoutIcon,
                  width: 30,
                  height: 30,
                ),
                title:  Text(
                  loc.logout,
                  style: TextStyle(color: AppColors.primaryGreen),
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10),

            /*// Logo and Version
            Center(
              child: Column(
                children: [
                  Image.asset('assets/logo/vet_track_logo.png', height: 40),
                  // Replace with your actual logo path
                  const SizedBox(height: 4),
                  const Text(
                    "v809.09.03",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),*/
          ],
        ),
      ),

      body: Column(
        children: [
          // This is where the selected tab's screen will be shown
          Expanded(
            child: _screens[_currentIndex],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => tabIndexNotifier.value = index,
      items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 0
                  ? ImageStrings.homeSelectedIcon
                  : ImageStrings.homeUnSelectedIcon,
              width: 30,
              height: 30,
            ),
            label: loc.home,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 1
                  ? ImageStrings.walletSelectedIcon
                  : ImageStrings.walletUnSelectedIcon,
              width: 30,
              height: 30,
            ),
            label: loc.finance,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 2
                  ? ImageStrings.petSelectedIcon
                  : ImageStrings.petUnSelectedIcon,
              width: 30,
              height: 30,
            ),
            label: loc.barn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 3
                  ? ImageStrings.shopSelectedIcon
                  : ImageStrings.shopUnSelectedIcon,
              width: 30,
              height: 30,
            ),
            label: loc.market,
          ),
        ],
      ),
    );
  }
}


