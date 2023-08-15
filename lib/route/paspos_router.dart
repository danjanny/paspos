import 'package:paspos/module/presentation/pages/checkout_page.dart';
import 'package:paspos/module/presentation/pages/login_page.dart';
import 'package:paspos/module/presentation/pages/product_detail_page.dart';
import 'package:paspos/module/presentation/pages/product_page.dart';
import 'package:qlevar_router/qlevar_router.dart';

class PasposRouter {
  static String loginPath = "/login-page";
  static String productPath = "/product-page";
  static String productDetailPath = "/product-detail-page";
  static String checkoutPath = "/checkout-page";
  static String rootPath = "/";

  static final routes = [
    QRoute(path: rootPath, builder: () => const LoginPage()),
    QRoute(path: productPath, builder: () => const ProductPage()),
    QRoute(path: productDetailPath, builder: () => const ProductDetailPage()),
    QRoute(path: checkoutPath, builder: () => const CheckoutPage()),
  ];
}
