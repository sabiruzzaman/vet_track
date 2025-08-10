import 'package:flutter/material.dart';
import 'package:vet_track/presentation/widgets/password_text_field_widget.dart';

import '../../../l10n/app_localizations.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                          loc.resetPassword,
                          style: Theme.of(context).textTheme.headlineLarge
                      ),

                      const SizedBox(height: 6),
                      Text(
                          loc.setANewPassword,
                          style: Theme.of(context).textTheme.titleMedium
                      ),

                      const SizedBox(height: 30),


                      // Password
                      PasswordTextFieldWidget(
                        labelText: loc.createNewPassword,
                      ),

                      const SizedBox(height: 16),

                      // Password
                      PasswordTextFieldWidget(
                        labelText: loc.confirmPassword,
                      ),

                      const SizedBox(height: 30),



                      // Login Button

                      ElevatedButton(onPressed: (){}, child: Text(loc.resetPassword)),




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
