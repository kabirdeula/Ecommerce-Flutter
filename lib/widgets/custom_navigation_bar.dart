import 'package:ecommerce/base/app_colors.dart';
import 'package:ecommerce/base/strings.dart';
import 'package:flutter/material.dart';

NavigationBar buildNavigationBar(int currentPageIndex, setState) {
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
