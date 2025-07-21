import '/components/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
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
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isHighlighted ? accentColor.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isHighlighted ? accentColor : Color(0xFFE5E7EB),
          width: isHighlighted ? 2 : 1,
        ),
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                  overflow: TextOverflow.visible,
                  softWrap: true,
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
          Container(
            padding: EdgeInsets.all(16),
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
              children: services.map((service) => Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: accentColor,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        service,
                        style: GoogleFonts.inter(
                          fontSize: 14,
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
  }) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xFF4B5563),
              height: 1.4,
            ),
          ),
        ],
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
                              color: Color(0xFF8B5CF6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                    'Convenience',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                color: Colors.white,
                                          ),
                                    ),
                                  ),
                          SizedBox(height: 12),
                                  Text(
                            'Daily Assistance &\nConvenience Services',
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
                            'Making everyday tasks easier with professional support services tailored for senior independence',
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
                    // Benefits Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: MediaQuery.of(context).size.width > 400 ? 1.1 : 1.0,
                      children: [
                        _buildBenefitHighlight(
                          title: 'Time Saving',
                          description: 'Focus on what matters most while we handle daily tasks',
                          icon: Icons.schedule,
                          color: Color(0xFF8B5CF6),
                        ),
                        _buildBenefitHighlight(
                          title: 'Stress Relief',
                          description: 'Reduce anxiety about managing household responsibilities',
                          icon: Icons.spa,
                          color: Color(0xFF10B981),
                        ),
                        _buildBenefitHighlight(
                          title: 'Independence',
                          description: 'Maintain autonomy with supportive assistance',
                          icon: Icons.accessibility_new,
                          color: Color(0xFF3B82F6),
                        ),
                        _buildBenefitHighlight(
                          title: 'Safety',
                          description: 'Professional, trusted service providers',
                          icon: Icons.security,
                          color: Color(0xFFEF4444),
                        ),
                      ],
                    ),

                    SizedBox(height: 32),

                    // Introduction
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
                                Icons.support,
                                color: Color(0xFF8B5CF6),
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Comprehensive Convenience Services',
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
                          SizedBox(height: 16),
                          Text(
                            'Our convenience services are designed to support seniors in maintaining their independence while ensuring all daily needs are met with professional care and attention.',
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

                    // Service Categories
                    Text(
                      'Daily Assistance Categories',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 20),

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
                    ),

                    // Process Flow
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24),
                      margin: EdgeInsets.symmetric(vertical: 20),
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
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'How Our Services Work',
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          _buildProcessStep('1', 'Initial Consultation', 'We assess your specific needs and preferences'),
                          _buildProcessStep('2', 'Service Planning', 'Create a customized service schedule that works for you'),
                          _buildProcessStep('3', 'Professional Matching', 'Connect you with trusted, verified service providers'),
                          _buildProcessStep('4', 'Ongoing Support', 'Regular check-ins and service quality monitoring'),
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
                            Color(0xFF8B5CF6),
                            Color(0xFFA855F7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF8B5CF6).withOpacity(0.3),
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
                                  Icons.star,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Convenience Service Benefits',
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
                          _buildTakeawayPoint('Professional assistance enhances quality of life and independence'),
                          _buildTakeawayPoint('Trusted service providers ensure safety and reliability'),
                          _buildTakeawayPoint('Customized solutions adapt to individual needs and preferences'),
                          _buildTakeawayPoint('Regular support reduces stress and promotes well-being'),
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

  Widget _buildProcessStep(String number, String title, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFF8B5CF6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                                    child: Text(
                number,
                style: GoogleFonts.inter(
                  fontSize: 14,
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
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
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
