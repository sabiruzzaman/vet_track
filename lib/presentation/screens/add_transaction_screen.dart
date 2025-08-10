import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_track/utils/constants/colors.dart';
import 'package:vet_track/utils/constants/dropdown_items.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_dropdown_widget.dart';
import '../widgets/date_picker_widget.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  String selectedType = 'income'; // শুরুতে income সিলেক্ট

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        isGreen: true,
        centerTitle: true,
        title: loc.addTransaction,
        showBackButton: true,
        onBack: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(loc.selectTransactionType,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedType = 'income';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedType == 'income'
                            ? AppColors.green // সিলেক্টেড হলে সবুজ
                            : AppColors.white, // নাহলে সাদা
                        foregroundColor: selectedType == 'income'
                            ? Colors.white
                            : AppColors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: AppColors.green),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        loc.income,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedType = 'expense';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedType == 'expense'
                            ? AppColors.pink // সিলেক্টেড হলে গোলাপি
                            : AppColors.white, // নাহলে সাদা
                        foregroundColor: selectedType == 'expense'
                            ? Colors.white
                            : AppColors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: AppColors.pink),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        loc.expense,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),


              Text(loc.incomeExpenseCategory,
                  style: Theme.of(context).textTheme.bodyLarge),
              CustomDropdownWidget(
                items: DropdownItems.transactionCategories(),
                initialValue: 'Name',
                onSelected: (value) => debugPrint('Selected: $value'),
              ),
              const SizedBox(height: 16),

              Text(loc.recordDate,
                  style: Theme.of(context).textTheme.bodyLarge),
              DatePickerWidget(
                allowFutureDate: true,
                onDateSelected: (date) =>
                    print('Selected date: $date'),
              ),
              const SizedBox(height: 16),

              TextField(
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: loc.note,
                  alignLabelWithHint: true,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ElevatedButton(
          onPressed: () {
            debugPrint("Saved transaction type: $selectedType");
          },
          child: Text(loc.save),
        ),
      ),
    );
  }
}
