import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emergency_blog_model.dart';
export 'emergency_blog_model.dart';

class EmergencyBlogWidget extends StatefulWidget {
  const EmergencyBlogWidget({super.key});

  static String routeName = 'EmergencyBlog';
  static String routePath = 'Emergencyblog';

  @override
  State<EmergencyBlogWidget> createState() => _EmergencyBlogWidgetState();
}

class _EmergencyBlogWidgetState extends State<EmergencyBlogWidget> {
  late EmergencyBlogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergencyBlogModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EmergencyBlog'});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildEmergencyStepCard({
    required String stepNumber,
    required String title,
    required String description,
    required IconData icon,
    bool isUrgent = false,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing for Galaxy Fold optimization
    final double basePadding = isVeryNarrowScreen ? 16.0 : 20.0;
    final double baseCircleSize = isVeryNarrowScreen ? 40.0 : 50.0;
    final double baseSpacing = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 15.0 : 16.0;
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 13.0 : 14.0;
    final double baseStepNumberFontSize = isVeryNarrowScreen ? 14.0 : 16.0;
    final double baseIconSize = isVeryNarrowScreen ? 18.0 : 20.0;

    return Container(
      margin: EdgeInsets.only(bottom: baseSpacing * layoutScale),
      padding: EdgeInsets.all(basePadding * layoutScale),
      decoration: BoxDecoration(
        color: isUrgent ? Color(0xFFFEF2F2) : Colors.white,
        borderRadius: BorderRadius.circular(16 * layoutScale),
        border: Border.all(
          color: isUrgent ? Color(0xFFDC2626) : Color(0xFFE5E7EB),
          width: isUrgent ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).round()),
            blurRadius: 10 * layoutScale,
            offset: Offset(0, 4 * layoutScale),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: baseCircleSize * layoutScale,
            height: baseCircleSize * layoutScale,
            decoration: BoxDecoration(
              color: isUrgent ? Color(0xFFDC2626) : Color(0xFF3B82F6),
              borderRadius: BorderRadius.circular((baseCircleSize / 2) * layoutScale),
            ),
            child: Center(
              child: Text(
                stepNumber,
                style: GoogleFonts.inter(
                  fontSize: baseStepNumberFontSize * fontScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: (isVeryNarrowScreen ? 12 : 16) * layoutScale),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: isUrgent ? Color(0xFFDC2626) : Color(0xFF374151),
                      size: baseIconSize * layoutScale,
                    ),
                    SizedBox(width: 8 * layoutScale),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: baseTitleFontSize * fontScale,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8 * layoutScale),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: baseDescriptionFontSize * fontScale,
                    color: Color(0xFF4B5563),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String description,
    required List<String> features,
    required IconData icon,
    required Color primaryColor,
    required Color backgroundColor,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing for Galaxy Fold optimization
    final double basePadding = isVeryNarrowScreen ? 18.0 : 24.0;
    final double baseMargin = isVeryNarrowScreen ? 16.0 : 20.0;
    final double baseIconPadding = isVeryNarrowScreen ? 10.0 : 12.0;
    final double baseIconSize = isVeryNarrowScreen ? 20.0 : 24.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 16.0 : 18.0;
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 14.0 : 15.0;
    final double baseFeatureFontSize = isVeryNarrowScreen ? 13.0 : 14.0;
    final double baseSpacing = isVeryNarrowScreen ? 12.0 : 16.0;

    return Container(
      margin: EdgeInsets.only(bottom: baseMargin * layoutScale),
      padding: EdgeInsets.all(basePadding * layoutScale),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16 * layoutScale),
        border: Border.all(
          color: primaryColor.withAlpha((0.2 * 255).round()),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(baseIconPadding * layoutScale),
                decoration: BoxDecoration(
                  color: primaryColor.withAlpha((0.1 * 255).round()),
                  borderRadius: BorderRadius.circular(12 * layoutScale),
                ),
                child: Icon(
                  icon,
                  color: primaryColor,
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
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: baseSpacing * layoutScale),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: baseDescriptionFontSize * fontScale,
              color: Color(0xFF4B5563),
              height: 1.4,
            ),
            maxLines: isVeryNarrowScreen ? 4 : 3, // Allow more lines on narrow screens
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: baseSpacing * layoutScale),
          ...features.map((feature) => Container(
            margin: EdgeInsets.only(bottom: (isVeryNarrowScreen ? 6 : 8) * layoutScale),
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
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    feature,
                    style: GoogleFonts.inter(
                      fontSize: baseFeatureFontSize * fontScale,
                      color: Color(0xFF374151),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  // OPTIMIZED WIDGET FOR GALAXY FOLD AND ALL DEVICES
  Widget _buildQuickStatCard({
    required String value,
    required String label,
    required IconData icon,
    required Color color,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing based on screen type
    final double baseLabelFontSize = isVeryNarrowScreen ? 10.0 : 11.0;
    final double baseValueFontSize = isVeryNarrowScreen ? 18.0 : 22.0;
    final double baseIconSize = isVeryNarrowScreen ? 24.0 : 32.0;
    final double baseVerticalPadding = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseHorizontalPadding = isVeryNarrowScreen ? 4.0 : 8.0;
    final double baseBorderRadius = isVeryNarrowScreen ? 12.0 : 16.0;
    
    // Calculate label container height dynamically
    final double labelContainerHeight = (baseLabelFontSize * fontScale * 1.4 * 2) + 6;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: baseVerticalPadding * layoutScale, 
          horizontal: baseHorizontalPadding * layoutScale,
        ),
        decoration: BoxDecoration(
          color: color.withAlpha((0.1 * 255).round()),
          borderRadius: BorderRadius.circular(baseBorderRadius * layoutScale),
          border: Border.all(
            color: color.withAlpha((0.2 * 255).round()),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: baseIconSize * layoutScale,
            ),
            SizedBox(height: (isVeryNarrowScreen ? 6 : 8) * layoutScale),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: baseValueFontSize * fontScale,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: (isVeryNarrowScreen ? 3 : 4) * layoutScale),
            // ENHANCED FIX FOR ALL SCREEN SIZES
            Container(
              height: labelContainerHeight,
              alignment: Alignment.topCenter,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: baseLabelFontSize * fontScale,
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
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
                        'assets/images/IMG_4787.JPG',
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
                              Colors.black.withAlpha((0.4 * 255).round()),
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
                      top: MediaQuery.of(context).padding.top + 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isVeryNarrowScreen ? 8 : 12, 
                          vertical: isVeryNarrowScreen ? 4 : 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFDC2626),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.emergency,
                              color: Colors.white,
                              size: isVeryNarrowScreen ? 14 : 16,
                            ),
                            SizedBox(width: isVeryNarrowScreen ? 3 : 4),
                            Text(
                              isVeryNarrowScreen ? '24/7' : '24/7 Available',
                              style: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 10 : 11) * fontScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
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
                              color: Color(0xFFDC2626),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Emergency Care',
                              style: GoogleFonts.inter(
                                fontSize: 13 * fontScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Rapid Response\nEmergency Services',
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
                                ? 'Emergency response for seniors with medical support and family coordination'
                                : 'Professional emergency response designed specifically for seniors with immediate medical support and family coordination',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 13 : 15) * fontScaleFactor,
                              color: Colors.white.withAlpha((0.9 * 255).round()),
                              height: 1.5,
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
                    // Quick Stats - Optimized for Galaxy Fold
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          _buildQuickStatCard(
                            value: '<3min',
                            label: 'Response Time',
                            icon: Icons.speed,
                            color: Color(0xFFDC2626),
                            layoutScale: layoutScaleFactor,
                            fontScale: fontScaleFactor,
                            isVeryNarrowScreen: isVeryNarrowScreen,
                          ),
                          SizedBox(width: (isVeryNarrowScreen ? 4 : 8) * layoutScaleFactor),
                          _buildQuickStatCard(
                            value: '24/7',
                            label: 'Availability',
                            icon: Icons.access_time,
                            color: Color(0xFF059669),
                            layoutScale: layoutScaleFactor,
                            fontScale: fontScaleFactor,
                            isVeryNarrowScreen: isVeryNarrowScreen,
                          ),
                          SizedBox(width: (isVeryNarrowScreen ? 4 : 8) * layoutScaleFactor),
                          _buildQuickStatCard(
                            value: '100%',
                            label: 'Coverage',
                            icon: Icons.shield,
                            color: Color(0xFF3B82F6),
                            layoutScale: layoutScaleFactor,
                            fontScale: fontScaleFactor,
                            isVeryNarrowScreen: isVeryNarrowScreen,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),

                    // Emergency Protocol Section
                    Container(
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.05 * 255).round()),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.emergency_outlined,
                                color: Color(0xFFDC2626),
                                size: (isVeryNarrowScreen ? 24 : 28) * layoutScaleFactor,
                              ),
                              SizedBox(width: 12 * layoutScaleFactor),
                              Expanded(
                                child: Text(
                                  'Emergency Response Protocol',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 20 : 22) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F2937),
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 16 : 20),
                          Text(
                            'Our comprehensive emergency response system is designed to provide immediate, professional assistance when seniors need it most.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 15) * fontScaleFactor,
                              color: Color(0xFF4B5563),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),

                    // Emergency Steps
                    _buildEmergencyStepCard(
                      stepNumber: '1',
                      title: 'Immediate Alert System',
                      description: 'Press emergency button or call our 24/7 helpline. Our system instantly identifies your location and medical profile.',
                      icon: Icons.notification_important,
                      isUrgent: true,
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),
                    _buildEmergencyStepCard(
                      stepNumber: '2',
                      title: 'Rapid Assessment',
                      description: 'Trained emergency coordinators assess the situation and dispatch appropriate medical response within minutes.',
                      icon: Icons.assessment,
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),
                    _buildEmergencyStepCard(
                      stepNumber: '3',
                      title: 'Medical Response',
                      description: 'Emergency medical professionals arrive with your complete medical history and provide immediate care.',
                      icon: Icons.local_hospital,
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),
                    _buildEmergencyStepCard(
                      stepNumber: '4',
                      title: 'Family Coordination',
                      description: 'Automatic notification to designated family members with real-time updates on situation and care provided.',
                      icon: Icons.family_restroom,
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    SizedBox(height: 32),

                    // Services Section
                    Text(
                      'Comprehensive Emergency Services',
                      style: GoogleFonts.inter(
                        fontSize: (isVeryNarrowScreen ? 22 : 26) * fontScaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: isVeryNarrowScreen ? 16 : 20),

                    _buildServiceCard(
                      title: '24/7 Emergency Helpline',
                      description: 'Round-the-clock emergency support with immediate response and medical coordination.',
                      features: [
                        'Instant connection to emergency coordinators',
                        'Multilingual support available',
                        'GPS tracking for rapid location identification',
                        'Integration with local emergency services'
                      ],
                      icon: Icons.support_agent,
                      primaryColor: Color(0xFFDC2626),
                      backgroundColor: Color(0xFFFEF2F2),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),
                    _buildServiceCard(
                      title: 'Medical Emergency Response',
                      description: 'Specialized medical teams trained in senior care emergency protocols.',
                      features: [
                        'Emergency doctors on standby',
                        'Paramedic support with advanced equipment',
                        'Senior-specific medical protocols',
                        'Direct hospital coordination and admission'
                      ],
                      icon: Icons.medical_services,
                      primaryColor: Color(0xFF059669),
                      backgroundColor: Color(0xFFF0FDF4),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),
                    _buildServiceCard(
                      title: 'Crisis Prevention & Management',
                      description: 'Proactive monitoring and prevention strategies to minimize emergency situations.',
                      features: [
                        'Health parameter monitoring and alerts',
                        'Medication management and reminders',
                        'Fall detection and prevention systems',
                        'Regular wellness check-ins and assessments'
                      ],
                      icon: Icons.shield,
                      primaryColor: Color(0xFF3B82F6),
                      backgroundColor: Color(0xFFF0F9FF),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    // Critical Information Alert
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      margin: EdgeInsets.symmetric(vertical: isVeryNarrowScreen ? 16 : 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFEF2F2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFDC2626),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.priority_high,
                                color: Color(0xFFDC2626),
                                size: isVeryNarrowScreen ? 24 : 28,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Critical Emergency Information',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 16 : 18) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFDC2626),
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor),
                          Text(
                            'For life-threatening emergencies, always call 911 first. Our emergency services complement but do not replace official emergency services. We provide specialized senior care coordination and family communication.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 15) * fontScaleFactor,
                              color: Color(0xFF7F1D1D),
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),
                    
                    // Key Takeaways Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFDC2626),
                            Color(0xFFEF4444),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFDC2626).withAlpha((0.3 * 255).round()),
                            blurRadius: 20,
                            offset: Offset(0, 8),
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.security,
                                  color: Colors.white,
                                  size: isVeryNarrowScreen ? 20 : 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Emergency Preparedness',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 18 : 20) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 16 : 20),
                          _buildTakeawayPoint('Every second counts - immediate response can save lives', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Professional coordination reduces emergency complications', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Family communication provides peace of mind during crises', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Prevention and monitoring minimize emergency situations', isVeryNarrowScreen: isVeryNarrowScreen),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    // Contact Us Button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.05 * 255).round()),
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.emergency,
                            color: Color(0xFFDC2626),
                            size: isVeryNarrowScreen ? 40 : 48,
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 12 : 16),
                          Text(
                            'Ready for Emergency Protection?',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 20 : 22) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 6 : 8),
                          Text(
                            'Connect with our emergency care specialists to set up your 24/7 protection plan.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 15) * fontScaleFactor,
                              color: Color(0xFF6B7280),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isVeryNarrowScreen ? 18 : 24),
                          FFButtonWidget(
                            onPressed: () async {
                              try {
                                logFirebaseEvent('EMERGENCY_BLOG_CONTACT_BTN_ON_TAP');
                              } catch (e) {
                                print('Firebase logging error: $e');
                              }
                              await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                            },
                            text: isVeryNarrowScreen ? 'Emergency Support' : 'Emergency Contact Support',
                            icon: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: (isVeryNarrowScreen ? 50.0 : 56.0) * layoutScaleFactor,
                              padding: EdgeInsets.symmetric(
                                horizontal: (isVeryNarrowScreen ? 20.0 : 24.0) * layoutScaleFactor,
                              ),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, (isVeryNarrowScreen ? 6.0 : 8.0) * layoutScaleFactor, 0.0),
                              color: Color(0xFFDC2626),
                              textStyle: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 15 : 17) * fontScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.0,
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

  // Optimized for Galaxy Fold and all devices
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
                fontSize: isVeryNarrowScreen ? 14 : 15,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}