import '/components/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
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
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isUrgent ? Color(0xFFFEF2F2) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUrgent ? Color(0xFFDC2626) : Color(0xFFE5E7EB),
          width: isUrgent ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isUrgent ? Color(0xFFDC2626) : Color(0xFF3B82F6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                stepNumber,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: isUrgent ? Color(0xFFDC2626) : Color(0xFF374151),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 15,
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
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: primaryColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
          SizedBox(height: 16),
          ...features.map((feature) => Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6, right: 12),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    feature,
                    style: GoogleFonts.inter(
                      fontSize: 15,
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

  Widget _buildQuickStatCard({
    required String value,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 32,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
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
                        'assets/images/IMG_4787.JPG',
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
                              Colors.black.withOpacity(0.4),
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
                    // Emergency Badge
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '24/7 Available',
                              style: GoogleFonts.inter(
                                fontSize: 12,
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
                              color: Color(0xFFDC2626),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Emergency Care',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                                  Text(
                            'Rapid Response\nEmergency Services',
                            style: GoogleFonts.inter(
                              fontSize: MediaQuery.of(context).size.width > 400 ? 32 : 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Professional emergency response designed specifically for seniors with immediate medical support and family coordination',
                            style: GoogleFonts.inter(
                              fontSize: 16,
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

              // Content Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                                        // Quick Stats
                    Row(
                      children: [
                        _buildQuickStatCard(
                          value: '<3min',
                          label: 'Response Time',
                          icon: Icons.speed,
                          color: Color(0xFFDC2626),
                        ),
                        SizedBox(width: 8),
                        _buildQuickStatCard(
                          value: '24/7',
                          label: 'Availability',
                          icon: Icons.access_time,
                          color: Color(0xFF059669),
                        ),
                        SizedBox(width: 8),
                        _buildQuickStatCard(
                          value: '100%',
                          label: 'Coverage',
                          icon: Icons.shield,
                          color: Color(0xFF3B82F6),
                        ),
                      ],
                    ),

                    SizedBox(height: 32),

                    // Emergency Protocol Section
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
                          Row(
                            children: [
                              Icon(
                                Icons.emergency_outlined,
                                color: Color(0xFFDC2626),
                                size: 28,
                              ),
                              SizedBox(width: 12),
                                      Expanded(
                                child: Text(
                                  'Emergency Response Protocol',
                                  style: GoogleFonts.inter(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F2937),
                                  ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                                      Text(
                            'Our comprehensive emergency response system is designed to provide immediate, professional assistance when seniors need it most.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Color(0xFF4B5563),
                              height: 1.5,
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
                    ),

                    _buildEmergencyStepCard(
                      stepNumber: '2',
                      title: 'Rapid Assessment',
                      description: 'Trained emergency coordinators assess the situation and dispatch appropriate medical response within minutes.',
                      icon: Icons.assessment,
                    ),

                    _buildEmergencyStepCard(
                      stepNumber: '3',
                      title: 'Medical Response',
                      description: 'Emergency medical professionals arrive with your complete medical history and provide immediate care.',
                      icon: Icons.local_hospital,
                    ),

                    _buildEmergencyStepCard(
                      stepNumber: '4',
                      title: 'Family Coordination',
                      description: 'Automatic notification to designated family members with real-time updates on situation and care provided.',
                      icon: Icons.family_restroom,
                    ),

                    SizedBox(height: 32),

                    // Services Section
                                      Text(
                      'Comprehensive Emergency Services',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 20),

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
                    ),

                    // Critical Information Alert
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24),
                      margin: EdgeInsets.symmetric(vertical: 20),
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
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Critical Emergency Information',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFDC2626),
                                  ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                                      Text(
                            'For life-threatening emergencies, always call 911 first. Our emergency services complement but do not replace official emergency services. We provide specialized senior care coordination and family communication.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Color(0xFF7F1D1D),
                              height: 1.5,
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
                      padding: EdgeInsets.all(24),
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
                            color: Color(0xFFDC2626).withOpacity(0.3),
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
                                  Icons.security,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Emergency Preparedness Takeaways',
                                  style: GoogleFonts.inter(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          _buildTakeawayPoint('Every second counts - immediate response can save lives'),
                          _buildTakeawayPoint('Professional coordination reduces emergency complications'),
                          _buildTakeawayPoint('Family communication provides peace of mind during crises'),
                          _buildTakeawayPoint('Prevention and monitoring minimize emergency situations'),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    // Contact Us Button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
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
                            size: 48,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Ready for Emergency Protection?',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Connect with our emergency care specialists to set up your 24/7 protection plan.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Color(0xFF6B7280),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24),
                          FFButtonWidget(
                            onPressed: () async {
                              try {
                                logFirebaseEvent('EMERGENCY_BLOG_CONTACT_BTN_ON_TAP');
                              } catch (e) {
                                print('Firebase logging error: $e');
                              }
                              await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                            },
                            text: 'Emergency Contact Support',
                            icon: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 56.0,
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                              color: Color(0xFFDC2626),
                              textStyle: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(28.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),
                  ],
                ),
                ),
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
