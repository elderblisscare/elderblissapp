import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AboutUs'});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // --- GALAXY FOLD RESPONSIVE SCALING LOGIC ---
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 375.0;

    // Get accessibility text scale factor and clamp it to prevent UI breakage
    final accessibilityTextScale = MediaQuery.textScalerOf(context).scale(1.0);
    final clampedTextScale = accessibilityTextScale.clamp(1.0, 1.3); // Max 130% for accessibility

    // Galaxy Fold optimization: Detect very narrow screens (≤ 340px ≈ 2.64 inches)
    final bool isVeryNarrowScreen = screenWidth <= 340;
    
    // Adjust scaling factors for Galaxy Fold and similar devices
    final double layoutScaleFactor = isVeryNarrowScreen 
        ? (screenWidth / 320.0).clamp(0.85, 1.0) // Use 320px as base for narrow screens
        : (screenWidth / baseWidth).clamp(1.0, 1.2);
        
    final double fontScaleFactor = isVeryNarrowScreen
        ? ((screenWidth / 320.0) * clampedTextScale).clamp(0.9, 1.1) // Ensure readable text on narrow screens
        : ((screenWidth / baseWidth) * clampedTextScale).clamp(1.0, 1.15);
    // --- END OF RESPONSIVE SCALING LOGIC ---

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Header Section - Optimized for Galaxy Fold
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).primary.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      (isVeryNarrowScreen ? 16 : 24) * layoutScaleFactor, 
                      (isVeryNarrowScreen ? 16 : 20) * layoutScaleFactor, 
                      (isVeryNarrowScreen ? 16 : 24) * layoutScaleFactor, 
                      (isVeryNarrowScreen ? 24 : 32) * layoutScaleFactor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12 * layoutScaleFactor),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  context.pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: (isVeryNarrowScreen ? 20 : 24) * layoutScaleFactor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: (isVeryNarrowScreen ? 16 : 24) * layoutScaleFactor),
                        Text(
                          'About Us',
                          style: GoogleFonts.inter(
                            fontSize: (isVeryNarrowScreen ? 24 : 32) * fontScaleFactor,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: (isVeryNarrowScreen ? 6 : 8) * layoutScaleFactor),
                        Text(
                          isVeryNarrowScreen 
                              ? 'Learn about our mission to enhance elder care and core values.'
                              : 'Learn about our mission to enhance elder care and our core values.',
                          style: GoogleFonts.inter(
                            fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Main Content Section - Optimized for Galaxy Fold
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor, 
                    vertical: (isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor
                  ),
                  child: Column(
                    children: [
                      // --- Stats Section Card - Optimized for Galaxy Fold ---
                      Container(
                        margin: EdgeInsets.only(bottom: (isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.0 * layoutScaleFactor),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                            width: 1.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.08),
                              blurRadius: 15 * layoutScaleFactor,
                              offset: Offset(0, 5 * layoutScaleFactor),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatItem(
                                context, 
                                '1000+', 
                                'Families Served', 
                                icon: Icon(Icons.people_outline, color: FlutterFlowTheme.of(context).primary, size: (isVeryNarrowScreen ? 22.0 : 28.0) * layoutScaleFactor),
                                layoutScale: layoutScaleFactor,
                                fontScale: fontScaleFactor,
                                isVeryNarrowScreen: isVeryNarrowScreen,
                              ),
                              Container(height: (isVeryNarrowScreen ? 30.0 : 40.0) * layoutScaleFactor, width: 1.0, color: FlutterFlowTheme.of(context).alternate),
                              _buildStatItem(
                                context, 
                                '24/7', 
                                isVeryNarrowScreen ? 'Support' : 'Support Available', 
                                icon: Icon(Icons.headset_mic_outlined, color: FlutterFlowTheme.of(context).primary, size: (isVeryNarrowScreen ? 22.0 : 28.0) * layoutScaleFactor),
                                layoutScale: layoutScaleFactor,
                                fontScale: fontScaleFactor,
                                isVeryNarrowScreen: isVeryNarrowScreen,
                              ),
                              Container(height: (isVeryNarrowScreen ? 30.0 : 40.0) * layoutScaleFactor, width: 1.0, color: FlutterFlowTheme.of(context).alternate),
                              _buildStatItem(
                                context,
                                '5+',
                                isVeryNarrowScreen ? 'Years Exp' : 'Years Experience',
                                // Custom icon widget for the 5-star rating
                                icon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(isVeryNarrowScreen ? 3 : 5, (index) => Icon(
                                    Icons.star_border_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: (isVeryNarrowScreen ? 12.0 : 18.0) * layoutScaleFactor,
                                  )),
                                ),
                                layoutScale: layoutScaleFactor,
                                fontScale: fontScaleFactor,
                                isVeryNarrowScreen: isVeryNarrowScreen,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // --- Vision Section Card - Optimized for Galaxy Fold ---
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: (isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor),
                        padding: EdgeInsets.all((isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.0 * layoutScaleFactor),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                            width: 1.0,
                          ),
                           boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.08),
                              blurRadius: 15 * layoutScaleFactor,
                              offset: Offset(0, 5 * layoutScaleFactor),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Our Vision',
                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                    fontFamily: GoogleFonts.sora().fontFamily,
                                    fontSize: (isVeryNarrowScreen ? 20.0 : 24.0) * fontScaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(height: (isVeryNarrowScreen ? 12.0 : 16.0) * layoutScaleFactor),
                            Text(
                              'ElderBliss envisions creating a vibrant community for seniors, dedicated to enhancing your lifestyle and meeting all your health needs. Our mission is to provide a safe haven for elders and a comprehensive solution for all your requirements. We aim to create a supportive environment that values respect, dignity, happiness, and fulfillment in the golden years.',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      // --- What Inspires Us Section Card - Optimized for Galaxy Fold ---
                      Container(
                         width: double.infinity,
                         margin: EdgeInsets.only(bottom: (isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor),
                         padding: EdgeInsets.all((isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor),
                         decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.0 * layoutScaleFactor),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                            width: 1.0,
                          ),
                           boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.08),
                              blurRadius: 15 * layoutScaleFactor,
                              offset: Offset(0, 5 * layoutScaleFactor),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What Inspires Us',
                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                    fontFamily: GoogleFonts.sora().fontFamily,
                                    fontSize: (isVeryNarrowScreen ? 20.0 : 24.0) * fontScaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(height: (isVeryNarrowScreen ? 12.0 : 16.0) * layoutScaleFactor),
                            Text(
                              'At ElderBliss, we are driven by the belief that every person deserves to live a life filled with joy, dignity, and meaningful connections. Our values are at the heart of everything we do.',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.6,
                                  ),
                            ),
                            SizedBox(height: (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor),
                            Container(
                              padding: EdgeInsets.all((isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0 * layoutScaleFactor),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                  width: 1.0,
                                )
                              ),
                              child: Column(
                                children: [
                                  _buildValueItem(context, Icons.favorite_border, 'Understanding',
                                      'We approach each Elder with kindness and empathy, ensuring they feel valued and understood.',
                                      layoutScale: layoutScaleFactor, fontScale: fontScaleFactor, isVeryNarrowScreen: isVeryNarrowScreen),
                                  _buildValueItem(context, Icons.handshake_outlined, 'Respect',
                                      'We honor the unique life experiences and contributions of our Seniors, creating an atmosphere where everyone feels appreciated.',
                                      layoutScale: layoutScaleFactor, fontScale: fontScaleFactor, isVeryNarrowScreen: isVeryNarrowScreen),
                                  _buildValueItem(context, Icons.people_outline, 'Tribe',
                                      'We nurture a sense of belonging through lively social events, meaningful relationships, and a support system that feels like family.',
                                      layoutScale: layoutScaleFactor, fontScale: fontScaleFactor, isVeryNarrowScreen: isVeryNarrowScreen),
                                  _buildValueItem(context, Icons.star_border, 'Distinction',
                                      'We maintain the highest standards in all aspects of our service, from personalized care plans to top-notch facilities.', 
                                      hasPadding: false, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor, isVeryNarrowScreen: isVeryNarrowScreen),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // --- Contact Section Card - Optimized for Galaxy Fold ---
                      Container(
                        margin: EdgeInsets.only(bottom: (isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor),
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
                          borderRadius: BorderRadius.circular(20.0 * layoutScaleFactor),
                           boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
                              blurRadius: 20 * layoutScaleFactor,
                              offset: Offset(0, 8 * layoutScaleFactor),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all((isVeryNarrowScreen ? 24.0 : 32.0) * layoutScaleFactor),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.white,
                                size: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                              ),
                              SizedBox(height: (isVeryNarrowScreen ? 12.0 : 16.0) * layoutScaleFactor),
                              Text(
                                'Get in Touch',
                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                      fontFamily: GoogleFonts.sora().fontFamily,
                                      fontSize: (isVeryNarrowScreen ? 20.0 : 24.0) * fontScaleFactor,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: (isVeryNarrowScreen ? 6.0 : 8.0) * layoutScaleFactor),
                              Text(
                                isVeryNarrowScreen 
                                    ? 'Ready to learn more? Contact us today!'
                                    : 'Ready to learn more about our services? Contact us today!',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: GoogleFonts.inter().fontFamily,
                                      fontSize: (isVeryNarrowScreen ? 13.0 : 14.0) * fontScaleFactor,
                                      color: Color(0xFFE0E0E0),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              SizedBox(height: (isVeryNarrowScreen ? 18.0 : 24.0) * layoutScaleFactor),
                              FFButtonWidget(
                                onPressed: () async {
                                  await launchUrl(Uri.parse('https://wa.me/message/BFIUAWXCKN3BM1'),
                                      mode: LaunchMode.externalApplication);
                                },
                                text: isVeryNarrowScreen ? 'Contact on WhatsApp' : 'Contact Us on WhatsApp',
                                icon: FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  size: (isVeryNarrowScreen ? 18.0 : 20.0) * layoutScaleFactor,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: (isVeryNarrowScreen ? 45.0 : 50.0) * layoutScaleFactor,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: (isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor,
                                  ),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                        fontFamily: GoogleFonts.inter().fontFamily,
                                        fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                        color: FlutterFlowTheme.of(context).primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(25.0 * layoutScaleFactor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: (isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for stats. Now accepts a Widget for the icon and responsive parameters.
  Widget _buildStatItem(BuildContext context, String number, String label, {
    required Widget icon,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    return Expanded(
      child: Column(
        children: [
          icon, // Use the provided icon widget directly
          SizedBox(height: (isVeryNarrowScreen ? 6.0 : 8.0) * layoutScale),
          Text(
            number,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: GoogleFonts.sora().fontFamily,
                  fontSize: (isVeryNarrowScreen ? 18.0 : 22.0) * fontScale,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: (isVeryNarrowScreen ? 3.0 : 4.0) * layoutScale),
          Text(
            label,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: (isVeryNarrowScreen ? 10.0 : 12.0) * fontScale,
                  letterSpacing: 0.0,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Helper method for value items.
  Widget _buildValueItem(BuildContext context, IconData icon, String title, String description, {
    bool hasPadding = true,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: hasPadding ? (isVeryNarrowScreen ? 18.0 : 24.0) * layoutScale : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all((isVeryNarrowScreen ? 10.0 : 12.0) * layoutScale),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0 * layoutScale),
            ),
            child: Icon(
              icon,
              color: FlutterFlowTheme.of(context).primary,
              size: (isVeryNarrowScreen ? 20.0 : 24.0) * layoutScale,
            ),
          ),
          SizedBox(width: (isVeryNarrowScreen ? 12.0 : 16.0) * layoutScale),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: GoogleFonts.sora().fontFamily,
                        fontSize: (isVeryNarrowScreen ? 16.0 : 18.0) * fontScale,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: (isVeryNarrowScreen ? 6.0 : 8.0) * layoutScale),
                Text(
                  description,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: (isVeryNarrowScreen ? 13.0 : 14.0) * fontScale,
                        letterSpacing: 0.0,
                        lineHeight: 1.5,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
