import 'package:flutter/material.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:get/get.dart';

import '../../../../config/constant/colors.dart';

class EarningsController extends GetxController with GetSingleTickerProviderStateMixin {
  // Reactive variables
  var selectedDateIndex = 1.obs;
  var totalEarnings = 0.0.obs;
  var earningsPercentage = 0.0.obs;
  var servicesAmount = 0.0.obs;
  var servicesPercentage = 0.0.obs;
  var tipsAmount = 0.0.obs;
  var tipsPercentage = 0.0.obs;

  // Animation controller
  late AnimationController animationController;
  late Animation<double> animation;

  final List<String> timelineDates = ['28 JUL', '29', '30', '31', '1', '2', '3 AUG'];
  final List<double> earningsData = [0, 150, 80, 200, 120, 90, 0];

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void selectDate(int index) {
    selectedDateIndex.value = index;
    // Update earnings data based on selected date
    totalEarnings.value = earningsData[index];
    earningsPercentage.value = index == 0 ? 0 : (earningsData[index] / earningsData[selectedDateIndex.value] * 100);
    servicesAmount.value = earningsData[index] * 0.8;
    servicesPercentage.value = index == 0 ? 0 : 8;
    tipsAmount.value = earningsData[index] * 0.2;
    tipsPercentage.value = index == 0 ? 0 : 15;
  }

  void updateEarningsData({
    required double earnings,
    required double earningsPercent,
    required double services,
    required double servicesPercent,
    required double tips,
    required double tipsPercent,
  }) {
    totalEarnings.value = earnings;
    earningsPercentage.value = earningsPercent;
    servicesAmount.value = services;
    servicesPercentage.value = servicesPercent;
    tipsAmount.value = tips;
    tipsPercentage.value = tipsPercent;
  }
}

class EarningsDashboard extends StatelessWidget {
  final EarningsController controller = Get.put(EarningsController());

  EarningsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const FreelanceMarketText(
            'Earnings',
            color: kPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 10),

          // Main earnings display
          Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FreelanceMarketText(
                '\$${controller.totalEarnings.value.toInt()}',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
              ),
              const SizedBox(width: 12),
              FreelanceMarketText(
                '${controller.earningsPercentage.value.toInt()}%',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: kTextSecondary2Color,
              ),
            ],
          )),

          const SizedBox(height: 10),

          // Timeline chart
          Obx(() => SizedBox(
            height: 120,
            child: CustomPaint(
              size: const Size(double.infinity, 120),
              painter: TimelineChartPainter(
                dates: controller.timelineDates,
                selectedIndex: controller.selectedDateIndex.value,
              ),
            ),
          )),

          const SizedBox(height: 20),

          // Bottom stats row
          Obx(() => Row(
            children: [
              // Services column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FreelanceMarketText(
                      'SERVICES',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kTextSecondary2Color,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FreelanceMarketText(
                          '\$${controller.servicesAmount.value.toInt()}',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '${controller.servicesPercentage.value.toInt()}%',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    FreelanceMarketText(
                      'Discounts',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kTextSecondary2Color,
                    ),
                  ],
                ),
              ),

              // Tips column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FreelanceMarketText(
                      'TIPS',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kTextSecondary2Color,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FreelanceMarketText(
                          '\$${controller.tipsAmount.value.toInt()}',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '${controller.tipsPercentage.value.toInt()}%',
                            style: TextStyle(
                              fontSize: 14,
                              color: kTextSecondary2Color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    FreelanceMarketText(
                      'LOST REVENUE',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kTextSecondary2Color,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class TimelineChartPainter extends CustomPainter {
  final List<String> dates;
  final int selectedIndex;

  TimelineChartPainter({
    required this.dates,
    required this.selectedIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2E5BBA)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dashedPaint = Paint()
      ..color = const Color(0xFF2E5BBA)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final verticalLinePaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final selectedCirclePaint = Paint()
      ..color = const Color(0xFF2E5BBA)
      ..style = PaintingStyle.fill;

    final selectedCircleOuterPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw vertical grid lines
    final spacing = size.width / (dates.length - 1);
    for (int i = 0; i < dates.length; i++) {
      final x = i * spacing;

      // Draw vertical dashed lines
      _drawDashedLine(
        canvas,
        Offset(x, 0),
        Offset(x, size.height - 30),
        verticalLinePaint,
        dashWidth: 6,
        dashSpace: 3,
      );
    }

    // Draw horizontal timeline
    final timelineY = size.height - 60;

    // Draw dashed line
    _drawDashedLine(
      canvas,
      const Offset(0, 1),
      Offset(size.width, timelineY),
      dashedPaint,
      dashWidth: 8,
      dashSpace: 4,
    );

    // Draw selected point circle
    final selectedX = selectedIndex * spacing;
    canvas.drawCircle(
      Offset(selectedX, timelineY),
      12,
      selectedCircleOuterPaint,
    );
    canvas.drawCircle(
      Offset(selectedX, timelineY),
      8,
      selectedCirclePaint,
    );

    // Draw date labels
    final textStyle = TextStyle(
      fontSize: 8,
      color: kTextSecondary2Color,
      fontWeight: FontWeight.w500,
    );

    for (int i = 0; i < dates.length; i++) {
      final x = i * spacing;
      final textPainter = TextPainter(
        text: TextSpan(text: dates[i], style: textStyle),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, size.height - 25),
      );
    }
  }

  void _drawDashedLine(
      Canvas canvas,
      Offset start,
      Offset end,
      Paint paint, {
        required double dashWidth,
        required double dashSpace,
      }) {
    final distance = (end - start).distance;
    final dashCount = (distance / (dashWidth + dashSpace)).floor();

    for (int i = 0; i < dashCount; i++) {
      final startRatio = (i * (dashWidth + dashSpace)) / distance;
      final endRatio = ((i * (dashWidth + dashSpace)) + dashWidth) / distance;

      final dashStart = Offset.lerp(start, end, startRatio)!;
      final dashEnd = Offset.lerp(start, end, endRatio)!;

      canvas.drawLine(dashStart, dashEnd, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


