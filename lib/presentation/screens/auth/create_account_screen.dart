import 'package:flutter/material.dart';
import 'package:vet_track/presentation/widgets/password_text_field_widget.dart';
import 'package:vet_track/utils/constants/colors.dart';

import '../../../l10n/app_localizations.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
                          loc.createAnAccount,
                          style: Theme.of(context).textTheme.headlineLarge
                      ),

                      const SizedBox(height: 6),
                      Text(
                          loc.createAccountInstruction,
                          style: Theme.of(context).textTheme.titleMedium
                      ),

                      const SizedBox(height: 30),


                      // Email / Phone
                      TextField(
                        decoration: InputDecoration(labelText: loc.name),
                      ),
                      const SizedBox(height: 16),


                      // Email / Phone
                      TextField(
                        decoration: InputDecoration(labelText: loc.emailOrPhoneNumber),
                      ),

                      const SizedBox(height: 16),


                      // Password
                      PasswordTextFieldWidget(
                        labelText: loc.password,
                      ),


                      const SizedBox(height: 16),

                      // Password
                      PasswordTextFieldWidget(
                        labelText: loc.confirmPassword,
                      ),

                      const SizedBox(height: 10),


                      const SizedBox(height: 40),

                      // Login Button

                      ElevatedButton(onPressed: (){}, child: Text(loc.createAccount)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            loc.alreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              loc.login,
                              style: TextStyle(
                                color: AppColors.primaryGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),


                      const SizedBox(height: 30),

                    ],
                  ),

                  // Terms and Conditions
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        Text(
                          loc.byContinuingYouAgreeToOur,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              loc.termsAndConditions,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              loc.and,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 4),
                            Text
                              (
                              loc.privacyPolicy,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              )
                            ),
                          ],
                        )
                      ],
                    ),
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
