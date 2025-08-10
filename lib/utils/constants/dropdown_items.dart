import 'locale_helper.dart';

class DropdownItems {
  static List<Map<String, String>> liveStockCategories() {
    return [
      {
        'value': '',
        'label': LocaleHelper().isBangla
            ? 'পশুর ধরন নির্বাচন করুন'
            : 'Select Livestock Type',
      },
      {
        'value': 'buffalo',
        'label': LocaleHelper().isBangla ? 'মহিষ' : 'Buffalo',
      },
      {'value': 'cow', 'label': LocaleHelper().isBangla ? 'গরু' : 'Cow'},
      {'value': 'goat', 'label': LocaleHelper().isBangla ? 'ছাগল' : 'Goat'},
      {
        'value': 'chicken',
        'label': LocaleHelper().isBangla ? 'মুরগি' : 'Chicken',
      },
    ];
  }

  static List<Map<String, String>> milkCategories() {
    return [
      {
        'value': '',
        'label': LocaleHelper().isBangla
            ? 'দুধের ধরন নির্বাচন করুন'
            : 'Select Milk Type',
      },
      {
        'value': 'buffalo',
        'label': LocaleHelper().isBangla ? 'মহিষের দুধ' : 'Buffalo Milk',
      },
      {
        'value': 'cow',
        'label': LocaleHelper().isBangla ? 'গরুর দুধ' : 'Cow Milk',
      },
      {
        'value': 'goat',
        'label': LocaleHelper().isBangla ? 'ছাগলের দুধ' : 'Goat Milk',
      },
    ];
  }

  static List<Map<String, String>> feedCategories() {
    return [
      {
        'value': '',
        'label': LocaleHelper().isBangla
            ? 'খাদ্যের ধরন নির্বাচন করুন'
            : 'Select Feed Type',
      },
      {
        'value': 'dry',
        'label': LocaleHelper().isBangla ? 'শুকনো খাদ্য' : 'Dry Feed',
      },
      {
        'value': 'wet',
        'label': LocaleHelper().isBangla ? 'ভেজা খাদ্য' : 'Wet Feed',
      },
      {
        'value': 'supplement',
        'label': LocaleHelper().isBangla ? 'সাপ্লিমেন্ট' : 'Supplement',
      },
    ];
  }

  static List<Map<String, String>> breedCategories() {
    return [
      {
        'value': '',
        'label': LocaleHelper().isBangla ? 'বংশ নির্বাচন করুন' : 'Select Breed',
      },
      {
        'value': 'local',
        'label': LocaleHelper().isBangla ? 'স্থানীয়' : 'Local',
      },
      {
        'value': 'crossbreed',
        'label': LocaleHelper().isBangla ? 'ক্রসব্রিড' : 'Crossbreed',
      },
      {
        'value': 'exotic',
        'label': LocaleHelper().isBangla ? 'এক্সোটিক' : 'Exotic',
      },
    ];
  }

  static List<Map<String, String>> vaccinatedStatus() {
    return [
      {'value': 'yes', 'label': LocaleHelper().isBangla ? 'হ্যাঁ' : 'Yes'},
      {'value': 'no', 'label': LocaleHelper().isBangla ? 'না' : 'No'},
    ];
  }

  static List<Map<String, String>> raisedForCategories() {
    return [
      {
        'value': '',
        'label': LocaleHelper().isBangla
            ? 'পালনের উদ্দেশ্য নির্বাচন করুন'
            : 'Select Raised For',
      },
      {
        'value': 'milk',
        'label': LocaleHelper().isBangla ? 'দুধ উৎপাদন' : 'Milk Production',
      },
      {
        'value': 'meat',
        'label': LocaleHelper().isBangla ? 'মাংস উৎপাদন' : 'Meat Production',
      },
      {
        'value': 'eggs',
        'label': LocaleHelper().isBangla ? 'ডিম উৎপাদন' : 'Egg Production',
      },
      {
        'value': 'other',
        'label': LocaleHelper().isBangla ? 'অন্যান্য' : 'Other',
      },
    ];
  }

  static List<Map<String, String>> transactionCategories() {
    return [
      {
        'value': '',
        'label': LocaleHelper().isBangla
            ? 'আয়/ব্যয়ের ধরণ নির্বাচন করুন'
            : 'Select Income/Expense Category',
      },
      {
        'value': 'milkYield',
        'label': LocaleHelper().isBangla ? 'দুধ উৎপাদন' : 'Milk Yield',
      },
      {
        'value': 'meatYield',
        'label': LocaleHelper().isBangla ? 'মাংস উৎপাদন' : 'Meat Yield',
      },
      {
        'value': 'eggYield',
        'label': LocaleHelper().isBangla ? 'ডিম উৎপাদন' : 'Egg Yield',
      },
      {
        'value': 'feedCost',
        'label': LocaleHelper().isBangla ? 'খাদ্য খরচ' : 'Feed Cost',
      },
      {
        'value': 'medicineCost',
        'label': LocaleHelper().isBangla ? 'ঔষধ খরচ' : 'Medicine Cost',
      },
      {
        'value': 'maintenance',
        'label': LocaleHelper().isBangla ? 'রক্ষণাবেক্ষণ খরচ' : 'Maintenance Cost',
      },
      {
        'value': 'other',
        'label': LocaleHelper().isBangla ? 'অন্যান্য' : 'Other',
      },

    ];
  }

  static List<Map<String, String>> dailyCollectionTypes() {
    return [
      {
        'value': '',
        'label': LocaleHelper().isBangla
            ? 'দৈনিক সংগ্রহের ধরন নির্বাচন করুন'
            : 'Select Daily Collection Type',
      },
      {
        'value': 'milkYield',
        'label': LocaleHelper().isBangla ? 'দুধ উৎপাদন' : 'Milk Yield',
      },
      {
        'value': 'feedSummary',
        'label': LocaleHelper().isBangla ? 'খাদ্য সারাংশ' : 'Feed Summary',
      },
      {
        'value': 'eggCollection',
        'label': LocaleHelper().isBangla ? 'ডিম সংগ্রহ' : 'Egg Collection',
      },

    ];
  }


}
