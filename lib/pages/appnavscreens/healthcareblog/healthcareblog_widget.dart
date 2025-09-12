import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'healthcareblog_model.dart';
export 'healthcareblog_model.dart';

class HealthcareblogWidget extends StatefulWidget {
  const HealthcareblogWidget({super.key});

  static String routeName = 'Healthcareblog';
  static String routePath = 'Healthcareblog';

  @override
  State<HealthcareblogWidget> createState() => _HealthcareblogWidgetState();
}

class _HealthcareblogWidgetState extends State<HealthcareblogWidget> {
  late HealthcareblogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthcareblogModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Healthcareblog'});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildStatCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing based on screen type
    final double basePadding = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseBorderRadius = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseIconSize = isVeryNarrowScreen ? 24.0 : 32.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 18.0 : 22.0;
    final double baseSubtitleFontSize = isVeryNarrowScreen ? 11.0 : 13.0;
    final double baseSpacing = isVeryNarrowScreen ? 8.0 : 12.0;
    final double baseSubtitleSpacing = isVeryNarrowScreen ? 3.0 : 4.0;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(basePadding * layoutScale),
        decoration: BoxDecoration(
          color: color.withAlpha((0.1 * 255).round()),
          borderRadius: BorderRadius.circular(baseBorderRadius * layoutScale),
          border: Border.all(
            color: color.withAlpha((0.2 * 255).round()),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, // Vertically center content
          children: [
            Icon(
              icon,
              color: color,
              size: baseIconSize * layoutScale,
            ),
            SizedBox(height: baseSpacing * layoutScale),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: baseTitleFontSize * fontScale,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: baseSubtitleSpacing * layoutScale),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: baseSubtitleFontSize * fontScale,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureSection({
    required String title,
    required String content,
    required List<String> points,
    required IconData icon,
    required Color accentColor,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing for Galaxy Fold optimization
    final double baseMargin = isVeryNarrowScreen ? 12.0 : 16.0;
    final double basePadding = isVeryNarrowScreen ? 18.0 : 24.0;
    final double baseIconPadding = isVeryNarrowScreen ? 10.0 : 12.0;
    final double baseIconSize = isVeryNarrowScreen ? 20.0 : 24.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 18.0 : 22.0;
    final double baseContentFontSize = isVeryNarrowScreen ? 14.0 : 16.0;
    final double basePointFontSize = isVeryNarrowScreen ? 13.0 : 15.0;
    final double baseSpacing = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseLargeSpacing = isVeryNarrowScreen ? 16.0 : 20.0;
    final double baseInnerPadding = isVeryNarrowScreen ? 16.0 : 20.0;

    return Container(
      margin: EdgeInsets.symmetric(vertical: baseMargin * layoutScale),
      padding: EdgeInsets.all(basePadding * layoutScale),
      decoration: BoxDecoration(
        color: accentColor.withAlpha((0.05 * 255).round()),
        borderRadius: BorderRadius.circular(16 * layoutScale),
        border: Border.all(
          color: accentColor.withAlpha((0.15 * 255).round()),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withAlpha((0.08 * 255).round()),
            blurRadius: 15 * layoutScale,
            offset: Offset(0, 5 * layoutScale),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(baseIconPadding * layoutScale),
                decoration: BoxDecoration(
                  color: accentColor.withAlpha((0.1 * 255).round()),
                  borderRadius: BorderRadius.circular(12 * layoutScale),
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: baseIconSize * layoutScale,
                ),
              ),
              SizedBox(width: baseSpacing * layoutScale),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: baseTitleFontSize * fontScale,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: baseLargeSpacing * layoutScale),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: baseContentFontSize * fontScale,
              color: Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
          SizedBox(height: baseLargeSpacing * layoutScale),
          Container(
            padding: EdgeInsets.all(baseInnerPadding * layoutScale),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12 * layoutScale),
              border: Border.all(
                color: accentColor.withAlpha((0.1 * 255).round()),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: points.map((point) => Container(
                margin: EdgeInsets.only(bottom: (isVeryNarrowScreen ? 10 : 12) * layoutScale),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 6 * layoutScale, 
                        right: (isVeryNarrowScreen ? 10 : 12) * layoutScale,
                      ),
                      width: 6 * layoutScale,
                      height: 6 * layoutScale,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: GoogleFonts.inter(
                          fontSize: basePointFontSize * fontScale,
                          color: Color(0xFF374151),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightBox({
    required String title,
    required String content,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing for Galaxy Fold optimization
    final double basePadding = isVeryNarrowScreen ? 18.0 : 24.0;
    final double baseMargin = isVeryNarrowScreen ? 16.0 : 20.0;
    final double baseIconSize = isVeryNarrowScreen ? 24.0 : 28.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 18.0 : 20.0;
    final double baseContentFontSize = isVeryNarrowScreen ? 14.0 : 16.0;
    final double baseSpacing = isVeryNarrowScreen ? 12.0 : 16.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(basePadding * layoutScale),
      margin: EdgeInsets.symmetric(vertical: baseMargin * layoutScale),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16 * layoutScale),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withAlpha((0.3 * 255).round()),
            blurRadius: 20 * layoutScale,
            offset: Offset(0, 8 * layoutScale),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: textColor,
                size: baseIconSize * layoutScale,
              ),
              SizedBox(width: 12 * layoutScale),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: baseTitleFontSize * fontScale,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: baseSpacing * layoutScale),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: baseContentFontSize * fontScale,
              color: textColor.withAlpha((0.9 * 255).round()),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
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
        backgroundColor: Color(0xFFF8FAFC),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Section - Optimized for Galaxy Fold
              Container(
                width: double.infinity,
                height: isVeryNarrowScreen 
                    ? MediaQuery.of(context).size.height * 0.45 // Slightly shorter on narrow screens
                    : MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/WhatsApp_Image_2025-03-22_at_13.46.23_19615335.jpg',
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
                          onPressed: () {
                          context.pushNamed(DashboardWidget.routeName);
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
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Color(0xFF059669),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                  'Healthcare',
                              style: GoogleFonts.inter(
                                      fontSize: (isVeryNarrowScreen ? 13 : 14) * fontScaleFactor,
                                      fontWeight: FontWeight.w600,
                                color: Colors.white,
                                    ),
                                  ),
                                ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                                      Text(
                            'Smart Health Tracking\nfor Senior Care',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 24 : 28) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                                      Text(
                            isVeryNarrowScreen 
                                ? 'Technology-driven health monitoring for seniors with better well-being and peace of mind'
                                : 'Empowering seniors with technology-driven health monitoring for better well-being and peace of mind',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 13 : 15) * fontScaleFactor,
                              color: Colors.white.withAlpha((0.9 * 255).round()),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Content Section - Optimized for Galaxy Fold
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isVeryNarrowScreen ? 16 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Statistics Section - Optimized for Galaxy Fold
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          _buildStatCard(
                            title: '24/7',
                            subtitle: 'Health Monitoring',
                            icon: Icons.health_and_safety,
                            color: Color(0xFF059669),
                            layoutScale: layoutScaleFactor,
                            fontScale: fontScaleFactor,
                            isVeryNarrowScreen: isVeryNarrowScreen,
                          ),
                          SizedBox(width: (isVeryNarrowScreen ? 8 : 12) * layoutScaleFactor),
                          _buildStatCard(
                            title: '95%',
                            subtitle: 'Early Detection Rate',
                            icon: Icons.trending_up,
                            color: Color(0xFF3B82F6),
                            layoutScale: layoutScaleFactor,
                            fontScale: fontScaleFactor,
                            isVeryNarrowScreen: isVeryNarrowScreen,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),

                    Container(
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(16 * layoutScaleFactor),
                        border: Border.all(
                          color: Color(0xFF059669).withAlpha((0.2 * 255).round()),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF059669).withAlpha((0.1 * 255).round()),
                            blurRadius: 15 * layoutScaleFactor,
                            offset: Offset(0, 5 * layoutScaleFactor),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Future of Senior Healthcare',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 20 : 24) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor),
                          Text(
                            'Health tracking during elder years transforms healthcare from reactive to proactive. By leveraging modern technology and personalized monitoring, seniors can maintain independence while ensuring optimal health outcomes.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: Color(0xFF4B5563),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    _buildFeatureSection(
                      title: 'Early Detection & Prevention',
                      content: 'Advanced monitoring systems can identify potential health issues before they become serious problems, enabling timely intervention and better outcomes.',
                      points: [
                        'Real-time vital sign monitoring with instant alerts',
                        'Pattern recognition for detecting health changes',
                        'Preventive care scheduling and reminders',
                        'Risk assessment based on historical data'
                      ],
                      icon: Icons.search,
                      accentColor: Color(0xFF3B82F6), // Blue theme
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    _buildFeatureSection(
                      title: 'Chronic Disease Management',
                      content: 'Comprehensive tools for managing ongoing health conditions with precision and care, ensuring stable health and preventing complications.',
                      points: [
                        'Medication adherence tracking and reminders',
                        'Blood pressure and glucose monitoring',
                        'Symptom tracking and trend analysis',
                        'Healthcare provider integration'
                      ],
                      icon: Icons.favorite,
                      accentColor: Color(0xFFEF4444), // Red theme
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    _buildFeatureSection(
                      title: 'Technology Integration',
                      content: 'Seamless integration of wearable devices, mobile apps, and healthcare systems for comprehensive health management.',
                      points: [
                        'Smartwatch and fitness tracker compatibility',
                        'Mobile app for easy health data access',
                        'Telehealth consultation integration',
                        'Emergency response system connectivity'
                      ],
                      icon: Icons.devices,
                      accentColor: Color(0xFF8B5CF6), // Purple theme
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    _buildHighlightBox(
                      title: 'Enhanced Independence',
                      content: 'Health tracking empowers seniors to take control of their well-being, make informed decisions, and maintain independence while staying connected to their healthcare team.',
                      backgroundColor: Color(0xFF059669),
                      textColor: Colors.white,
                      icon: Icons.accessibility_new,
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    SizedBox(height: 32),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF059669),
                            Color(0xFF10B981),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20 * layoutScaleFactor),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF059669).withAlpha((0.3 * 255).round()),
                            blurRadius: 20 * layoutScaleFactor,
                            offset: Offset(0, 8 * layoutScaleFactor),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(isVeryNarrowScreen ? 6 : 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withAlpha((0.2 * 255).round()),
                                  borderRadius: BorderRadius.circular(8 * layoutScaleFactor),
                                ),
                                child: Icon(
                                  Icons.lightbulb,
                                  color: Colors.white,
                                  size: (isVeryNarrowScreen ? 20 : 24) * layoutScaleFactor,
                                ),
                              ),
                              SizedBox(width: 12 * layoutScaleFactor),
                                  Text(
                                  'Key Takeaways',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 18 : 22) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 16 : 20) * layoutScaleFactor),
                          _buildTakeawayPoint('Health tracking transforms reactive care into proactive wellness management', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Technology enables seniors to maintain independence with confidence', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Early detection significantly improves treatment outcomes', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Comprehensive monitoring provides peace of mind for families', isVeryNarrowScreen: isVeryNarrowScreen),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                     Container(
                      width:double.infinity,
                      padding:EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        children: [
                          Icon(
                          Icons.health_and_safety,
                          color: Color(0xFF059669),
                          size: (isVeryNarrowScreen ? 40 : 48) * layoutScaleFactor,
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor),
                          Text(
                            'Start your Heath Journey?',
                            style:GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 20 : 24) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                            textAlign: TextAlign.center,
                            ),
                          SizedBox(height: (isVeryNarrowScreen ? 6 : 8) * layoutScaleFactor),
                          Text(
                            'Speak with our healthcare specialists to begin your personalized health tracking and care plan.',
                            style:GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: Color(0xFF4B5563),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 18 : 24) * layoutScaleFactor),
                          FFButtonWidget(
                            onPressed: () async{
                              try{
                                logFirebaseEvent('Healthcare_BLOG_Contact_BTN_ON_TAP');}
                              catch (e) {
                                print('Firebase logging error: $e');
                              }
                              await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                            },
                            text:'Healthcare Consultation',
                            icon: Icon(
                              FontAwesomeIcons.whatsapp,
                              color:Colors.white,
                              size:20.0,
                            ),
                            options:FFButtonOptions(
                              width: double.infinity,
                              height: (isVeryNarrowScreen ? 50.0 : 54.0) * layoutScaleFactor,
                              padding: EdgeInsets.symmetric(
                                horizontal: (isVeryNarrowScreen ? 20.0 : 24.0) * layoutScaleFactor, 
                                vertical: 0.0,
                              ),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, (isVeryNarrowScreen ? 6.0 : 8.0) * layoutScaleFactor, 0.0),
                              color: Color(0xFF059669),
                              textStyle: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 16 : 18) * fontScaleFactor,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.0,
                              ),
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(28.0 * layoutScaleFactor),
                              borderSide:BorderSide.none
                            ),
                          ),
                        ]
                      ),
                    )
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

  Widget _buildTakeawayPoint(String text, {required bool isVeryNarrowScreen}) {
    return Container(
      margin: EdgeInsets.only(bottom: isVeryNarrowScreen ? 10 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 6, 
              right: isVeryNarrowScreen ? 10 : 12,
            ),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: isVeryNarrowScreen ? 14 : 16,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
