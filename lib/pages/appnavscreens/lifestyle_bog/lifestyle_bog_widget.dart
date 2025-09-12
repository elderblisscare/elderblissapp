import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lifestyle_bog_model.dart';
export 'lifestyle_bog_model.dart';

class LifestyleBogWidget extends StatefulWidget {
  const LifestyleBogWidget({super.key});

  static String routeName = 'LifestyleBog';
  static String routePath = 'LifestyleBlog';

  @override
  State<LifestyleBogWidget> createState() => _LifestyleBogWidgetState();
}

class _LifestyleBogWidgetState extends State<LifestyleBogWidget> {
  late LifestyleBogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LifestyleBogModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LifestyleBog'});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildLifestyleCard({
    required String title,
    required String description,
    required List<String> activities,
    required IconData icon,
    required Color primaryColor,
    required Color backgroundColor,
    bool isEmphasized = false,
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
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 13.0 : 14.0;
    final double baseActivityFontSize = isVeryNarrowScreen ? 14.0 : 15.0;
    final double baseSpacing = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseActivityPadding = isVeryNarrowScreen ? 14.0 : 16.0;
    final double baseActivityMargin = isVeryNarrowScreen ? 10.0 : 12.0;
    final double baseBorderRadius = isVeryNarrowScreen ? 12.0 : 16.0;

    return Container(
      margin: EdgeInsets.only(bottom: baseMargin * layoutScale),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(baseBorderRadius * layoutScale),
        border: Border.all(
          color: primaryColor.withAlpha((isEmphasized ? 0.3 * 255 : 0.2 * 255).round()),
          width: isEmphasized ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((isEmphasized ? 0.1 * 255 : 0.05 * 255).round()),
            blurRadius: (isEmphasized ? 15 : 10) * layoutScale,
            offset: Offset(0, (isEmphasized ? 8 : 4) * layoutScale),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(basePadding * layoutScale),
            decoration: BoxDecoration(
              color: isEmphasized ? primaryColor.withAlpha((0.1 * 255).round()) : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(baseBorderRadius * layoutScale),
                topRight: Radius.circular(baseBorderRadius * layoutScale),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(baseIconPadding * layoutScale),
                  decoration: BoxDecoration(
                    color: primaryColor.withAlpha((0.15 * 255).round()),
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
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                      SizedBox(height: 4 * layoutScale),
                      Text(
                        description,
                        style: GoogleFonts.inter(
                          fontSize: baseDescriptionFontSize * fontScale,
                          color: Color(0xFF6B7280),
                          height: 1.4,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Activities List
          Padding(
            padding: EdgeInsets.fromLTRB(
              basePadding * layoutScale,
              0,
              basePadding * layoutScale,
              basePadding * layoutScale,
            ),
            child: Column(
              children: activities.map((activity) => Container(
                margin: EdgeInsets.only(bottom: baseActivityMargin * layoutScale),
                padding: EdgeInsets.all(baseActivityPadding * layoutScale),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12 * layoutScale),
                  border: Border.all(
                    color: primaryColor.withAlpha((0.1 * 255).round()),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: (isVeryNarrowScreen ? 6 : 8) * layoutScale,
                      height: (isVeryNarrowScreen ? 6 : 8) * layoutScale,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: (isVeryNarrowScreen ? 10 : 12) * layoutScale),
                    Expanded(
                      child: Text(
                        activity,
                        style: GoogleFonts.inter(
                          fontSize: baseActivityFontSize * fontScale,
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

  Widget _buildWellnessMetric({
    required String value,
    required String label,
    required String description,
    required IconData icon,
    required Color color,
    required double layoutScale,
    required double fontScale,
    required bool isVeryNarrowScreen,
  }) {
    // Dynamic sizing for Galaxy Fold optimization
    final double basePadding = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseBorderRadius = isVeryNarrowScreen ? 12.0 : 16.0;
    final double baseIconSize = isVeryNarrowScreen ? 22.0 : 28.0;
    final double baseValueFontSize = isVeryNarrowScreen ? 20.0 : 24.0;
    final double baseLabelFontSize = isVeryNarrowScreen ? 12.0 : 14.0;
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 11.0 : 12.0;
    final double baseSpacing = isVeryNarrowScreen ? 8.0 : 12.0;
    final double baseSmallSpacing = isVeryNarrowScreen ? 3.0 : 4.0;
    final double baseMediumSpacing = isVeryNarrowScreen ? 6.0 : 8.0;

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
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            Icon(
              icon,
              color: color,
              size: baseIconSize * layoutScale,
            ),
            SizedBox(height: baseSpacing * layoutScale),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: baseValueFontSize * fontScale,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            SizedBox(height: baseSmallSpacing * layoutScale),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: baseLabelFontSize * fontScale,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: baseMediumSpacing * layoutScale),
            Text(
              description,
              style: GoogleFonts.inter(
                fontSize: baseDescriptionFontSize * fontScale,
                color: Color(0xFF6B7280),
                height: 1.3,
              ),
              maxLines: isVeryNarrowScreen ? 3 : 2,
              overflow: TextOverflow.ellipsis,
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
                        'assets/images/lifestyle.jpg',
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
                              Colors.black.withAlpha((0.3 * 255).round()),
                              Colors.black.withAlpha((0.7 * 255).round()),
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
                    // Wellness Badge
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFEA580C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.self_improvement,
                              color: Colors.white,
                              size: isVeryNarrowScreen ? 14 : 16,
                            ),
                            SizedBox(width: isVeryNarrowScreen ? 3 : 4),
                            Text(
                              isVeryNarrowScreen ? 'Well' : 'Wellness',
                              style: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 10 : 12) * fontScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
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
                              color: Color(0xFFEA580C),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                  'Lifestyle',
                              style: GoogleFonts.inter(
                                fontSize: (isVeryNarrowScreen ? 13 : 14) * fontScaleFactor,
                                      fontWeight: FontWeight.w600,
                                color: Colors.white,
                                    ),
                                  ),
                                ),
                          SizedBox(height: isVeryNarrowScreen ? 8 : 12),
                                      Text(
                            'Active Living &\nWellness Journey',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 24 : 28) * fontScaleFactor, // Apply responsive scaling, optimized size
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
                                ? 'Enriching lifestyle with activities, social connections, and wellness practices for senior vitality'
                                : 'Embrace an enriching lifestyle with activities, social connections, and wellness practices designed for senior vitality',
                            style: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 13 : 15) * fontScaleFactor, // Apply responsive scaling, reduced from 16 to 15
                              color: Colors.white.withAlpha((0.9 * 255).round()),
                              height: 1.4, // Slightly tighter line height
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
                    // Wellness Metrics - Optimized for Galaxy Fold
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          _buildWellnessMetric(
                            value: '78%',
                            label: 'Happiness Boost',
                            description: 'Increased life satisfaction through active lifestyle',
                            icon: Icons.mood,
                            color: Color(0xFFEA580C),
                            layoutScale: layoutScaleFactor,
                            fontScale: fontScaleFactor,
                            isVeryNarrowScreen: isVeryNarrowScreen,
                          ),
                          SizedBox(width: (isVeryNarrowScreen ? 8 : 12) * layoutScaleFactor),
                          _buildWellnessMetric(
                            value: '65%',
                            label: 'Social Connections',
                            description: 'More meaningful relationships and community engagement',
                            icon: Icons.people,
                            color: Color(0xFF10B981),
                            layoutScale: layoutScaleFactor,
                            fontScale: fontScaleFactor,
                            isVeryNarrowScreen: isVeryNarrowScreen,
                          ),
                        ],
                      ),
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
                            color: Colors.black.withAlpha((0.05 * 255).round()),
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
                                Icons.favorite,
                                color: Color(0xFFEA580C),
                                size: (isVeryNarrowScreen ? 24 : 28) * layoutScaleFactor,
                              ),
                              SizedBox(width: 12 * layoutScaleFactor),
                              Expanded(
                                child: Text(
                                  'Enriching Senior Lifestyle',
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
                            'A fulfilling lifestyle in senior years encompasses physical wellness, social engagement, personal growth, and meaningful activities that bring joy and purpose to daily life.',
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

                    // Lifestyle Categories
                    Text(
                      'Wellness & Lifestyle Activities',
                      style: GoogleFonts.inter(
                        fontSize: (isVeryNarrowScreen ? 22 : 28) * fontScaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: (isVeryNarrowScreen ? 16 : 20) * layoutScaleFactor),

                    _buildLifestyleCard(
                      title: 'Physical Wellness & Activity',
                      description: 'Maintaining physical health through gentle exercise and movement',
                      activities: [
                        'Daily walking routines and nature exploration',
                        'Chair yoga and gentle stretching exercises',
                        'Swimming and water aerobics programs',
                        'Gardening and outdoor activities',
                        'Balance and fall prevention exercises'
                      ],
                      icon: Icons.fitness_center,
                      primaryColor: Color(0xFFEA580C),
                      backgroundColor: Color(0xFFFFF7ED),
                      isEmphasized: true,
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                                ),

                    _buildLifestyleCard(
                      title: 'Social Engagement & Community',
                      description: 'Building connections and maintaining meaningful relationships',
                      activities: [
                        'Senior center activities and group gatherings',
                        'Book clubs and discussion groups',
                        'Volunteer work and community service',
                        'Intergenerational programs with youth',
                        'Cultural events and local excursions'
                      ],
                      icon: Icons.groups,
                      primaryColor: Color(0xFF10B981),
                      backgroundColor: Color(0xFFF0FDF4),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                                ),

                    _buildLifestyleCard(
                      title: 'Creative Expression & Hobbies',
                      description: 'Exploring creativity and pursuing personal interests',
                      activities: [
                        'Art classes and painting workshops',
                        'Music therapy and instrument learning',
                        'Photography and digital storytelling',
                        'Crafting and handwork projects',
                        'Writing memoirs and life stories'
                      ],
                      icon: Icons.palette,
                      primaryColor: Color(0xFF8B5CF6),
                      backgroundColor: Color(0xFFF5F3FF),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    _buildLifestyleCard(
                      title: 'Mental Stimulation & Learning',
                      description: 'Keeping the mind active through continuous learning',
                      activities: [
                        'Brain games and puzzle solving',
                        'Language learning and communication',
                        'Technology classes and digital literacy',
                        'History and cultural education programs',
                        'Memory exercises and cognitive training'
                      ],
                      icon: Icons.psychology,
                      primaryColor: Color(0xFF3B82F6),
                      backgroundColor: Color(0xFFF0F9FF),
                      layoutScale: layoutScaleFactor,
                      fontScale: fontScaleFactor,
                      isVeryNarrowScreen: isVeryNarrowScreen,
                    ),

                    // Lifestyle Benefits Highlight
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
                      margin: EdgeInsets.symmetric(vertical: (isVeryNarrowScreen ? 16 : 20) * layoutScaleFactor),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFEA580C).withAlpha((0.1 * 255).round()),
                            Color(0xFFF97316).withAlpha((0.1 * 255).round()),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16 * layoutScaleFactor),
                        border: Border.all(
                          color: Color(0xFFEA580C).withAlpha((0.2 * 255).round()),
                          width: 1,
                                ),
                              ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.celebration,
                                color: Color(0xFFEA580C),
                                size: (isVeryNarrowScreen ? 24 : 28) * layoutScaleFactor,
                              ),
                              SizedBox(width: 12 * layoutScaleFactor),
                              Expanded(
                                child: Text(
                                  'Life Enrichment Benefits',
                                  style: GoogleFonts.inter(
                                    fontSize: (isVeryNarrowScreen ? 18 : 22) * fontScaleFactor,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F2937),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: (isVeryNarrowScreen ? 16 : 20) * layoutScaleFactor),
                          // FIXED: Proper height calculation to ensure text visibility on all devices
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final itemWidth = (constraints.maxWidth - (isVeryNarrowScreen ? 8 : 12)) / 2;
                              // FIXED: Increased height for normal screens to accommodate content properly
                              final double itemHeight = isVeryNarrowScreen ? 120.0 : 165.0; // Increased from 140.0 to 165.0
                              final double aspectRatio = itemWidth / itemHeight;
                              
                              return GridView.count(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: (isVeryNarrowScreen ? 8 : 12) * layoutScaleFactor,
                                mainAxisSpacing: (isVeryNarrowScreen ? 8 : 12) * layoutScaleFactor,
                                childAspectRatio: aspectRatio,
                                children: [
                                  _buildBenefitItem('Enhanced Mood', 'Positive outlook and well-being', Icons.sentiment_very_satisfied, isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
                                  _buildBenefitItem('Improved Sleep', 'Better rest and sleep quality', Icons.bedtime, isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
                                  _buildBenefitItem('Stronger Immunity', 'Enhanced resistance to illness', Icons.shield, isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
                                  _buildBenefitItem('Cognitive Health', 'Maintained mental sharpness', Icons.memory, isVeryNarrowScreen: isVeryNarrowScreen, layoutScale: layoutScaleFactor, fontScale: fontScaleFactor),
                                ],
                              );
                            }
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
                            Color(0xFFEA580C),
                            Color(0xFFF97316),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20 * layoutScaleFactor),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFEA580C).withAlpha((0.3 * 255).round()),
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
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                  size: (isVeryNarrowScreen ? 20 : 24) * layoutScaleFactor,
                                        ),
                                      ),
                              SizedBox(width: 12 * layoutScaleFactor),
                              Expanded(
                                child: Text(
                                  'Lifestyle Enhancement Keys',
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
                          _buildTakeawayPoint('Active engagement in diverse activities promotes overall well-being', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Social connections are essential for emotional and mental health', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Continuous learning keeps the mind sharp and engaged', isVeryNarrowScreen: isVeryNarrowScreen),
                          _buildTakeawayPoint('Creative expression brings joy and personal fulfillment', isVeryNarrowScreen: isVeryNarrowScreen),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    //Contact Us Button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isVeryNarrowScreen ? 18 : 24),
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
                      child:Column(children: [
                        Icon(
                          Icons.self_improvement,
                          color: Color(0xFFEA580C),
                          size: (isVeryNarrowScreen ? 40 : 48) * layoutScaleFactor,
                        ),
                        SizedBox(height: (isVeryNarrowScreen ? 12 : 16) * layoutScaleFactor),
                        Text(
                          'Enhance Your Lifestyle?',
                          style: GoogleFonts.inter(
                            fontSize: (isVeryNarrowScreen ? 20 : 24) * fontScaleFactor,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: (isVeryNarrowScreen ? 6 : 8) * layoutScaleFactor),
                        Text(
                          'Connect with our lifestyle coordinators to explore enriching activities and wellness programs.',
                          style: GoogleFonts.inter(
                            fontSize: (isVeryNarrowScreen ? 14 : 16) * fontScaleFactor,
                            color: Color(0xFF6B7280),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        SizedBox(height: (isVeryNarrowScreen ? 18 : 24) * layoutScaleFactor),
                        FFButtonWidget(
                          onPressed: () async{
                           try{  
                             logFirebaseEvent('LIFESTYLE_BOG_PAGE_CONTACT_US_BTN_ON_TAP');
                           }catch (e) {
                             print('Firebase logging Error: $e');
                           }
                           await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                          },
                          text:'Lifestyle Support Chat',
                          icon: Icon(
                          FontAwesomeIcons.whatsapp,
                            color:Colors.white,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: (isVeryNarrowScreen ? 50.0 : 56.0) * layoutScaleFactor,
                            padding: EdgeInsets.symmetric(
                              horizontal: (isVeryNarrowScreen ? 20.0 : 24.0) * layoutScaleFactor, 
                              vertical: 0.0,
                            ),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, (isVeryNarrowScreen ? 6.0 : 8.0) * layoutScaleFactor, 0.0),
                            color: Color(0xFFEA580C),
                            textStyle: GoogleFonts.inter(
                              fontSize: (isVeryNarrowScreen ? 16 : 18) * fontScaleFactor,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.0,
                            ),
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(28.0 * layoutScaleFactor),
                            borderSide: BorderSide.none
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

  Widget _buildBenefitItem(String title, String description, IconData icon, {required bool isVeryNarrowScreen, required double layoutScale, required double fontScale}) {
    // Dynamic sizing for Galaxy Fold optimization and normal mobile devices
    final double basePadding = isVeryNarrowScreen ? 12.0 : 14.0; // Slightly reduced padding for normal screens
    final double baseBorderRadius = isVeryNarrowScreen ? 10.0 : 12.0;
    final double baseIconSize = isVeryNarrowScreen ? 16.0 : 20.0;
    final double baseTitleFontSize = isVeryNarrowScreen ? 12.0 : 13.0; // Slightly smaller for better fit
    final double baseDescriptionFontSize = isVeryNarrowScreen ? 11.0 : 11.5; // Slightly smaller for normal screens
    final double baseSpacing = isVeryNarrowScreen ? 6.0 : 7.0; // Optimized spacing
    final double baseSmallSpacing = isVeryNarrowScreen ? 3.0 : 4.0;

    return Container(
      padding: EdgeInsets.all(basePadding * layoutScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(baseBorderRadius * layoutScale),
        border: Border.all(
          color: Color(0xFFEA580C).withAlpha((0.1 * 255).round()),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Color(0xFFEA580C),
            size: baseIconSize * layoutScale,
          ),
          SizedBox(height: baseSpacing * layoutScale),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: baseTitleFontSize * fontScale,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
              height: 1.2, // Tighter line height for better space utilization
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: baseSmallSpacing * layoutScale),
          Expanded( // Changed from Flexible to Expanded for better space utilization
            child: Text(
              description,
              style: GoogleFonts.inter(
                fontSize: baseDescriptionFontSize * fontScale,
                color: Color(0xFF6B7280),
                height: 1.25, // Slightly tighter line height for better fitting
              ),
              maxLines: isVeryNarrowScreen ? 4 : 4, // Increased maxLines for normal screens
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
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
