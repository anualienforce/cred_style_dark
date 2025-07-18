import 'package:dark_cred/core/theme/colors.dart';
import 'package:dark_cred/data/dummy_data/category_data.dart';
import 'package:flutter/material.dart';


class FeaturedCategorySection extends StatefulWidget {
  const FeaturedCategorySection({super.key});

  @override
  State<FeaturedCategorySection> createState() => _FeaturedCategorySectionState();
}

class _FeaturedCategorySectionState extends State<FeaturedCategorySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            final data = eventCategories.elementAt(index);
          return Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(data.icon),
                Text(data.title)
              ],
            ),
          );

        },itemCount: eventCategories.length,),
      ),
    );
  }
}
