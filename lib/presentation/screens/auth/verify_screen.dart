import 'package:flutter/material.dart';
import 'package:vet_track/utils/constants/colors.dart';

import '../../../l10n/app_localizations.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                          loc.verify,
                          style: Theme.of(context).textTheme.headlineLarge
                      ),

                      const SizedBox(height: 6),
                      Text(
                          loc.enterTheCodeWhichWasSentToYourEmailOrPhoneNumber,
                          style: Theme.of(context).textTheme.titleMedium
                      ),

                      const SizedBox(height: 16),

                      // Email / Phone
                      TextField(
                        decoration: InputDecoration(labelText: loc.enterCode),
                      ),


                      const SizedBox(height: 40),

                      // Login Button

                      ElevatedButton(onPressed: (){}, child: Text(loc.verify)),

                      const SizedBox(height: 16),


                      // Remember Me + Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            loc.dontReceiveCode,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),

                          TextButton(
                            onPressed: () {},
                            child: Text(
                              loc.resendNow,
                              style: TextStyle(
                                color: AppColors.primaryGreen,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
