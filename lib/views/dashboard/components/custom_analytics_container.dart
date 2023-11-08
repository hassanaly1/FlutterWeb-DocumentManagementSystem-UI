import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnalyticsContainer extends StatelessWidget {
  final String analyticsType;
  final String analyticsValue;
  final String analyticsPercentage;
  final IconData icon;
  const CustomAnalyticsContainer({
    super.key,
    required this.analyticsType,
    required this.analyticsValue,
    required this.analyticsPercentage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: SizedBox(
        width: 300,
        height: 150,
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: analyticsType,
                      fSize: 20.0,
                      fWeight: FontWeight.w700,
                    ),
                    const Icon(Icons.query_stats_outlined)
                  ],
                ),
                CustomTextWidget(
                  text: analyticsValue,
                  fSize: 30.0,
                  fWeight: FontWeight.w500,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: analyticsPercentage,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Icon(
                            icon,
                            size: 15,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' from last week',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
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
