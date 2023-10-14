import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
    required this.header,
    required this.count,
    required this.commentary,
    required this.image,
    required this.imageBackgroundColor,
    required this.commentaryColor,
  });
  final String header;
  final String count;
  final String commentary;
  final Widget image;
  final Color imageBackgroundColor, commentaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 116,
      decoration: BoxDecoration(
        border: Border.all(
          color: lavendaarBlue800,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 11, left: 8, right: 8),
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: imageBackgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: image,
                  ),
                ),
                const Gap(6),
                SizedBox(
                  width: 57,
                  height: 24,
                  child: Text(
                    header,
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Text(
            count,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const Gap(16),
          Text(
            commentary,
            style: GoogleFonts.inter(
              fontSize: 7,
              fontWeight: FontWeight.w300,
              color: commentaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
