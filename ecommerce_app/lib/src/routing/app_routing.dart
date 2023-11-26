import 'package:ecommerce_app/src/features/account/account_screen.dart';
import 'package:ecommerce_app/src/features/orders_list/orders_list_screen.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/product_page/product_screen.dart';
import '../features/products_list/products_list_screen.dart';

enum AppRoute {
  home,
  product,
  cart,
  orders,
  account,
  signIn,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const ProductsListScreen(),
      routes: [
        GoRoute(
          path: 'cart',
          name: AppRoute.cart.name,
          //builder: (context, state) => const ShoppingCartScreen(),
          pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: ShoppingCartScreen(),
          ),
        ),
        GoRoute(
          path: 'orders',
          name: AppRoute.orders.name,
          //builder: (context, state) => const ShoppingCartScreen(),
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: OrdersListScreen(),
          ),
        ),
        GoRoute(
          path: 'account',
          name: AppRoute.account.name,
          //builder: (context, state) => const ShoppingCartScreen(),
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: AccountScreen(),
          ),
        ),
        GoRoute(
          path: 'signIn',
          name: AppRoute.signIn.name,
          //builder: (context, state) => const ShoppingCartScreen(),
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: EmailPasswordSignInScreen(
                formType: EmailPasswordSignInFormType.signIn,
            ),
          ),
        ),
        GoRoute(
          path: 'product/:id',
          name: AppRoute.product.name,
          builder: (context, state) {
            final productId = state.pathParameters['id']!;
            return ProductScreen(productId: productId);
          },
        ),
      ],
    ),
  ],
);
