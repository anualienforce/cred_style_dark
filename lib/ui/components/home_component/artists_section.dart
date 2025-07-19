import 'package:dark_cred/core/theme/colors.dart';
import 'package:dark_cred/data/dummy_data/category_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/dummy_data/artist_data.dart';


class ArtistsSection extends StatefulWidget {
  const ArtistsSection({super.key});

  @override
  State<ArtistsSection> createState() => _ArtistsSectionState();
}

class _ArtistsSectionState extends State<ArtistsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140,
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final data = artists.elementAt(index);
                return Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,color: AppColors.primary
                        )
                      ),
                      margin: EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(data.profileImageUrl),
                        backgroundColor: Colors.grey[200], // optional
                      )
                    ),
                    Text(
                      data.name,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },itemCount: artists.length,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {

              print("See All Tapped");
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.secondary),
              ),
              child: Text(
                'All Artists',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
