import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'safety_services_model.dart';
export 'safety_services_model.dart';

class SafetyServicesWidget extends StatefulWidget {
  const SafetyServicesWidget({super.key});

  static String routeName = 'SafetyServices';
  static String routePath = 'safetyServices';

  @override
  State<SafetyServicesWidget> createState() => _SafetyServicesWidgetState();
}

class _SafetyServicesWidgetState extends State<SafetyServicesWidget> {
  late SafetyServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SafetyServicesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SafetyServices'});
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
    
    final double bottomNavHeight = MediaQuery.of(context).padding.bottom + 80;
    // --- END OF RESPONSIVE SCALING LOGIC ---

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Section - Optimized for Galaxy Fold
              Container(
                width: double.infinity,
                height: isVeryNarrowScreen 
                    ? MediaQuery.of(context).size.height * 0.4 // Slightly shorter on narrow screens
                    : MediaQuery.of(context).size.height * 0.45,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/1-2-768x310.jpg',
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
                              Colors.black.withAlpha((0.2 * 255).round()),
                              Colors.black.withAlpha((0.6 * 255).round()),
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
                          onPressed: () {
                            context.pushNamed(ServicesWidget.routeName);
                          },
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
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF4444), // Red tag for safety
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Safety & Security',
                              style: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 13 : 14) * fontScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).brightness == Brightness.dark 
                                    ? const Color(0xFF111827) 
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                          Text(
                            'Safety Services',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 28 : 32) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness == Brightness.dark 
                                  ? const Color(0xFF111827) 
                                  : Colors.white,
                              height: 1.2,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Service Details Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          SizedBox(height: 12 * layoutScaleFactor),
                          Text(
                            'Our team offers the following professional services to ensure a safe and secure environment for seniors:',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 24 * layoutScaleFactor),
                          _buildServiceItem(
                            'Home audit for safety and fall-prevention',
                            isVeryNarrowScreen: isVeryNarrowScreen,
                            fontScale: fontScaleFactor,
                            layoutScale: layoutScaleFactor,
                          ),
                          _buildServiceItem(
                            'KYC of house help & Attendants',
                            isVeryNarrowScreen: isVeryNarrowScreen,
                            fontScale: fontScaleFactor,
                            layoutScale: layoutScaleFactor,
                          ),
                          _buildServiceItem(
                            'Suggestions on smart safety and security measures like fall detectors etc',
                            isVeryNarrowScreen: isVeryNarrowScreen,
                            fontScale: fontScaleFactor,
                            layoutScale: layoutScaleFactor,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32 * layoutScaleFactor),

                    // CTA Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(20 * layoutScaleFactor),
                        boxShadow: [
                          BoxShadow(
                            color: FlutterFlowTheme.of(context).primary.withAlpha((0.3 * 255).round()),
                            blurRadius: 20 * layoutScaleFactor,
                            offset: Offset(0, 8 * layoutScaleFactor),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Ready to enhance your home safety?',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 18 : 20) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12 * layoutScaleFactor),
                          Text(
                            'Schedule a professional safety audit today and get personalized security recommendations for your peace of mind.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 15) * fontScaleFactor,
                              color: Colors.white.withAlpha((0.9 * 255).round()),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24 * layoutScaleFactor),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('SAFETY_SERVICES_SCHEDULE_SERVICE_BTN_ON_');
                              await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                            },
                            text: 'Schedule Service',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: (isVeryNarrowScreen ? 50.0 : 54.0) * layoutScaleFactor,
                              color: Colors.white,
                              textStyle: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 16 : 18) * fontScaleFactor,
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 2.0,
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

  Widget _buildServiceItem(
    String text, {
    required bool isVeryNarrowScreen,
    required double fontScale,
    required double layoutScale,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0 * layoutScale),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6.0 * layoutScale, right: 12.0 * layoutScale),
            width: 8 * layoutScale,
            height: 8 * layoutScale,
            decoration: const BoxDecoration(
              color: Color(0xFFEF4444),
              shape: BoxShape.circle,
            ),
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
