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
                // HEADER SECTION
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
                    padding: EdgeInsets.fromLTRB(24, 20, 24, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                  context.pop();
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
                        SizedBox(height: 24),
                        Text(
                          'About Us',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Learn about our mission to enhance elder care and our core values.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Main Content Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                  child: Column(
                    children: [
                      // --- UPDATED STATS SECTION CARD ---
                      Container(
                        margin: const EdgeInsets.only(bottom: 24.0),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                            width: 1.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.08),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatItem(context, '1000+', 'Families Served', icon: Icon(Icons.people_outline, color: FlutterFlowTheme.of(context).primary, size: 28.0)),
                              Container(height: 40.0, width: 1.0, color: FlutterFlowTheme.of(context).alternate),
                              _buildStatItem(context, '24/7', 'Support Available', icon: Icon(Icons.headset_mic_outlined, color: FlutterFlowTheme.of(context).primary, size: 28.0)),
                              Container(height: 40.0, width: 1.0, color: FlutterFlowTheme.of(context).alternate),
                              _buildStatItem(
                                context,
                                '5+',
                                'Years Experience',
                                // Custom icon widget for the 5-star rating
                                icon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(5, (index) => Icon(
                                    Icons.star_border_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 18.0,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // --- OUR VISION SECTION CARD ---
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 24.0),
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                            width: 1.0,
                          ),
                           boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.08),
                              blurRadius: 15,
                              offset: Offset(0, 5),
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
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'ElderBliss envisions creating a vibrant community for seniors, dedicated to enhancing your lifestyle and meeting all your health needs. Our mission is to provide a safe haven for elders and a comprehensive solution for all your requirements. We aim to create a supportive environment that values respect, dignity, happiness, and fulfillment in the golden years.',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      // --- WHAT INSPIRES US SECTION CARD (WITH NESTED CARD) ---
                      Container(
                         width: double.infinity,
                         margin: const EdgeInsets.only(bottom: 24.0),
                         padding: const EdgeInsets.all(24.0),
                         decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                            width: 1.0,
                          ),
                           boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.08),
                              blurRadius: 15,
                              offset: Offset(0, 5),
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
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'At ElderBliss, we are driven by the belief that every person deserves to live a life filled with joy, dignity, and meaningful connections. Our values are at the heart of everything we do.',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.6,
                                  ),
                            ),
                            const SizedBox(height: 24.0),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                  width: 1.0,
                                )
                              ),
                              child: Column(
                                children: [
                                  _buildValueItem(context, Icons.favorite_border, 'Understanding',
                                      'We approach each Elder with kindness and empathy, ensuring they feel valued and understood.'),
                                  _buildValueItem(context, Icons.handshake_outlined, 'Respect',
                                      'We honor the unique life experiences and contributions of our Seniors, creating an atmosphere where everyone feels appreciated.'),
                                  _buildValueItem(context, Icons.people_outline, 'Tribe',
                                      'We nurture a sense of belonging through lively social events, meaningful relationships, and a support system that feels like family.'),
                                  _buildValueItem(context, Icons.star_border, 'Distinction',
                                      'We maintain the highest standards in all aspects of our service, from personalized care plans to top-notch facilities.', hasPadding: false),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // --- CONTACT SECTION CARD ---
                      Container(
                        margin: const EdgeInsets.only(bottom: 24.0),
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
                           boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
                              blurRadius: 20,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.whatsapp,
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
                              ),
                              const SizedBox(height: 24.0),
                              FFButtonWidget(
                                onPressed: () async {
                                  await launchUrl(Uri.parse('https://wa.me/message/BFIUAWXCKN3BM1'),
                                      mode: LaunchMode.externalApplication);
                                },
                                text: 'Contact Us on WhatsApp',
                                icon: FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                        fontFamily: GoogleFonts.inter().fontFamily,
                                        color: FlutterFlowTheme.of(context).primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
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

  // Helper method for stats. Now accepts a Widget for the icon.
  Widget _buildStatItem(BuildContext context, String number, String label, {required Widget icon}) {
    return Expanded(
      child: Column(
        children: [
          icon, // Use the provided icon widget directly
          const SizedBox(height: 8.0),
          Text(
            number,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: GoogleFonts.sora().fontFamily,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }

  // Helper method for value items.
  Widget _buildValueItem(BuildContext context, IconData icon, String title, String description, {bool hasPadding = true}) {
    return Padding(
      padding: EdgeInsets.only(bottom: hasPadding ? 24.0 : 0),
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
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: GoogleFonts.inter().fontFamily,
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
