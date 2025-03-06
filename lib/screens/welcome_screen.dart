import 'package:flutter/material.dart';
import 'package:homzes/models/option_item.dart';
import 'package:homzes/components/home_app_bar.dart';
import 'package:homzes/screens/catalog_1_screen.dart';

import 'package:homzes/widgets/welcome_option_btn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  final List<OptionItem> _optionItems = const [
    OptionItem(
      icon: 'assets/icons/rent_icon.png',
      label: 'Rent',
      color: Color(0xFFF8E1C9),
    ),
    OptionItem(
      icon: 'assets/icons/buy_icon.png',
      label: 'Buy',
      color: Color(0xFFF1F3A7),
    ),
    OptionItem(
      icon: 'assets/icons/sell_icon.png',
      label: 'Sell',
      color: Color(0xFFD6F2E4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                const Spacer(flex: 2),
                Container(
                  margin: EdgeInsets.only(
                    top: 120,
                  ),
                  child: Center(
                    child: Text(
                      'Find the best\nplace for you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: _optionItems.length,
                    separatorBuilder: (context, index) => SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final item = _optionItems[index];
                      return WelcomeOptionBtn(
                        icon: item.icon,
                        label: item.label,
                        color: item.color,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Catalog1Screen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF27AE60),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
