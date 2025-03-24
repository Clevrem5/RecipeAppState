import 'package:flutter/material.dart';

import 'optional.dart';

class CreateReviewRecommendSection extends StatelessWidget {
  const CreateReviewRecommendSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Do you recommend this recipe?"),
        Row(
          spacing: 100,
          children: [
            CreateReviewRecommendSectionOption(text: "No", value: false),
            CreateReviewRecommendSectionOption(text: "Yes", value: true),
          ],
        ),
      ],
    );
  }
}