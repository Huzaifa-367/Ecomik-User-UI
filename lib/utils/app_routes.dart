import 'package:ecomik/screens/add_address_screen.dart';
import 'package:ecomik/screens/add_money_screen.dart';
import 'package:ecomik/screens/add_new_card_screen.dart';
import 'package:ecomik/screens/add_review_screen.dart';
import 'package:ecomik/screens/call_screen.dart';
import 'package:ecomik/screens/chat_deliveryman_screen.dart';
import 'package:ecomik/screens/checkout_screen.dart';
import 'package:ecomik/screens/delivery_info_screen.dart';
import 'package:ecomik/screens/delivery_set_location_screen.dart';
import 'package:ecomik/screens/edit_my_account_screen.dart';
import 'package:ecomik/screens/home_navigator_screen.dart';
import 'package:ecomik/screens/intro_screen.dart';
import 'package:ecomik/screens/langauge_screen.dart';
import 'package:ecomik/screens/my_wallet_screen.dart';
import 'package:ecomik/screens/notifications_screen.dart';
import 'package:ecomik/screens/order_placed_success_screen.dart';
import 'package:ecomik/screens/order_status_screen.dart';
import 'package:ecomik/screens/password_change_success_screen.dart';
import 'package:ecomik/screens/password_recovery_screens/password_recovery_create_password_screen.dart';
import 'package:ecomik/screens/password_recovery_screens/password_recovery_prompt_screen.dart';
import 'package:ecomik/screens/password_recovery_screens/password_recovery_select_screen.dart';
import 'package:ecomik/screens/password_recovery_screens/password_recovery_verification_screen.dart';
import 'package:ecomik/screens/product_detail_screen.dart';
import 'package:ecomik/screens/products_screen.dart';
import 'package:ecomik/screens/review_success_screen.dart';
import 'package:ecomik/screens/saved_address_screen.dart';
import 'package:ecomik/screens/settings_screen.dart';
import 'package:ecomik/screens/sign_in_screen.dart';
import 'package:ecomik/screens/sign_up_screen.dart';
import 'package:ecomik/screens/sign_up_success_screen.dart';
import 'package:ecomik/screens/splash_screen.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:flutter/material.dart';

/// This file contains app route generator
class AppRouteGenerator {
  /// This function generate routes corresponding to their pages with parameters
  /// (if used)
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final Object? argument = settings.arguments;
    switch (settings.name) {
      case AppPageNames.rootScreen:
      case AppPageNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPageNames.introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case AppPageNames.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppPageNames.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppPageNames.signUpSuccessScreen:
        return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
      case AppPageNames.passwordChangeSuccessScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordChangSuccessScreen());
      case AppPageNames.passwordRecoveryPromptScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryPromptScreen());
      case AppPageNames.passwordRecoveryVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryVerificationScreen());
      case AppPageNames.passwordRecoverySelectScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoverySelectScreen());
      case AppPageNames.passwordRecoveryCreateScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryCreatePasswordScreen());
      case AppPageNames.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case AppPageNames.productsScreen:
        return MaterialPageRoute(
            builder: (_) => ProductsScreen(productCategoryName: argument));
      case AppPageNames.orderSuccessScreen:
        return MaterialPageRoute(
            builder: (_) => const OrderPlacedSuccessScreen());
      case AppPageNames.addReviewScreen:
        return MaterialPageRoute(builder: (_) => const AddReviewScreen());
      case AppPageNames.reviewSuccessScreen:
        return MaterialPageRoute(builder: (_) => const ReviewSuccessScreen());
      case AppPageNames.editMyAccountScreen:
        return MaterialPageRoute(builder: (_) => const EditMyAccountScreen());
      case AppPageNames.addAddressScreen:
        return MaterialPageRoute(builder: (_) => const AddAddressScreen());
      case AppPageNames.addMoneyScreen:
        return MaterialPageRoute(builder: (_) => const AddMoneyScreen());
      case AppPageNames.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppPageNames.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case AppPageNames.myWalletScreen:
        return MaterialPageRoute(builder: (_) => const MyWalletScreen());
      case AppPageNames.savedAddressScreen:
        return MaterialPageRoute(builder: (_) => const SavedAddressScreen());
      case AppPageNames.orderStatusScreen:
        return MaterialPageRoute(builder: (_) => const OrderStatusScreen());
      case AppPageNames.productDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: argument));
      case AppPageNames.checkoutScreen:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case AppPageNames.addNewCardScreen:
        return MaterialPageRoute(builder: (_) => const AddNewCardScreen());
      case AppPageNames.deliverySetLocationScreen:
        return MaterialPageRoute(
            builder: (_) => const DeliverySetLocationScreen());
      case AppPageNames.deliveryInfoScreen:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoScreen());
      case AppPageNames.chatWithDeliverymanScreen:
        return MaterialPageRoute(builder: (_) => const ChatDeliverymanScreen());
      case AppPageNames.callScreen:
        return MaterialPageRoute(builder: (_) => const CallScreen());
      case AppPageNames.homeNavigatorScreen:
        return MaterialPageRoute(
            builder: (_) => HomeNavigatorScreen(screenTabIndex: argument));
      default:
        // Open this page if wrong route address used
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Page not found')))));
    }
  }
}
