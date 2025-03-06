import 'package:flutter/material.dart';
import 'package:homzes/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userInitial;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.userInitial,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background2,
      title: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/icons/menu_icon.png'),
            onPressed: () {},
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              Text(
                'Hi, $userName',
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.dark40,
                    child: Text(
                      userInitial,
                      style: const TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
