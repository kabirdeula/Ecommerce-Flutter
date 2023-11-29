import 'package:flutter/material.dart';

import 'package:ecommerce/base/app_colors.dart';
import 'package:ecommerce/base/strings.dart';
import 'package:ecommerce/screens/home/controllers/product_controller.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:ecommerce/screens/account/views/account_screen.dart';
import 'package:ecommerce/screens/cart/views/cart_screen.dart';
import 'package:ecommerce/screens/discover/views/discover_screen.dart';
import 'package:ecommerce/screens/messages/views/message_screen.dart';

import 'home/views/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Product>> products;
  late int currentPageIndex;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    products = fetchProduct();
    currentPageIndex = 0;
    screens = [
      HomeScreen(products: products),
      const DiscoverScreen(),
      const MessageScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(),
      body: screens[currentPageIndex],
    );
  }

  NavigationBar buildNavigationBar() {
    return NavigationBar(
      height: 60.0,
      onDestinationSelected: (int index) => setState(() {
        currentPageIndex = index;
      }),
      indicatorColor: AppColors.lTransparentColor,
      selectedIndex: currentPageIndex,
      destinations: [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: AppColors.lPrimaryColor,
          ),
          icon: const Icon(Icons.home_outlined),
          label: Strings.navBarHome,
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.shopping_bag,
            color: AppColors.lPrimaryColor,
          ),
          icon: const Badge(
            label: Text('NEW'),
            child: Icon(Icons.shopping_bag_outlined),
          ),
          label: Strings.navBarDiscover,
        ),
        NavigationDestination(
          selectedIcon: Badge(
            label: Text(Strings.messageCount),
            child: Icon(
              Icons.message,
              color: AppColors.lPrimaryColor,
            ),
          ),
          icon: Badge(
            label: Text(Strings.messageCount),
            child: const Icon(Icons.message_outlined),
          ),
          label: Strings.navBarMessage,
        ),
        NavigationDestination(
          selectedIcon: Badge(
              label: Text(Strings.cartCount),
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.lPrimaryColor,
              )),
          icon: Badge(
              label: Text(Strings.cartCount),
              child: const Icon(Icons.shopping_cart_outlined)),
          label: Strings.navBarCart,
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.person,
            color: AppColors.lPrimaryColor,
          ),
          icon: const Icon(Icons.person_outlined),
          label: Strings.navBarAccount,
        ),
      ],
    );
  }
}
