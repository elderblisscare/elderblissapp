import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contactus_model.dart';
export 'contactus_model.dart';

class ContactusWidget extends StatefulWidget {
  const ContactusWidget({super.key});

  static String routeName = 'Contactus';
  static String routePath = 'contactus';

  @override
  State<ContactusWidget> createState() => _ContactusWidgetState();
}

class _ContactusWidgetState extends State<ContactusWidget>
    with TickerProviderStateMixin {
  late ContactusModel _model;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactusModel());
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Contactus'});

    // Start fade animation
    _fadeController.forward();
  }

  @override
  void dispose() {
    _model.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required Color backgroundColor,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: iconColor.withOpacity(0.2),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 28,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (onTap != null)
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: iconColor,
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required String url,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () async {
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      if (subtitle.isNotEmpty) ...[
                        SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(
                  Icons.open_in_new,
                  color: Color(0xFF9CA3AF),
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessHoursCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Business Hours',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildHourRow('Monday - Friday', '10:00 AM - 6:00 PM', isOpen: true),
            SizedBox(height: 12),
            _buildHourRow('Saturday', '10:00 AM - 4:00 PM', isOpen: true),
            SizedBox(height: 12),
            _buildHourRow('Sunday', 'Closed', isOpen: false),
          ],
        ),
      ),
    );
  }

  Widget _buildHourRow(String day, String hours, {required bool isOpen}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isOpen
                ? Color(0xFF10B981).withOpacity(0.1)
                : Color(0xFFEF4444).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            hours,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isOpen ? Color(0xFF059669) : Color(0xFFDC2626),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8FAFC),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header Section
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
                                    logFirebaseEvent('CONTACTUS_PAGE_arrow_back_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');
                                    context.goNamed(ProfileWidget.routeName);
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
                            'Contact Us',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'We\'re here to help! Reach out to us through any of these channels and we\'ll get back to you as soon as possible.',
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

                  // Content Section
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Quick Contact Section
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 24,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Get in Touch',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        // Contact Cards
                        _buildContactCard(
                          icon: Icons.phone_rounded,
                          title: 'Phone Support',
                          subtitle: '+91 7982362899',
                          iconColor: Color(0xFF059669),
                          backgroundColor: Color(0xFF10B981).withOpacity(0.1),
                          onTap: () async {
                            final Uri phoneUri = Uri(scheme: 'tel', path: '+917982362899');
                            if (await canLaunchUrl(phoneUri)) {
                              await launchUrl(phoneUri);
                            }
                          },
                        ),
                        SizedBox(height: 16),

                        _buildContactCard(
                          icon: Icons.email_rounded,
                          title: 'Email Support',
                          subtitle: 'support@elderbliss.com',
                          iconColor: Color(0xFF3B82F6),
                          backgroundColor: Color(0xFF3B82F6).withOpacity(0.1),
                          onTap: () async {
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: 'support@elderbliss.com',
                              query: 'subject=Support Request',
                            );
                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri);
                            }
                          },
                        ),
                        SizedBox(height: 16),

                        // Modified "Visit Our Office" card with address and onTap functionality
                        _buildContactCard(
                          icon: Icons.location_on_rounded,
                          title: 'Visit Our Office',
                          subtitle: 'Available by appointment\nD 29, Block D, Sector 105, Noida, Uttar Pradesh 201304',
                          iconColor: Color(0xFF8B5CF6),
                          backgroundColor: Color(0xFF8B5CF6).withOpacity(0.1),
                          onTap: () async {
                            // URL to open in Google Maps (or a browser that redirects to maps)
                            final String mapsUrl = 'https://www.google.com/maps/dir//D+29,+Block+D,+Sector+105,+Noida,+Uttar+Pradesh+201304/@28.5335105,77.2840622,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x390ce7bb80ef7757:0x3a7d871c1480d878!2m2!1d77.3664636!2d28.5335354?entry=ttu&g_ep=EgoyMDI1MDcyMS4wIKXMDSoASAFQAw%3D%3D';
                            final Uri uri = Uri.parse(mapsUrl);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri, mode: LaunchMode.externalApplication);
                            } else {
                              // Optional: Show a SnackBar or AlertDialog if the URL cannot be launched
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Could not open map application.'),
                                ),
                              );
                            }
                          },
                        ),

                        SizedBox(height: 32),

                        // Business Hours
                        _buildBusinessHoursCard(),

                        SizedBox(height: 32),

                        // Social Media Section
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 24,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Follow Us',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Stay connected with us on social media for updates and health tips',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 24),

                        // Social Media Cards
                        _buildSocialCard(
                          icon: FontAwesomeIcons.linkedin,
                          title: 'LinkedIn',
                          subtitle: 'Professional updates and insights',
                          iconColor: Color(0xFF0A66C2),
                          url: 'https://www.linkedin.com/company/elder-bliss-care/',
                        ),
                        SizedBox(height: 12),

                        _buildSocialCard(
                          icon: FontAwesomeIcons.instagram,
                          title: 'Instagram',
                          subtitle: 'Daily care tips and community stories',
                          iconColor: Color(0xFFE4405F),
                          url: 'https://www.instagram.com/elderblisscare/',
                        ),
                        SizedBox(height: 12),

                        _buildSocialCard(
                          icon: FontAwesomeIcons.facebook,
                          title: 'Facebook',
                          subtitle: 'Community updates and events',
                          iconColor: Color(0xFF1877F2),
                          url: 'https://www.facebook.com/elderblisscare',
                        ),

                        SizedBox(height: 32),

                        // Emergency Note
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Color(0xFFF59E0B).withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF59E0B).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.info_outline,
                                  color: Color(0xFFD97706),
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Emergency Assistance',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF92400E),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'For immediate emergency assistance, use the Panic Button on the home screen.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Color(0xFF92400E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}