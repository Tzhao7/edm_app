import 'package:flutter/material.dart';
import 'package:edm_app/screens/create_account_page.dart';
import 'package:edm_app/screens/create_account_page_1.dart';
import 'package:edm_app/screens/create_account_page_2.dart';
import 'package:edm_app/screens/event_settings_page.dart';
import 'package:edm_app/screens/login_page.dart';
import 'package:edm_app/screens/my_account_page.dart';
import 'package:edm_app/screens/notifications_page.dart';
import 'package:edm_app/screens/payment_method_page.dart';
import 'package:edm_app/screens/tickets_page.dart';
import 'package:edm_app/screens/welcome_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/create_account':
        return MaterialPageRoute(builder: (_) => CreateAccountPage());
      case '/create_account_1':
        return MaterialPageRoute(builder: (_) => CreateAccountPage1());
      case '/create_account_2':
        return MaterialPageRoute(builder: (_) => CreateAccountPage2());
      case '/event_settings':
        return MaterialPageRoute(builder: (_) => EventSettingsPage());
      case '/my_account':
        return MaterialPageRoute(builder: (_) => MyAccountPage());
      case '/notifications':
        return MaterialPageRoute(builder: (_) => NotificationsPage());
      case '/payment_method':
        return MaterialPageRoute(builder: (_) => PaymentMethodPage());
      case '/tickets':
        return MaterialPageRoute(builder: (_) => TicketsPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
