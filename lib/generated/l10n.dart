// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About App`
  String get aboutApp {
    return Intl.message('About App', name: 'aboutApp', desc: '', args: []);
  }

  /// `Our Story and Mission`
  String get ourStory {
    return Intl.message(
      'Our Story and Mission',
      name: 'ourStory',
      desc: '',
      args: [],
    );
  }

  /// `We believe that solidarity is not just a word, but an action that makes a difference. We launched this store in support of the people of Gaza, to provide a safe and reliable platform to help provide donations and purchase products whose proceeds go directly to serve the needy and affected. Our journey began with a noble goal: that every purchase is a message of support, and every contribution is a footprint of hope.`
  String get ourStoryContent {
    return Intl.message(
      'We believe that solidarity is not just a word, but an action that makes a difference. We launched this store in support of the people of Gaza, to provide a safe and reliable platform to help provide donations and purchase products whose proceeds go directly to serve the needy and affected. Our journey began with a noble goal: that every purchase is a message of support, and every contribution is a footprint of hope.',
      name: 'ourStoryContent',
      desc: '',
      args: [],
    );
  }

  /// `Our Vision and Values`
  String get ourVision {
    return Intl.message(
      'Our Vision and Values',
      name: 'ourVision',
      desc: '',
      args: [],
    );
  }

  /// `We aspire to be the first platform for solidarity with the people of Gaza, by providing a humanitarian experience that effectively contributes to supporting families, the wounded, and the affected, with a commitment to transparency, honesty, humanity, and social responsibility. Our values are based on: Reliability - Real Impact - Cooperation - Compassion.`
  String get ourVisionContent {
    return Intl.message(
      'We aspire to be the first platform for solidarity with the people of Gaza, by providing a humanitarian experience that effectively contributes to supporting families, the wounded, and the affected, with a commitment to transparency, honesty, humanity, and social responsibility. Our values are based on: Reliability - Real Impact - Cooperation - Compassion.',
      name: 'ourVisionContent',
      desc: '',
      args: [],
    );
  }

  /// `Legal Information`
  String get legalInfo {
    return Intl.message(
      'Legal Information',
      name: 'legalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message('Terms of Use', name: 'termsOfUse', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `By using the 'Tadamon' store, you agree to contribute to supporting humanitarian causes with full transparency. We are committed to directing product proceeds to support those affected, and it is prohibited to use the platform for any activities that contradict our solidarity goals.`
  String get termsContent {
    return Intl.message(
      'By using the \'Tadamon\' store, you agree to contribute to supporting humanitarian causes with full transparency. We are committed to directing product proceeds to support those affected, and it is prohibited to use the platform for any activities that contradict our solidarity goals.',
      name: 'termsContent',
      desc: '',
      args: [],
    );
  }

  /// `At 'Tadamon', your privacy is our priority. We only collect necessary data to complete donation and purchase processes safely, and we are committed to not sharing your information with any third party, ensuring a safe and reliable donation experience.`
  String get privacyContent {
    return Intl.message(
      'At \'Tadamon\', your privacy is our priority. We only collect necessary data to complete donation and purchase processes safely, and we are committed to not sharing your information with any third party, ensuring a safe and reliable donation experience.',
      name: 'privacyContent',
      desc: '',
      args: [],
    );
  }

  /// `Donations`
  String get donations {
    return Intl.message('Donations', name: 'donations', desc: '', args: []);
  }

  /// `Contact & Donation Numbers`
  String get donationNumbers {
    return Intl.message(
      'Contact & Donation Numbers',
      name: 'donationNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Contact charitable organizations directly through the unified numbers for donation or inquiry`
  String get donationNumbersDesc {
    return Intl.message(
      'Contact charitable organizations directly through the unified numbers for donation or inquiry',
      name: 'donationNumbersDesc',
      desc: '',
      args: [],
    );
  }

  /// `Al-Shifa Medical Association`
  String get alShifaMedical {
    return Intl.message(
      'Al-Shifa Medical Association',
      name: 'alShifaMedical',
      desc: '',
      args: [],
    );
  }

  /// `For Medical Cases`
  String get medicalCases {
    return Intl.message(
      'For Medical Cases',
      name: 'medicalCases',
      desc: '',
      args: [],
    );
  }

  /// `Ilm Noor Foundation`
  String get ilmNoorFoundation {
    return Intl.message(
      'Ilm Noor Foundation',
      name: 'ilmNoorFoundation',
      desc: '',
      args: [],
    );
  }

  /// `For Educational Projects`
  String get educationProjects {
    return Intl.message(
      'For Educational Projects',
      name: 'educationProjects',
      desc: '',
      args: [],
    );
  }

  /// `Ewa Charity Association`
  String get ewaCharity {
    return Intl.message(
      'Ewa Charity Association',
      name: 'ewaCharity',
      desc: '',
      args: [],
    );
  }

  /// `To Support Needy Families`
  String get supportingFamilies {
    return Intl.message(
      'To Support Needy Families',
      name: 'supportingFamilies',
      desc: '',
      args: [],
    );
  }

  /// `Orphan Care Association`
  String get orphanCare {
    return Intl.message(
      'Orphan Care Association',
      name: 'orphanCare',
      desc: '',
      args: [],
    );
  }

  /// `For Orphan Sponsorship & Care`
  String get orphanSponsorship {
    return Intl.message(
      'For Orphan Sponsorship & Care',
      name: 'orphanSponsorship',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Special Offer to Support Them`
  String get special_offer_title {
    return Intl.message(
      'Special Offer to Support Them',
      name: 'special_offer_title',
      desc: '',
      args: [],
    );
  }

  /// `20% discount on handmade embroidery products; every piece tells a story of resilience and heritage`
  String get special_offer_desc {
    return Intl.message(
      '20% discount on handmade embroidery products; every piece tells a story of resilience and heritage',
      name: 'special_offer_desc',
      desc: '',
      args: [],
    );
  }

  /// `Weekend Discounts`
  String get weekend_discount_title {
    return Intl.message(
      'Weekend Discounts',
      name: 'weekend_discount_title',
      desc: '',
      args: [],
    );
  }

  /// `Benefit from discounts up to 30% on Nabulsi soap and thyme products`
  String get weekend_discount_desc {
    return Intl.message(
      'Benefit from discounts up to 30% on Nabulsi soap and thyme products',
      name: 'weekend_discount_desc',
      desc: '',
      args: [],
    );
  }

  /// `Free Shipping Offer`
  String get free_shipping_title {
    return Intl.message(
      'Free Shipping Offer',
      name: 'free_shipping_title',
      desc: '',
      args: [],
    );
  }

  /// `Get free shipping on all orders over 200 SAR; support our national products`
  String get free_shipping_desc {
    return Intl.message(
      'Get free shipping on all orders over 200 SAR; support our national products',
      name: 'free_shipping_desc',
      desc: '',
      args: [],
    );
  }

  /// `Smart Assistant`
  String get smartAssistant {
    return Intl.message(
      'Smart Assistant',
      name: 'smartAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get activeStatus {
    return Intl.message('Active', name: 'activeStatus', desc: '', args: []);
  }

  /// `Hello! I am your smart assistant. How can I help you today?`
  String get botWelcomeMessage {
    return Intl.message(
      'Hello! I am your smart assistant. How can I help you today?',
      name: 'botWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Hi! I would like to track my last order`
  String get userOrderTrack {
    return Intl.message(
      'Hi! I would like to track my last order',
      name: 'userOrderTrack',
      desc: '',
      args: [],
    );
  }

  /// `Sure! Could you please provide me with the order number?`
  String get botOrderResponse {
    return Intl.message(
      'Sure! Could you please provide me with the order number?',
      name: 'botOrderResponse',
      desc: '',
      args: [],
    );
  }

  /// `Type a message...`
  String get typeMessageHint {
    return Intl.message(
      'Type a message...',
      name: 'typeMessageHint',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `AM`
  String get am {
    return Intl.message('AM', name: 'am', desc: '', args: []);
  }

  /// `PM`
  String get pm {
    return Intl.message('PM', name: 'pm', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
