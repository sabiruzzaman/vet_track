import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/constants/dropdown_items.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_dropdown_widget.dart';
import '../widgets/date_picker_widget.dart';


class AddDailyDataScreen extends StatefulWidget {
  const AddDailyDataScreen({super.key});

  @override
  State<AddDailyDataScreen> createState() => _AddDailyDataScreenState();
}

class _AddDailyDataScreenState extends State<AddDailyDataScreen> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        isGreen: true,
        centerTitle: true,
        title: loc.addDailyData,
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

              Text(loc.dailyCollectionType, style: Theme.of(context).textTheme.bodyLarge),
            CustomDropdownWidget(
              items: DropdownItems.dailyCollectionTypes(),
             /* validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },*/
              onSelected: (value) {
                print('Selected: $value');
              },
            ),

            const SizedBox(height: 16),

              Text(loc.categories, style: Theme.of(context).textTheme.bodyLarge),

              CustomDropdownWidget(
                items: [
                  {'value': 'Category 1', 'label': 'Category 1'},
                  {'value': 'Category 2', 'label': 'Category 2'},
                  {'value': 'Category 3', 'label': 'Category 3'},
                ],
                initialValue: 'Select Category',
                onSelected: (value) => debugPrint('Selected: $value'),
              ),

              const SizedBox(height: 16),

              TextField(decoration: InputDecoration(labelText: loc.eggsCollected)),
              const SizedBox(height: 16),

              TextField(decoration: InputDecoration(labelText: loc.mildConsumed)),
              const SizedBox(height: 16),

              TextField(decoration: InputDecoration(labelText: loc.feedConsumed)),
              const SizedBox(height: 16),

              Text(loc.recordDate, style: Theme.of(context).textTheme.bodyLarge),
              DatePickerWidget(
                allowFutureDate: true,
                onDateSelected: (date) => print('Selected date: $date'),
              ),


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


