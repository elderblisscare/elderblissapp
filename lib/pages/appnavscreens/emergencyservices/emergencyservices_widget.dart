import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emergencyservices_model.dart';
export 'emergencyservices_model.dart';

class EmergencyservicesWidget extends StatefulWidget {
  const EmergencyservicesWidget({super.key});

  static String routeName = 'emergencyservices';
  static String routePath = 'emergencyservices';

  @override
  State<EmergencyservicesWidget> createState() => _EmergencyservicesWidgetState();
}

class _EmergencyservicesWidgetState extends State<EmergencyservicesWidget> {
  late EmergencyservicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergencyservicesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'emergencyservices'});
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
                        'assets/images/emergency1-3.jpg',
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
                      top: MediaQuery.of(context).padding.top + 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.wb_sunny, color: isDark ? const Color(0xFF111827) : Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              '24/7 Available',
                              style: GoogleFonts.inter(
                                fontSize: 12 * fontScaleFactor,
                                fontWeight: FontWeight.bold,
                                color: isDark ? const Color(0xFF111827) : Colors.white,
                              ),
                            ),
                          ],
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
                              color: const Color(0xFFEF4444),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Emergency Care',
                              style: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 13 : 14) * fontScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: isDark ? const Color(0xFF111827) : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                          Text(
                            'Rapid Response\nEmergency Services',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 28 : 32) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: isDark ? const Color(0xFF111827) : Colors.white,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                          Text(
                            'Professional emergency response designed specifically for seniors with immediate medical support and family coordination',
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
                          title: '<3min',
                          subtitle: 'Response Time',
                          icon: Icons.speed,
                          color: const Color(0xFFEF4444),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                        SizedBox(width: 12 * layoutScaleFactor),
                        _buildStatCard(
                          context,
                          title: '24/7',
                          subtitle: 'Availability',
                          icon: Icons.access_time,
                          color: const Color(0xFF059669),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                        SizedBox(width: 12 * layoutScaleFactor),
                        _buildStatCard(
                          context,
                          title: '100%',
                          subtitle: 'Coverage',
                          icon: Icons.shield,
                          color: const Color(0xFF3B82F6),
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
                          Row(
                            children: [
                              Icon(Icons.medical_services, color: const Color(0xFFEF4444), size: 28 * layoutScaleFactor),
                              SizedBox(width: 12 * layoutScaleFactor),
                              Expanded(
                                child: Text(
                                  'Emergency Response Protocol',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 20 : 22) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: theme.primaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16 * layoutScaleFactor),
                          Text(
                            'Our comprehensive emergency response system is designed to provide immediate, professional assistance when seniors need it most.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: theme.secondaryText,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 24 * layoutScaleFactor),
                          _buildServiceItem(context, '24/7 Emergency support helpline', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Emergency Doctor on call', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Paramedic Support during Emergency', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Family Emergency Response Plan Setup', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Support during Hospitalization', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Prompt ambulance services', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Real time coordination', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          _buildServiceItem(context, 'Regular updates to family', layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                          
                          SizedBox(height: 32 * layoutScaleFactor),
                          
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('EMERGENCY_Contact_BTN_ON_TAP');
                              await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                            },
                            text: 'Emergency Consultation',
                            icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 20),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: (isVeryNarrowScreen ? 50.0 : 54.0) * layoutScaleFactor,
                              color: const Color(0xFFEF4444),
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
            decoration: const BoxDecoration(color: Color(0xFFEF4444), shape: BoxShape.circle),
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
