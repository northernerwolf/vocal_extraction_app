import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius;

  CustomThumbShape({required this.thumbRadius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final Paint borderPaint = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.5;
    final Paint fillPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final Paint centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius, borderPaint);
    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius / 3, centerPaint);
  }
}

class VerticalCustomSlider3 extends StatefulWidget {
  @override
  _VerticalCustomSlider3State createState() => _VerticalCustomSlider3State();
}

class _VerticalCustomSlider3State extends State<VerticalCustomSlider3> {
  double _sliderValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: AppColors.sliderColor,
          inactiveTrackColor: AppColors.cartColor,
          trackHeight: 6,
          overlayColor: Colors.blue.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
          thumbShape: CustomThumbShape(thumbRadius: 16.0),
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: Slider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
            min: 0,
            max: 100,
            divisions: 100,
            // label: '$_sliderValue',
          ),
        ),
      ),
    );
  }
}
