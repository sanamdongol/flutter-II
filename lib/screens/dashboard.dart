import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frost_app/screens/tabs/home.dart';
import 'package:frost_app/screens/tabs/market.dart';
import 'package:frost_app/screens/tabs/profile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var selectedTab = 0;
  var myPages = [HomePage(), MarketPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myPages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_2_outlined), label: "Market"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedTab,
        onTap: (value) {
          setState(() {
            selectedTab = value;
          });
        },
      ),
    );
  }
}
