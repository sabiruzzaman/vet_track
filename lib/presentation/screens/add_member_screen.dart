import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_track/presentation/widgets/custom_app_bar.dart';
import 'package:vet_track/presentation/widgets/custom_dropdown_widget.dart';
import 'package:vet_track/utils/constants/colors.dart';
import 'package:vet_track/utils/constants/dropdown_items.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/date_picker_widget.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

     return Scaffold(
      appBar: CustomAppBar(
        isGreen: true,
        centerTitle: true,
        title: loc.addMember,
        showBackButton: true,
        onBack: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [


              TextField(decoration: InputDecoration(labelText: loc.name)),
              const SizedBox(height: 16),

              TextField(decoration: InputDecoration(labelText: loc.tagNo)),
              const SizedBox(height: 16),

              Text(loc.liveStockType, style: Theme.of(context).textTheme.bodyLarge),

              CustomDropdownWidget(
                items: DropdownItems.liveStockCategories(),
                onSelected: (value) => debugPrint('Selected: $value'),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 16,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(loc.breed, style: Theme.of(context).textTheme.bodyLarge),
                        CustomDropdownWidget(
                          items: DropdownItems.breedCategories(),
                          onSelected: (value) => debugPrint('Selected: $value'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(loc.vaccinated, style: Theme.of(context).textTheme.bodyLarge),
                        CustomDropdownWidget(
                          items: DropdownItems.vaccinatedStatus(),
                          initialValue: 'Name',
                          onSelected: (value) => debugPrint('Selected: $value'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text(loc.raisedFor, style: Theme.of(context).textTheme.bodyLarge),
              CustomDropdownWidget(
                items: DropdownItems.raisedForCategories(),
             //   initialValue: 'Name',
                onSelected: (value) => debugPrint('Selected: $value'),
              ),
              const SizedBox(height: 16),

              TextField(decoration: InputDecoration(labelText: loc.totalAnimals)),
              const SizedBox(height: 16),

              const SizedBox(height: 16),
              Text(loc.recordDate, style: Theme.of(context).textTheme.bodyLarge),
              DatePickerWidget(
                allowFutureDate: true,
                onDateSelected: (date) => print('Selected date: $date'),
              ),

              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: AppColors.primaryGreen,
                  ),
                  Expanded(
                    child: Text(
                      loc.iWantToRecordFlock,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

            //  const SizedBox(height: 80), // Padding for bottom button spacing
            ],
          ),
        ),
      ),

      /// ✅ Save Button pinned to bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(loc.save),
        ),
      ),
    );

  }
}

