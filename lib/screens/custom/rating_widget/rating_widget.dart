import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';

import '../../../config/constant/colors.dart';

class RatingWidget extends StatelessWidget {
  final double averageRating;
  final int totalRatings;
  final int totalReviews;
  final Map<int, double> ratingPercentages; // star rating -> percentage

  const RatingWidget({
    super.key,
    required this.averageRating,
    required this.totalRatings,
    required this.totalReviews,
    required this.ratingPercentages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top decorative border

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Average rating
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FreelanceMarketText(
                        averageRating.toStringAsFixed(1),
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$totalRatings Ratings\nand $totalReviews Reviews',
                    style: TextStyle(
                      fontSize: 14,
                      color: kTextSecondaryColor,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            16.horizontalSpace,
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  for (int star = 5; star >= 1; star--)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          FreelanceMarketText(
                            '$star',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: (ratingPercentages[star] ?? 0) / 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 30,
                            child: FreelanceMarketText(
                              '${(ratingPercentages[star] ?? 0).toInt()}%',
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              color: kTextSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DiagonalStripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1;

    // Draw diagonal stripes
    for (double i = -size.height; i < size.width + size.height; i += 8) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

