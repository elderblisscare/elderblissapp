
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
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
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16 * layoutScale),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16 * layoutScale),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 32 * layoutScale,
            ),
            SizedBox(height: 12 * layoutScale),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 22 * fontScale, // Reduced from 24 to 22
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            SizedBox(height: 4 * layoutScale),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 13 * fontScale, // Reduced from 14 to 13
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
              ),
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
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: accentColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: points.map((point) => Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 6, right: 12),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: GoogleFonts.inter(
                          fontSize: 15,
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
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
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
              Icon(
                icon,
                color: textColor,
                size: 28,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: textColor.withOpacity(0.9),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // --- RESPONSIVE SCALING LOGIC ---
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 375.0;

    // Get accessibility text scale factor and clamp it to prevent UI breakage
    final accessibilityTextScale = MediaQuery.textScalerOf(context).scale(1.0);
    final clampedTextScale = accessibilityTextScale.clamp(1.0, 1.3); // Max 130% for accessibility

    // Layout scale factor for padding and container sizes
    final double layoutScaleFactor = (screenWidth / baseWidth).clamp(1.0, 1.2);

    // Conservative font scale factor that considers accessibility settings
    final double fontScaleFactor = ((screenWidth / baseWidth) * clampedTextScale).clamp(1.0, 1.15);
    
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
              // Hero Section
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/WhatsApp_Image_2025-03-22_at_13.46.23_19615335.jpg',
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
                            size: 20,
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
                              color: Color(0xFF059669),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                    'Healthcare',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                color: Colors.white,
                                          ),
                                    ),
                                  ),
                          SizedBox(height: 12),
                                  Text(
                            'Smart Health Tracking\nfor Senior Care',
                            style: GoogleFonts.inter(
                              fontSize: 28 * fontScaleFactor, // Apply responsive scaling, optimized size
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                          SizedBox(height: 12),
                                  Text(
                            'Empowering seniors with technology-driven health monitoring for better well-being and peace of mind',
                            style: GoogleFonts.inter(
                              fontSize: 15 * fontScaleFactor, // Apply responsive scaling, reduced from 16 to 15
                              color: Colors.white.withOpacity(0.9),
                              height: 1.4, // Slightly tighter line height
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
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Statistics Section
                    Row(
                      children: [
                        _buildStatCard(
                          title: '24/7',
                          subtitle: 'Health Monitoring',
                          icon: Icons.health_and_safety,
                          color: Color(0xFF059669),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                        ),
                        SizedBox(width: 12 * layoutScaleFactor),
                        _buildStatCard(
                          title: '95%',
                          subtitle: 'Early Detection Rate',
                          icon: Icons.trending_up,
                          color: Color(0xFF3B82F6),
                          layoutScale: layoutScaleFactor,
                          fontScale: fontScaleFactor,
                        ),
                      ],
                    ),

                    SizedBox(height: 32),

                    // Introduction Section
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Future of Senior Healthcare',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Health tracking during elder years transforms healthcare from reactive to proactive. By leveraging modern technology and personalized monitoring, seniors can maintain independence while ensuring optimal health outcomes.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Color(0xFF4B5563),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),

                    // Feature Sections
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
                      accentColor: Color(0xFF3B82F6),
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
                      accentColor: Color(0xFFEF4444),
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
                      accentColor: Color(0xFF8B5CF6),
                    ),

                    // Highlight Box
                    _buildHighlightBox(
                      title: 'Enhanced Independence',
                      content: 'Health tracking empowers seniors to take control of their well-being, make informed decisions, and maintain independence while staying connected to their healthcare team.',
                      backgroundColor: Color(0xFF059669),
                      textColor: Colors.white,
                      icon: Icons.accessibility_new,
                    ),

                    SizedBox(height: 32),

                    // Key Takeaways Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF059669),
                            Color(0xFF10B981),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF059669).withOpacity(0.3),
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
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.lightbulb,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                                  Text(
                                'Key Takeaways',
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          _buildTakeawayPoint('Health tracking transforms reactive care into proactive wellness management'),
                          _buildTakeawayPoint('Technology enables seniors to maintain independence with confidence'),
                          _buildTakeawayPoint('Early detection significantly improves treatment outcomes'),
                          _buildTakeawayPoint('Comprehensive monitoring provides peace of mind for families'),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                     //Contact Us Button
                    Container(
                      width:double.infinity,
                      padding:EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                          Icons.health_and_safety,
                          color: Color(0xFF059669),
                          size:48,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Start your Heath Journey?',
                            style:GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                            textAlign: TextAlign.center,
                            ),
                          SizedBox(height: 8),
                          Text(
                            'Speak with our healthcare specialists to begin your personalized health tracking and care plan.',
                            style:GoogleFonts.inter(
                              fontSize: 16,
                              color: Color(0xFF4B5563),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24),
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
                              Icons.chat_bubble_outline,
                              color:Colors.white,
                              size:20.0,
                            ),
                            options:FFButtonOptions(
                              width: double.infinity,
                              height: 54.0,
                              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0,0.0, 8.0, 0.0),
                              color: Color(0xFF059669),
                              textStyle: GoogleFonts.inter(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.0,
                              ),
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(28.0),
                              borderSide:BorderSide.none
                            ),
                          ),
                        ]
                      ),
                    )
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

  Widget _buildTakeawayPoint(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6, right: 12),
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
                fontSize: 16,
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
