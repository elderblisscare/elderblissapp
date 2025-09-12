import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'convenience_blog_model.dart';
export 'convenience_blog_model.dart';

class ConvenienceBlogWidget extends StatefulWidget {
  const ConvenienceBlogWidget({super.key});

  static String routeName = 'ConvenienceBlog';
  static String routePath = 'ConvenienceBlog';

  @override
  State<ConvenienceBlogWidget> createState() => _ConvenienceBlogWidgetState();
}

class _ConvenienceBlogWidgetState extends State<ConvenienceBlogWidget> {
  late ConvenienceBlogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConvenienceBlogModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConvenienceBlog'});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildConvenienceCard({
    required String title,
    required String description,
    required List<String> services,
    required IconData icon,
    required Color accentColor,
    bool isHighlighted = false,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing for Galaxy Fold optimization
    final double baseMargin = isVeryNarrowScreen ? 16.0 : 20.0;
    final double basePadding = isVeryNarrowScreen ? 18.0 : 24.0;
    final double baseIconPadding = isVeryNarrowScreen ? 10.0 : 12.0;
    final double baseIconSize = isVeryNarrowScreen ? 20.0 : 24.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 18.0 : 20.0;
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 14.0 : 16.0;
    final double baseServiceFontSize = isVeryNarrowScreen ? 13.0 : 14.0;
    final double baseSpacing = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseInnerPadding = isVeryNarrowScreen ? 14.0 : 16.0;
    final double baseServiceIconSize = isVeryNarrowScreen ? 14.0 : 16.0;
    final double baseBorderRadius = isVeryNarrowScreen ? 12.0 : 16.0;

    return Container(
      margin: EdgeInsets.only(bottom: baseMargin * layoutScale),
      padding: EdgeInsets.all(basePadding * layoutScale),
      decoration: BoxDecoration(
        color: isHighlighted ? accentColor.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(baseBorderRadius * layoutScale),
        border: Border.all(
          color: isHighlighted ? accentColor : Color(0xFFE5E7EB),
          width: isHighlighted ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10 * layoutScale,
            offset: Offset(0, 4 * layoutScale),
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
                  color: accentColor.withOpacity(0.1),
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
                  overflow: TextOverflow.visible,
                  softWrap: true,
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
              height: 1.5,
            ),
          ),
          SizedBox(height: baseSpacing * layoutScale),
          Container(
            padding: EdgeInsets.all(baseInnerPadding * layoutScale),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12 * layoutScale),
              border: Border.all(
                color: accentColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: services.map((service) => Container(
                margin: EdgeInsets.only(bottom: (isVeryNarrowScreen ? 6 : 8) * layoutScale),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: accentColor,
                      size: baseServiceIconSize * layoutScale,
                    ),
                    SizedBox(width: (isVeryNarrowScreen ? 6 : 8) * layoutScale),
                    Expanded(
                      child: Text(
                        service,
                        style: GoogleFonts.inter(
                          fontSize: baseServiceFontSize * fontScale,
                          color: Color(0xFF374151),
                          height: 1.4,
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

  Widget _buildBenefitHighlight({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing for Galaxy Fold optimization
    final double baseHeight = isVeryNarrowScreen ? 120.0 : 140.0;
    final double basePadding = isVeryNarrowScreen ? 12.0 : 14.0;
    final double baseBorderRadius = isVeryNarrowScreen ? 12.0 : 14.0;
    final double baseIconHeight = isVeryNarrowScreen ? 28.0 : 32.0;
    final double baseIconSize = isVeryNarrowScreen ? 22.0 : 26.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 12.0 : 14.0;
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 10.0 : 11.0;
    final double baseSpacing = isVeryNarrowScreen ? 8.0 : 10.0;
    final double baseSmallSpacing = isVeryNarrowScreen ? 4.0 : 6.0;

    return Container(
      height: baseHeight * layoutScale, // Fixed height for consistent card alignment
      padding: EdgeInsets.all(basePadding * layoutScale), // Slightly increased padding for better balance
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(baseBorderRadius * layoutScale), // Slightly increased border radius
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center align for better visual balance
        mainAxisAlignment: MainAxisAlignment.start, // Start from top but with consistent spacing
        children: [
          // Icon section - fixed space
          Container(
            height: baseIconHeight * layoutScale, // Fixed height for icon area
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: color,
              size: baseIconSize * layoutScale, // Optimized icon size
            ),
          ),
          SizedBox(height: baseSpacing * layoutScale), // Consistent spacing
          
          // Title section - flexible but controlled
          Expanded(
            flex: 2, // Give more space to title
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center, // Center align title
                style: GoogleFonts.inter(
                  fontSize: baseTitleFontSize * fontScale, // Slightly reduced for better fit
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                  height: 1.2, // Tight line height
                ),
                maxLines: 2, // Maximum 2 lines for title
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          
          SizedBox(height: baseSmallSpacing * layoutScale), // Small separator
          
          // Description section - flexible
          Expanded(
            flex: 3, // Give more space to description
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                description,
                textAlign: TextAlign.center, // Center align description
                style: GoogleFonts.inter(
                  fontSize: baseDescriptionFontSize * fontScale, // Optimized font size for better fit
                  color: Color(0xFF4B5563),
                  height: 1.3, // Controlled line height
                ),
                maxLines: isVeryNarrowScreen ? 5 : 4, // Allow more lines on narrow screens
                overflow: TextOverflow.ellipsis,
              ),
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
    
    // Calculate bottom navigation bar height to prevent content overlap
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
                    // Background Image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/IMG_4796.JPG',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Gradient Overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Back Button
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
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
                    // Content
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
                              color: Color(0xFF8B5CF6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                    'Convenience',
                              style: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 13 : 14) * fontScaleFactor,
                                            fontWeight: FontWeight.w600,
                                color: Colors.white,
                                          ),
                                    ),
                                  ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                                  Text(
                            'Daily Assistance &\nConvenience Services',
                            style: GoogleFonts.inter(
                              fontSize: isVeryNarrowScreen 
                                  ? 22 * fontScaleFactor
                                  : (MediaQuery.of(context).size.width > 400 ? 32 : 24) * fontScaleFactor,
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
                                ? 'Making everyday tasks easier with professional support services for senior independence'
                                : 'Making everyday tasks easier with professional support services tailored for senior independence',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 13 : 16) * fontScaleFactor,
                              color: Colors.white.withOpacity(0.9),
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
                    // Benefits Grid - Optimized for Galaxy Fold
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor, // Increased spacing for better visual separation
                      mainAxisSpacing: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor, // Increased spacing for better visual separation
                      childAspectRatio: isVeryNarrowScreen ? 0.8 : ((screenWidth > 400) ? 1.0 : 0.9), // Adjusted for fixed height cards
                      children: [
                        _buildBenefitHighlight(
                          title: 'Time Saving',
                          description: 'Focus on what matters most while we handle daily tasks',
                          icon: Icons.schedule,
                          color: Color(0xFF8B5CF6),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                        _buildBenefitHighlight(
                          title: 'Stress Relief',
                          description: 'Reduce anxiety about managing household responsibilities',
                          icon: Icons.spa,
                          color: Color(0xFF10B981),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                        _buildBenefitHighlight(
                          title: 'Independence',
                          description: 'Maintain autonomy with supportive assistance',
                          icon: Icons.accessibility_new,
                          color: Color(0xFF3B82F6),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                        _buildBenefitHighlight(
                          title: 'Safety',
                          description: 'Professional, trusted service providers',
                          icon: Icons.security,
                          color: Color(0xFFEF4444),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                          isVeryNarrowScreen: isVeryNarrowScreen,
                        ),
                      ],
                    ),

                    SizedBox(height: 32),

                    // Introduction
                    Container(
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16 * layoutScaleFactor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10 * layoutScaleFactor,
                            offset: Offset(0, 4 * layoutScaleFactor),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.support,
                                color: Color(0xFF8B5CF6),
                                size: (isVeryNarrowScreen ? 24 : 28) * layoutScaleFactor,
                              ),
                              SizedBox(width: 12 * layoutScaleFactor),
                              Expanded(
                                child: Text(
                                  'Comprehensive Convenience Services',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 20 : 24) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F2937),
                                  ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor),
                          Text(
                            'Our convenience services are designed to support seniors in maintaining their independence while ensuring all daily needs are met with professional care and attention.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: Color(0xFF4B5563),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),

                    // Service Categories
                    Text(
                      'Daily Assistance Categories',
                      style: GoogleFonts.inter(
                        fontSize: (isVeryNarrowScreen ? 22 : 28) * fontScaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: (isVeryNarrowScreen ? 16 : 20) * layoutScaleFactor),

                    _buildConvenienceCard(
                      title: 'Household Management',
                      description: 'Complete household support to maintain a clean, organized, and comfortable living environment.',
                      services: [
                        'Professional house cleaning services',
                        'Laundry and clothing care',
                        'Home organization and decluttering',
                        'Basic home maintenance coordination'
                      ],
                      icon: Icons.home_work,
                      accentColor: Color(0xFF8B5CF6),
                      isHighlighted: true,
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    _buildConvenienceCard(
                      title: 'Personal Errands & Shopping',
                      description: 'Essential errands and shopping services to ensure all personal needs are met conveniently.',
                      services: [
                        'Grocery shopping and delivery',
                        'Prescription pickup and delivery',
                        'Banking and postal services',
                        'Personal shopping assistance'
                      ],
                      icon: Icons.shopping_cart,
                      accentColor: Color(0xFF10B981),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    _buildConvenienceCard(
                      title: 'Transportation Services',
                      description: 'Safe, reliable transportation for medical appointments, social activities, and personal needs.',
                      services: [
                        'Medical appointment transportation',
                        'Social visit and activity transport',
                        'Shopping trip accompaniment',
                        'Airport and travel assistance'
                      ],
                      icon: Icons.directions_car,
                      accentColor: Color(0xFF3B82F6),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    _buildConvenienceCard(
                      title: 'Technology Support',
                      description: 'Assistance with technology and digital services to stay connected and informed.',
                      services: [
                        'Device setup and troubleshooting',
                        'Online service management',
                        'Digital communication assistance',
                        'Smart home device support'
                      ],
                      icon: Icons.devices,
                      accentColor: Color(0xFFF59E0B),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    // Process Flow
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24 * layoutScaleFactor), // Apply responsive padding
                      margin: EdgeInsets.symmetric(vertical: 20 * layoutScaleFactor), // Apply responsive margin
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF8B5CF6).withOpacity(0.1),
                            Color(0xFF3B82F6).withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFF8B5CF6).withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timeline,
                                color: Color(0xFF8B5CF6),
                                size: 28 * layoutScaleFactor, // Apply responsive scaling
                              ),
                              SizedBox(width: 12 * layoutScaleFactor), // Apply responsive spacing
                              Expanded( // Important: Prevent overflow by making text flexible
                                child: Text(
                                  'How Our Services Work',
                                  style: GoogleFonts.inter(
                                    fontSize: 20 * fontScaleFactor, // Apply responsive font scaling, reduced from 22 to 20
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F2937),
                                    height: 1.2, // Tighter line height for better control
                                  ),
                                  maxLines: 2, // Allow text to wrap to prevent overflow
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20 * layoutScaleFactor), // Apply responsive spacing
                          _buildProcessStep('1', 'Initial Consultation', 'We assess your specific needs and preferences', isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
                          _buildProcessStep('2', 'Service Planning', 'Create a customized service schedule that works for you', isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
                          _buildProcessStep('3', 'Professional Matching', 'Connect you with trusted, verified service providers', isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
                          _buildProcessStep('4', 'Ongoing Support', 'Regular check-ins and service quality monitoring', isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
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
                            Color(0xFF8B5CF6),
                            Color(0xFFA855F7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20 * layoutScaleFactor),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF8B5CF6).withOpacity(0.3),
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
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8 * layoutScaleFactor),
                                ),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: (isVeryNarrowScreen ? 20 : 24) * layoutScaleFactor,
                                ),
                              ),
                              SizedBox(width: 12 * layoutScaleFactor),
                              Expanded(
                                child: Text(
                                  'Convenience Service Benefits',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 18 : 22) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 16 : 20) * layoutScaleFactor),
                          _buildTakeawayPoint('Professional assistance enhances quality of life and independence', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Trusted service providers ensure safety and reliability', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Customized solutions adapt to individual needs and preferences', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Regular support reduces stress and promotes well-being', isVeryNarrowScreen: isVeryNarrowScreen),
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
                        borderRadius: BorderRadius.circular(20 * layoutScaleFactor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15 * layoutScaleFactor,
                            offset: Offset(0, 8 * layoutScaleFactor),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.support_agent,
                            color: Color(0xFF8B5CF6),
                            size: (isVeryNarrowScreen ? 40 : 48) * layoutScaleFactor,
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor),
                          Text(
                            'Need Convenience Services?',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 20 : 24) * fontScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 6 : 8) * layoutScaleFactor),
                          Text(
                            'Let our team help you with personalized convenience solutions for your daily needs.',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                              color: Color(0xFF6B7280),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 18 : 24) * layoutScaleFactor),
                          FFButtonWidget(
                            onPressed: () async {
                              try {
                                logFirebaseEvent('CONVENIENCE_BLOG_CONTACT_BTN_ON_TAP');
                              } catch (e) {
                                print('Firebase logging error: $e');
                              }
                              await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                            },
                            text: 'Get Convenience Support',
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
                              color: Color(0xFF8B5CF6),
                              textStyle: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 16 : 18) * fontScaleFactor,
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
              
              // Add sufficient bottom padding to prevent footer navigation overlap
              SizedBox(height: bottomNavHeight),
            ],
                                          ),
                                    ),
                                  ),
    );
  }

  Widget _buildProcessStep(String number, String title, String description, {required bool isVeryNarrowScreen, required double layoutScale, required double fontScale}) {
    // Dynamic sizing for Galaxy Fold optimization
    final double baseMargin = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseCircleSize = isVeryNarrowScreen ? 26.0 : 30.0;
    final double baseNumberFontSize = isVeryNarrowScreen ? 12.0 : 14.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 14.0 : 16.0;
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 13.0 : 14.0;
    final double baseSpacing = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseSmallSpacing = isVeryNarrowScreen ? 3.0 : 4.0;

    return Container(
      margin: EdgeInsets.only(bottom: baseMargin * layoutScale),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: baseCircleSize * layoutScale,
            height: baseCircleSize * layoutScale,
            decoration: BoxDecoration(
              color: Color(0xFF8B5CF6),
              borderRadius: BorderRadius.circular((baseCircleSize / 2) * layoutScale),
            ),
            child: Center(
                                    child: Text(
                number,
                style: GoogleFonts.inter(
                  fontSize: baseNumberFontSize * fontScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                                          ),
                                    ),
                                  ),
          ),
          SizedBox(width: baseSpacing * layoutScale),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: baseTitleFontSize * fontScale,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: baseSmallSpacing * layoutScale),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: baseDescriptionFontSize * fontScale,
                    color: Color(0xFF4B5563),
                    height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
