import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homecare_services_model.dart';
export 'homecare_services_model.dart';

class HomecareServicesWidget extends StatefulWidget {
  const HomecareServicesWidget({super.key});

  static String routeName = 'HomecareServices';
  static String routePath = 'homecareServices';

  @override
  State<HomecareServicesWidget> createState() => _HomecareServicesWidgetState();
}

class _HomecareServicesWidgetState extends State<HomecareServicesWidget> {
  late HomecareServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomecareServicesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomecareServices'});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // --- RESPONSIVE SCALING LOGIC ---
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 375.0;
    final accessibilityTextScale = MediaQuery.textScalerOf(context).scale(1.0);
    final clampedTextScale = accessibilityTextScale.clamp(1.0, 1.3);
    final bool isVeryNarrowScreen = screenWidth <= 340;
    
    final double layoutScaleFactor = isVeryNarrowScreen 
        ? (screenWidth / 320.0).clamp(0.85, 1.0)
        : (screenWidth / baseWidth).clamp(1.0, 1.2);
        
    final double fontScaleFactor = isVeryNarrowScreen
        ? ((screenWidth / 320.0) * clampedTextScale).clamp(0.9, 1.1)
        : ((screenWidth / baseWidth) * clampedTextScale).clamp(1.0, 1.15);
    
    final double bottomNavHeight = MediaQuery.of(context).padding.bottom + 80;
    // --- END OF RESPONSIVE SCALING LOGIC ---

    final theme = FlutterFlowTheme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Section
              Container(
                width: double.infinity,
                height: isVeryNarrowScreen 
                    ? MediaQuery.of(context).size.height * 0.45 
                    : MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/medical-setup-768x435.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withAlpha((0.3 * 255).round()),
                              Colors.black.withAlpha((0.7 * 255).round()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha((0.3 * 255).round()),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () => context.pushNamed(ServicesWidget.routeName),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: isVeryNarrowScreen ? 18 : 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 24,
                      right: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6), // Blue tag for homecare
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Convenience',
                              style: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 13 : 14) * fontScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: isDark ? const Color(0xFF111827) : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                          Text(
                            'Daily Assistance &\nConvenience Services',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 28 : 32) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: isDark ? const Color(0xFF111827) : Colors.white,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                          Text(
                            'Making everyday tasks easier with professional support services tailored for senior independence',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: isDark 
                                  ? const Color(0xFF111827).withAlpha((0.8 * 255).round()) 
                                  : Colors.white.withAlpha((0.9 * 255).round()),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Content Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isVeryNarrowScreen ? 16 : 24),
                child: Column(
                  children: [
                    // Stats Grid
                    Row(
                      children: [
                        _buildStatCard(
                          context,
                          title: 'Expert',
                          subtitle: 'Caregivers',
                          icon: Icons.people,
                          color: const Color(0xFF8B5CF6),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                        SizedBox(width: 12 * layoutScaleFactor),
                        _buildStatCard(
                          context,
                          title: 'Home',
                          subtitle: 'Visits',
                          icon: Icons.home_work,
                          color: const Color(0xFFF59E0B),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                      ],
                    ),

                    SizedBox(height: 32 * layoutScaleFactor),

                    // Main Service Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: theme.secondaryBackground,
                        borderRadius: BorderRadius.circular(20 * layoutScaleFactor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.05 * 255).round()),
                            blurRadius: 15 * layoutScaleFactor,
                            offset: Offset(0, 8 * layoutScaleFactor),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Service Details',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 20 : 22) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: theme.primaryText,
                            ),
                          ),
                          SizedBox(height: 12 * layoutScaleFactor),
                          Text(
                            'Our team offers the following professional services to ensure a comfortable and independent lifestyle for seniors at home:',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: theme.secondaryText,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 24 * layoutScaleFactor),
                          _buildServiceItem(context, 'Doctor Home Visit', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Physio Home Visit', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Experienced & professional Attendants', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Trained eldercare Nurses', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Nurse 24 Hour care at home', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Medicine and food delivery at home', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'ECG & Radiology at home', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Lab and Diagnostics', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Nutritional Care', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          
                          SizedBox(height: 32 * layoutScaleFactor),
                          
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('HOMECARE_Contact_BTN_ON_TAP');
                              await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                            },
                            text: 'Schedule Homecare',
                            icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 20),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: (isVeryNarrowScreen ? 50.0 : 54.0) * layoutScaleFactor,
                              color: const Color(0xFF3B82F6),
                              textStyle: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 16 : 18) * fontScaleFactor,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(28.0 * layoutScaleFactor),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: bottomNavHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    final theme = FlutterFlowTheme.of(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(isVeryNarrowScreen ? 12 : 16 * layoutScale),
        decoration: BoxDecoration(
          color: color.withAlpha((0.1 * 255).round()),
          borderRadius: BorderRadius.circular(16 * layoutScale),
          border: Border.all(color: color.withAlpha((0.2 * 255).round())),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24 * layoutScale),
            SizedBox(height: 8 * layoutScale),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: (isVeryNarrowScreen ? 16 : 18) * fontScale,
                fontWeight: FontWeight.bold,
                color: theme.primaryText,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: (isVeryNarrowScreen ? 10 : 12) * fontScale,
                color: theme.secondaryText,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, String text, double layoutScale, double fontScale, bool isVeryNarrowScreen) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12 * layoutScale),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6 * layoutScale, right: 12 * layoutScale),
            width: 6 * layoutScale,
            height: 6 * layoutScale,
            decoration: const BoxDecoration(color: Color(0xFF3B82F6), shape: BoxShape.circle),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScale,
                color: FlutterFlowTheme.of(context).primaryText,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
