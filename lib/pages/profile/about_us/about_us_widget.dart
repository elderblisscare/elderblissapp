import '/components/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Ensure this is imported for launchUrl
import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  static String routeName = 'AboutUs';
  static String routePath = 'about-us';

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());

    // Log screen view for analytics
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AboutUs'});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping outside text fields
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView( // Moved SingleChildScrollView here
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // HEADER SECTION - UPDATED TO MATCH CONTACT US PAGE
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft, // Matched ContactusWidget
                      end: Alignment.bottomRight, // Matched ContactusWidget
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).primary.withOpacity(0.8), // Consistent gradient
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 20, 24, 32), // Matched ContactusWidget padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( // For back button - Matched ContactusWidget
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  logFirebaseEvent('ABOUT_US_PAGE_arrow_back_ICN_ON_TAP');
                                  context.pop(); // Use pop to go back
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24), // Space after back button - Matched ContactusWidget
                        Text(
                          'About Us', // Title
                          style: GoogleFonts.inter( // Using GoogleFonts.inter as in ContactusWidget
                            fontSize: 32, // Matched ContactusWidget font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5, // Matched ContactusWidget letter spacing
                          ),
                        ),
                        SizedBox(height: 8), // Space after title - Matched ContactusWidget
                        Text(
                          'Learn about our mission to enhance elder care and our core values.', // Updated subtitle
                          style: GoogleFonts.inter( // Using GoogleFonts.inter as in ContactusWidget
                            fontSize: 16, // Matched ContactusWidget font size
                            color: Colors.white.withOpacity(0.9), // Matched opacity
                            height: 1.5, // Matched line height
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // END HEADER SECTION

                // Main Content Section
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                    child: Column(
                      children: [
                        // Stats Section - Retains Icons
                        Container(
                          margin: const EdgeInsets.only(bottom: 32.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildStatItem(context, '1000+', 'Families Served', Icons.people),
                                    Container(
                                      height: 40.0,
                                      width: 1.0,
                                      color: FlutterFlowTheme.of(context).alternate,
                                    ),
                                    _buildStatItem(context, '24/7', 'Support Available', Icons.access_time),
                                    Container(
                                      height: 40.0,
                                      width: 1.0,
                                      color: FlutterFlowTheme.of(context).alternate,
                                    ),
                                    _buildStatItem(context, '5+', 'Years Experience', Icons.star),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Our Vision Section - Icons removed, text overflow fixed
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Our Vision',
                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                          fontFamily: GoogleFonts.sora().fontFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Text(
                                    'ElderBliss envisions creating a vibrant community for seniors, dedicated to enhancing your lifestyle and meeting all your health needs. Our mission is to provide a safe haven for elders and a comprehensive solution for all your requirements. We aim to create a supportive environment that values respect, dignity, happiness, and fulfillment in the golden years. Discover compassion and a wide range of premium services, all conveniently accessible at your fingertips.',
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: GoogleFonts.inter().fontFamily,
                                          letterSpacing: 0.0,
                                          lineHeight: 1.6,
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                        ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24.0),

                        // What Inspires Us Section - Icons removed, text overflow fixed
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What Inspires Us',
                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                              fontFamily: GoogleFonts.sora().fontFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                            ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Text(
                                    'At ElderBliss, we are driven by the belief that every person deserves to live a life filled with joy, dignity, and meaningful connections. Our values are at the heart of everything we do, guiding us to deliver an exceptional experience for our Seniors.',
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: GoogleFonts.inter().fontFamily,
                                          letterSpacing: 0.0,
                                          lineHeight: 1.6,
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                        ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                  const SizedBox(height: 32.0),
                                  // Values Section - Ensure individual value items handle overflow
                                  _buildValueItem(context, Icons.favorite_border, 'Understanding',
                                      'We approach each Elder with kindness and empathy, ensuring they feel valued and understood.'),
                                  _buildValueItem(context, Icons.handshake_outlined, 'Respect',
                                      'We honor the unique life experiences and contributions of our Seniors, creating an atmosphere where everyone feels appreciated and respected.'),
                                  _buildValueItem(context, Icons.people_outline, 'Tribe',
                                      'We nurture a sense of belonging through lively social events, meaningful relationships, and a support system that feels like family.'),
                                  _buildValueItem(context, Icons.star_border, 'Distinction',
                                      'We maintain the highest standards in all aspects of our service, from personalized care plans to the top-notch quality of our facilities.'),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24.0),

                        // Contact Section - Icon unchanged
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(-1.0, 0.0),
                                end: AlignmentDirectional(1.0, 0.0),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Get in Touch',
                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                      fontFamily: GoogleFonts.sora().fontFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Ready to learn more about our services? Contact us today!',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: GoogleFonts.inter().fontFamily,
                                      color: Color(0xFFE0E0E0),
                                      letterSpacing: 0.0,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                  const SizedBox(height: 24.0),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent('ABOUT_US_CONTACT_US_BTN_ON_TAP');
                                      // CORRECTED: Using Uri.parse and LaunchMode.externalApplication
                                      await launchUrl(Uri.parse('https://wa.me/message/BFIUAWXCKN3BM1'),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    text: 'Contact Us on WhatsApp',
                                    icon: Icon(
                                      Icons.message,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                        fontFamily: GoogleFonts.inter().fontFamily,
                                        color: FlutterFlowTheme.of(context).primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build statistics items
  Widget _buildStatItem(BuildContext context, String number, String label, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: FlutterFlowTheme.of(context).primary,
            size: 24.0,
          ),
          const SizedBox(height: 8.0),
          Text(
            number,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
              fontFamily: GoogleFonts.sora().fontFamily,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: GoogleFonts.inter().fontFamily,
              letterSpacing: 0.0,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }

  // Helper method to build individual value items with icons
  Widget _buildValueItem(BuildContext context, IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              icon,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: GoogleFonts.sora().fontFamily,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        letterSpacing: 0.0,
                        lineHeight: 1.5,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}