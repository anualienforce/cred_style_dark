import 'package:dark_cred/core/theme/colors.dart';
import 'package:dark_cred/data/models/artist_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ArtistsSection extends StatelessWidget {
  final List<ArtistModel> artists;

  const ArtistsSection({
    super.key,
    required this.artists,
    // required this.onSeeAllTapped,  further for development
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final data = artists[index];
              return Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(width: 1, color: AppColors.primary)),
                      margin: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(data.profileImageUrl),
                        backgroundColor: Colors.grey[200],
                      )),
                  SizedBox(
                    width: 100,
                    child: Text(
                      data.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
            itemCount: artists.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            // onTap: onSeeAllTapped, for future development
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