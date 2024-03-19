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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Offers of the month`
  String get OffersMonth {
    return Intl.message(
      'Offers of the month',
      name: 'OffersMonth',
      desc: '',
      args: [],
    );
  }

  /// `TOP products`
  String get TopProducts {
    return Intl.message(
      'TOP products',
      name: 'TopProducts',
      desc: '',
      args: [],
    );
  }

  /// `New products`
  String get NewProducts {
    return Intl.message(
      'New products',
      name: 'NewProducts',
      desc: '',
      args: [],
    );
  }

  /// `Recently viewed`
  String get RecentlyViewed {
    return Intl.message(
      'Recently viewed',
      name: 'RecentlyViewed',
      desc: '',
      args: [],
    );
  }

  /// `Brands`
  String get Brands {
    return Intl.message(
      'Brands',
      name: 'Brands',
      desc: '',
      args: [],
    );
  }

  /// `Shop now`
  String get ShopNow {
    return Intl.message(
      'Shop now',
      name: 'ShopNow',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get Wishlist {
    return Intl.message(
      'Wishlist',
      name: 'Wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Let's get personal`
  String get LoginSection1 {
    return Intl.message(
      'Let\'s get personal',
      name: 'LoginSection1',
      desc: '',
      args: [],
    );
  }

  /// `Sign in for a tailored shopping experience`
  String get LoginSection2 {
    return Intl.message(
      'Sign in for a tailored shopping experience',
      name: 'LoginSection2',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get SignIn {
    return Intl.message(
      'Sign in',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Your wishlist is empty`
  String get MainWishlist {
    return Intl.message(
      'Your wishlist is empty',
      name: 'MainWishlist',
      desc: '',
      args: [],
    );
  }

  /// `When you favorite items you love, you'll find them here`
  String get SubWishlistAuth {
    return Intl.message(
      'When you favorite items you love, you\'ll find them here',
      name: 'SubWishlistAuth',
      desc: '',
      args: [],
    );
  }

  /// `Sign in or create an account to save the items below — don't let your favourites get away`
  String get SubWishlist {
    return Intl.message(
      'Sign in or create an account to save the items below — don\'t let your favourites get away',
      name: 'SubWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Get Inspired`
  String get Inspire {
    return Intl.message(
      'Get Inspired',
      name: 'Inspire',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get SeeAll {
    return Intl.message(
      'See all',
      name: 'SeeAll',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get Popular {
    return Intl.message(
      'Popular',
      name: 'Popular',
      desc: '',
      args: [],
    );
  }

  /// `Shares %`
  String get Shares {
    return Intl.message(
      'Shares %',
      name: 'Shares',
      desc: '',
      args: [],
    );
  }

  /// `Sets`
  String get Sets {
    return Intl.message(
      'Sets',
      name: 'Sets',
      desc: '',
      args: [],
    );
  }

  /// `Merch`
  String get Merch {
    return Intl.message(
      'Merch',
      name: 'Merch',
      desc: '',
      args: [],
    );
  }

  /// `For Christmas`
  String get ForChristmas {
    return Intl.message(
      'For Christmas',
      name: 'ForChristmas',
      desc: '',
      args: [],
    );
  }

  /// `For children`
  String get ForChildren {
    return Intl.message(
      'For children',
      name: 'ForChildren',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Household appliance`
  String get Household {
    return Intl.message(
      'Household appliance',
      name: 'Household',
      desc: '',
      args: [],
    );
  }

  /// `For beauty`
  String get ForBeauty {
    return Intl.message(
      'For beauty',
      name: 'ForBeauty',
      desc: '',
      args: [],
    );
  }

  /// `Smells`
  String get Smells {
    return Intl.message(
      'Smells',
      name: 'Smells',
      desc: '',
      args: [],
    );
  }

  /// `Food products`
  String get FoodProducts {
    return Intl.message(
      'Food products',
      name: 'FoodProducts',
      desc: '',
      args: [],
    );
  }

  /// `For home`
  String get ForHome {
    return Intl.message(
      'For home',
      name: 'ForHome',
      desc: '',
      args: [],
    );
  }

  /// `Scooters`
  String get Scooters {
    return Intl.message(
      'Scooters',
      name: 'Scooters',
      desc: '',
      args: [],
    );
  }

  /// `Flowers`
  String get Flowers {
    return Intl.message(
      'Flowers',
      name: 'Flowers',
      desc: '',
      args: [],
    );
  }

  /// `For the car`
  String get ForCar {
    return Intl.message(
      'For the car',
      name: 'ForCar',
      desc: '',
      args: [],
    );
  }

  /// `Your basket is empty`
  String get MainCart {
    return Intl.message(
      'Your basket is empty',
      name: 'MainCart',
      desc: '',
      args: [],
    );
  }

  /// `Items added to your basket will show up here`
  String get SubCartAuth {
    return Intl.message(
      'Items added to your basket will show up here',
      name: 'SubCartAuth',
      desc: '',
      args: [],
    );
  }

  /// `Looking for pieces you previously added? Sign in to pick up where you left off`
  String get SubCart {
    return Intl.message(
      'Looking for pieces you previously added? Sign in to pick up where you left off',
      name: 'SubCart',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get MyAccount {
    return Intl.message(
      'My account',
      name: 'MyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get Addresses {
    return Intl.message(
      'Addresses',
      name: 'Addresses',
      desc: '',
      args: [],
    );
  }

  /// `Gift cards`
  String get GiftCards {
    return Intl.message(
      'Gift cards',
      name: 'GiftCards',
      desc: '',
      args: [],
    );
  }

  /// `Stock notification`
  String get StockNotification {
    return Intl.message(
      'Stock notification',
      name: 'StockNotification',
      desc: '',
      args: [],
    );
  }

  /// `Detail & password`
  String get DetailPassword {
    return Intl.message(
      'Detail & password',
      name: 'DetailPassword',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get Support {
    return Intl.message(
      'Support',
      name: 'Support',
      desc: '',
      args: [],
    );
  }

  /// `About Home by NB`
  String get AboutHBNB {
    return Intl.message(
      'About Home by NB',
      name: 'AboutHBNB',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `FAQ's & guides`
  String get FAQ {
    return Intl.message(
      'FAQ\'s & guides',
      name: 'FAQ',
      desc: '',
      args: [],
    );
  }

  /// `Returns and warranty`
  String get Returns {
    return Intl.message(
      'Returns and warranty',
      name: 'Returns',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get Delivery {
    return Intl.message(
      'Delivery',
      name: 'Delivery',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get ContactUs {
    return Intl.message(
      'Contact Us',
      name: 'ContactUs',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Messenger`
  String get Messenger {
    return Intl.message(
      'Messenger',
      name: 'Messenger',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get SignOut {
    return Intl.message(
      'Sign out',
      name: 'SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Notification tailored to you`
  String get NotificationHeader {
    return Intl.message(
      'Notification tailored to you',
      name: 'NotificationHeader',
      desc: '',
      args: [],
    );
  }

  /// `Sign up for exclusive promotions, tailored new arrivals, stock updates and more`
  String get NotificationBody {
    return Intl.message(
      'Sign up for exclusive promotions, tailored new arrivals, stock updates and more',
      name: 'NotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Notify me`
  String get Notify {
    return Intl.message(
      'Notify me',
      name: 'Notify',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get Surname {
    return Intl.message(
      'Surname',
      name: 'Surname',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get Forgot {
    return Intl.message(
      'Forgot password?',
      name: 'Forgot',
      desc: '',
      args: [],
    );
  }

  /// `By registering you agree with our `
  String get LoginPart1 {
    return Intl.message(
      'By registering you agree with our ',
      name: 'LoginPart1',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get LoginPart2 {
    return Intl.message(
      'Terms & Conditions',
      name: 'LoginPart2',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get LoginPart3 {
    return Intl.message(
      ' and ',
      name: 'LoginPart3',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get LoginPart4 {
    return Intl.message(
      'Privacy Policy',
      name: 'LoginPart4',
      desc: '',
      args: [],
    );
  }

  /// `Sign up for tailored new arrivals, exciting launches, and exclusive early sale access. To opt out, click unsubscribe in our emails.`
  String get LoginBody {
    return Intl.message(
      'Sign up for tailored new arrivals, exciting launches, and exclusive early sale access. To opt out, click unsubscribe in our emails.',
      name: 'LoginBody',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'lt'),
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
