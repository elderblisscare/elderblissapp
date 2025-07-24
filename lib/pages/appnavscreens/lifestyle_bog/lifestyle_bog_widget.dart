import '/components/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
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
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor.withOpacity(isEmphasized ? 0.3 : 0.2),
          width: isEmphasized ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isEmphasized ? 0.1 : 0.05),
            blurRadius: isEmphasized ? 15 : 10,
            offset: Offset(0, isEmphasized ? 8 : 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isEmphasized ? primaryColor.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: GoogleFonts.inter(
                          fontSize: 14,
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
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              children: activities.map((activity) => Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: primaryColor.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        activity,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            SizedBox(height: 12),
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
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Color(0xFF6B7280),
                height: 1.3,
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
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Wellness',
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
                              color: Color(0xFFEA580C),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                    'Lifestyle',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                color: Colors.white,
                                          ),
                                    ),
                                  ),
                          SizedBox(height: 12),
                                                    Text(
                            'Active Living &\nWellness Journey',
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
                            'Embrace an enriching lifestyle with activities, social connections, and wellness practices designed for senior vitality',
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
                                        // Wellness Metrics
                    Row(
                      children: [
                        _buildWellnessMetric(
                          value: '78%',
                          label: 'Happiness Boost',
                          description: 'Increased life satisfaction through active lifestyle',
                          icon: Icons.mood,
                          color: Color(0xFFEA580C),
                        ),
                        SizedBox(width: 12),
                        _buildWellnessMetric(
                          value: '65%',
                          label: 'Social Connections',
                          description: 'More meaningful relationships and community engagement',
                          icon: Icons.people,
                          color: Color(0xFF10B981),
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
                                Icons.favorite,
                                color: Color(0xFFEA580C),
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Enriching Senior Lifestyle',
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
                            'A fulfilling lifestyle in senior years encompasses physical wellness, social engagement, personal growth, and meaningful activities that bring joy and purpose to daily life.',
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

                    // Lifestyle Categories
                    Text(
                      'Wellness & Lifestyle Activities',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 20),

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
                    ),

                    // Lifestyle Benefits Highlight
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFEA580C).withOpacity(0.1),
                            Color(0xFFF97316).withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFEA580C).withOpacity(0.2),
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
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Life Enrichment Benefits',
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          LayoutBuilder( // Use LayoutBuilder to get constraints
                            builder: (context, constraints) {
                              // Calculate dynamic childAspectRatio based on available width
                              // This will give more height for text on smaller screens
                              double aspectRatio = (constraints.maxWidth - (12 * 3)) / 2 / 100; // Adjust 100 as needed
                              // You might need to fine-tune the 100 based on your desired height
                              if (constraints.maxWidth < 600) { // Example for smaller screens
                                aspectRatio = (constraints.maxWidth - (12 * 3)) / 2 / 120; // Increase height
                              }
                              // A more robust approach might involve fixed heights for items and using Wrap
                              // if exact two-column layout isn't critical on very small screens.
                              
                              return GridView.count(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: aspectRatio, // Dynamic aspect ratio
                                children: [
                                  _buildBenefitItem('Enhanced Mood', 'Positive outlook and emotional well-being', Icons.sentiment_very_satisfied),
                                  _buildBenefitItem('Improved Sleep', 'Better rest and sleep quality', Icons.bedtime),
                                  _buildBenefitItem('Stronger Immunity', 'Enhanced resistance to illness', Icons.shield),
                                  _buildBenefitItem('Cognitive Health', 'Maintained mental sharpness', Icons.memory),
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
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFEA580C),
                            Color(0xFFF97316),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFEA580C).withOpacity(0.3),
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
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                  size: 24,
                                          ),
                                    ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Lifestyle Enhancement Keys',
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
                          _buildTakeawayPoint('Active engagement in diverse activities promotes overall well-being'),
                          _buildTakeawayPoint('Social connections are essential for emotional and mental health'),
                          _buildTakeawayPoint('Continuous learning keeps the mind sharp and engaged'),
                          _buildTakeawayPoint('Creative expression brings joy and personal fulfillment'),
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

  Widget _buildBenefitItem(String title, String description, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFEA580C).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Color(0xFFEA580C),
            size: 20,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
            // Allow title to wrap if needed
            maxLines: 2, // Allow up to 2 lines
            overflow: TextOverflow.ellipsis, // Use ellipsis if still overflows
          ),
          SizedBox(height: 4),
          // Using Flexible instead of Expanded for better control in some cases
          Flexible( 
            child: Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Color(0xFF6B7280),
                height: 1.3,
              ),
              // Ensure text wraps and shows ellipsis if it exceeds available space
              maxLines: 3, // Allow more lines for the description
              overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
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