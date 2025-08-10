import 'package:flutter/material.dart';
import 'package:vet_track/presentation/widgets/icon_rounded_container_widget.dart';
import 'package:vet_track/presentation/widgets/password_text_field_widget.dart';
import 'package:vet_track/utils/constants/colors.dart';

import '../../../l10n/app_localizations.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                         loc.welcomeBack,
                         style: Theme.of(context).textTheme.headlineLarge
                       ),

                       const SizedBox(height: 6),
                       Text(
                         loc.loginToContinue,
                         style: Theme.of(context).textTheme.titleMedium
                       ),

                       const SizedBox(height: 30),

                       // Email / Phone
                       TextField(
                         decoration: InputDecoration(labelText: loc.emailOrPhoneNumber),
                       ),

                       const SizedBox(height: 16),

                       // Password
                       PasswordTextFieldWidget(
                         labelText: loc.password,
                       ),

                       const SizedBox(height: 10),

                       // Remember Me + Forgot Password
                       Row(
                         children: [
                           Checkbox(
                             value: false,
                             onChanged: (value) {},
                             activeColor: AppColors.primaryGreen,
                           ),
                           Text(
                             loc.rememberMe,
                             style: Theme.of(context).textTheme.bodyMedium,
                           ),
                           const Spacer(),
                           TextButton(
                             onPressed: () {},
                             child: Text(
                               loc.forgotPassword,
                               style: TextStyle(
                                 color: AppColors.primaryGreen,
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ),
                         ],
                       ),

                       const SizedBox(height: 40),

                       // Login Button

                       ElevatedButton(onPressed: (){}, child: Text(loc.login)),


                       const SizedBox(height: 30),

                       // Social Text
                       Center(
                         child: Text(
                           loc.orRegisterWithSocialAccounts,
                           style: Theme.of(context).textTheme.bodyMedium
                         ),
                       ),

                       const SizedBox(height: 20),

                       // Social Buttons
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Expanded(
                             child: IconRoundedContainerWidget(
                               svgAsset: 'assets/icons/google.svg',
                               onTap: () {},
                             ),
                           ),
                           const SizedBox(width: 30),
                           Expanded(
                             child: IconRoundedContainerWidget(
                               svgAsset: 'assets/icons/facebook.svg',
                               onTap: () {},
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),


                   // Create Account
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         loc.dontHaveAnAccount,
                         style: Theme.of(context).textTheme.bodyMedium,
                       ),
                       TextButton(
                         onPressed: () {},
                         child: Text(
                           loc.create,
                           style: TextStyle(
                             color: AppColors.primaryGreen,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
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
