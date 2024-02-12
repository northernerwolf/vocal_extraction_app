import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/utils/custom/custom_icon.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

// ignore: must_be_immutable
class BottomNavbarButton extends StatefulWidget {
  final Function() onTapp;
  final int selectedIndex;
  final int index;
  final bool icon;
  const BottomNavbarButton({
    required this.onTapp,
    required this.selectedIndex,
    required this.index,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavbarButton> createState() => _BottomNavbarButtonState();
}

class _BottomNavbarButtonState extends State<BottomNavbarButton> {
  List<String> title = [
    'Songs',
    'Library',
    'Settings',
  ];

  List iconsLight = [
    CustomIcon(
        title: 'assets/icons/musical-note.svg',
        height: 24,
        width: 24,
        color: AppColors.subtitleColor),
    CustomIcon(
        title: 'assets/icons/Union.svg',
        height: 24,
        width: 24,
        color: AppColors.subtitleColor),
    CustomIcon(
        title: 'assets/icons/cog-6-tooth.svg',
        height: 24,
        width: 24,
        color: AppColors.subtitleColor),
  ];

  List iconsBold = [
    CustomIcon(
        title: 'assets/icons/musical-note.svg',
        height: 24,
        width: 24,
        color: AppColors.primary),
    CustomIcon(
        title: 'assets/icons/Union.svg',
        height: 24,
        width: 24,
        color: AppColors.primary),
    CustomIcon(
        title: 'assets/icons/cog-6-tooth.svg',
        height: 24,
        width: 24,
        color: AppColors.primary),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapp,
      child: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              width: double.infinity,
              height: widget.index == widget.selectedIndex ? 64 : 0,
              decoration: const BoxDecoration(),
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Column(
                children: [
                  Expanded(
                    child: widget.index != widget.selectedIndex
                        ? widget.icon
                            ? const Icon(Icons.local_activity)
                            : Container(
                                child: iconsLight[widget.index],
                              )
                        : widget.icon
                            ? const Icon(Icons.add)
                            : Container(
                                child: iconsBold[widget.index],
                              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      title[widget.index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: widget.index == widget.selectedIndex
                              ? Colors.white
                              : AppColors.subtitleColor,
                          fontWeight: widget.index == widget.selectedIndex
                              ? FontWeight.w600
                              : FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Poppins',
                          fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
