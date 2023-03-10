import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

import '../utils/constants.dart';
import 'big_text.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) {
                  return const Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  );
                },
              ),
            ),
            SizedBox(width: Dimensions.height10),
            SmallText(text: '4.5'),
            SizedBox(width: Dimensions.height10),
            SmallText(text: "1278"),
            SizedBox(width: Dimensions.height10),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.circle_rounded,
              color: AppColors.iconColor1,
            ),
            SmallText(text: "Normal"),
            const SizedBox(width: 10),
            const Icon(
              Icons.location_on,
              color: AppColors.mainColor,
            ),
            SmallText(text: "1.7km"),
            const SizedBox(width: 10),
            const Icon(
              Icons.access_time_rounded,
              color: AppColors.iconColor2,
            ),
            SmallText(text: "32min"),
          ],
        )
      ],
    );
  }
}
