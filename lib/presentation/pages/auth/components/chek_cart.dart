import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class ChekCart extends StatelessWidget {
  final String cost;
  final String date;
  final int index;
  final bool isSelected;
  final VoidCallback onSelected;
  const ChekCart({
    required this.date,
    required this.cost,
    required this.index,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: onSelected,
        child: Container(
          // height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isSelected ? Colors.white : AppColors.borderColor,
                  width: 1.6)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: isSelected ? Colors.white : AppColors.cartColor,
                      border: Border.all(
                          color:
                              isSelected ? Colors.white : AppColors.borderColor,
                          width: 2),
                      shape: BoxShape.circle),
                  child: isSelected
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.black,
                          ),
                        )
                      : null,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'ClashDisplay',
                        ),
                      ),
                      Text(
                        cost,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.subtitleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
