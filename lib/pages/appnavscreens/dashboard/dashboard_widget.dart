import 'package:google_fonts/google_fonts.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  static String routeName = 'Dashboard';
  static String routePath = 'splashcreenaAuthenticated/dashboard';

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;
  late PageController _testimonialController;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _imagesPreloaded = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Testimonials data - NEWLY UPDATED
  final List<Map<String, String>> testimonials = [
    {
      'text': 'When my mother needed a doctor late at night, ElderBliss Care came through without delay. The doctor arrived quickly, was calm and reassuring, and took great care of her. I truly appreciate their dependable service during such a tense moment.',
      'name': 'Antionette Martin',
      'role': 'Jungpura, South Delhi • Doctor Visit'
    },
    {
      'text': 'The nursing support from ElderBliss has been excellent. The nurse is not only skilled but also kind and respectful. It’s reassuring to have someone so dependable looking after my health at home.',
      'name': 'V C Abraham',
      'role': 'Kalkaji, South Delhi • Nursing at home'
    },
    {
      'text': 'We needed urgent help for my father late at night, and ElderBliss Care arranged an attendant within hours. The caregiver was calm, skilled, and handled everything with great care. Truly grateful for their prompt and reliable support during a critical time.',
      'name': 'Geetanjali Shabi',
      'role': 'Faridabad • Caregiver Services (Attendant)'
    },
    {
      'text': 'ElderBliss Care truly came through when my father needed medical attention early in the morning. They quickly arranged a doctor visit and diagnostics at home, making the whole process smooth and stress-free. Their prompt and caring service made all the difference.',
      'name': 'Nitish Arun',
      'role': 'Munirka, Delhi • Emergency Doctor Visit'
    },
    {
      'text': 'ElderBlissCare has been a great support for us. The attendant assigned to my mother is caring, patient and treats her like family. We feel so much more at peace knowing Mom’s in good hands.',
      'name': 'Aditya Mota',
      'role': 'Greater Noida • Caregiver Services (Attendant)'
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());
    _testimonialController = PageController();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});

    // Start fade animation
    _fadeController.forward();

    // Auto-scroll testimonials
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_testimonialController.hasClients) {
        int nextPage = (_testimonialController.page?.round() ?? 0) + 1;
        if (nextPage >= testimonials.length) nextPage = 0;
        _testimonialController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASHBOARD_PAGE_Dashboard_ON_INIT_STATE');
      logFirebaseEvent('Dashboard_backend_call');
      _model.userdata =
          await UsersRecord.getDocumentOnce(currentUserReference!);
      logFirebaseEvent('Dashboard_update_app_state');
      FFAppState().name = 'userdata.name';
      FFAppState().phonenumber = 'userdata.phone_number';
      safeSetState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload images after dependencies are available to avoid inherited widget errors
    if (!_imagesPreloaded) {
      _preloadImagesImmediate();
      _imagesPreloaded = true;
    }
  }

  void _preloadImagesImmediate() {
    // Preload all service card images immediately to eliminate loading lag
    final imageList = [
      'assets/images/IMG_4787.JPG',
      'assets/images/WhatsApp_Image_2025-03-22_at_13.46.23_19615335.jpg',
      'assets/images/IMG_4796.JPG',
      'assets/images/lifestyle.jpg', // Updated to .jpg
    ];

    for (String imagePath in imageList) {
      precacheImage(AssetImage(imagePath), context);
    }
  }

  @override
  void dispose() {
    _model.dispose();
    _testimonialController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Widget _buildServiceCard({
    required String title,
    required String image,
    required VoidCallback onTap,
    required Color primaryColor,
    required Color secondaryColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor.withOpacity(0.9),
                  secondaryColor.withOpacity(0.8),
                ],
              ),
            ),
            child: Stack(
              children: [
                // Background Image (optimized and preloaded)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor.withOpacity(0.3),
                          ),
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.white.withOpacity(0.7),
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Gradient Overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                // Content
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Explore →',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(Map<String, String> testimonial) {
    return Container(
      // Adjusted padding and margin for better fit
      margin: EdgeInsets.symmetric(horizontal: 12), // Slightly more horizontal margin
      padding: EdgeInsets.fromLTRB(20, 20, 20, 16), // Top/bottom slightly less, sides for content
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // Added padding for the stars to align with text
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star_rounded, // Using filled star for consistent look
                color: Color(0xFFFFD700), // Gold color for stars
                size: 20,
              ),
            ),
          ),
          SizedBox(height: 12), // Reduced spacing slightly
          Expanded( // Use Expanded to allow text to take available space
            child: SingleChildScrollView( // Allow text to scroll if it's very long
              child: Text(
                '"${testimonial['text']}"',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xFF374151),
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
                overflow: TextOverflow.fade, // Fade out long text instead of ellipsis
              ),
            ),
          ),
          SizedBox(height: 12), // Reduced spacing slightly
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                child: Icon(
                  Icons.person,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial['name']!,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                      overflow: TextOverflow.ellipsis, // Ensure name fits
                      maxLines: 1,
                    ),
                    Text(
                      testimonial['role']!,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                      overflow: TextOverflow.ellipsis, // Ensure role fits
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8FAFC),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header Section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24, 20, 24, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Row with Image and Text
                          IntrinsicHeight( // Ensures children within this row have the same height
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // NEWLY ADDED IMAGE CONTAINER (for favicon.png)
                                // This container wraps the image to control its padding and potentially its size.
                                Container(
                                  padding: EdgeInsets.only(right: 11),
                                  child: Container( // This new container will provide the circular white background
                                    width: 45, // Set a fixed width for the circular container
                                    height: 45, // Set a fixed height for the circular container (should match width for a perfect circle)
                                    decoration: BoxDecoration(
                                      color: Colors.white, // White background
                                      shape: BoxShape.circle, // Make it circular
                                      boxShadow: [ // Optional: Add a subtle shadow for depth
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center, // Center the image inside the circle
                                    child: ClipOval( // Clip the image to an oval (which will be a circle due to the parent container's shape)
                                      child: Image.asset(
                                        'assets/images/favicon.png',
                                        fit: BoxFit.contain, // Keep fit.contain to scale the image within the circle
                                        height: 35, // Adjust this height to control the size of the image *inside* the circle
                                        width: 35, // Adjust this width
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(
                                            Icons.error,
                                            color: Colors.grey, // Changed color for error icon on white background
                                            size: 30, // Adjusted size
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded( // Existing Expanded for text content (takes remaining space)
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ElderBlissCare',
                                        style: GoogleFonts.inter(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Welcome back, ',
                                              style: GoogleFonts.inter(
                                                fontSize: 16,
                                                color: Colors.white.withOpacity(0.9),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: currentUserDisplayName.isNotEmpty
                                                  ? currentUserDisplayName
                                                  : 'User',
                                              style: GoogleFonts.inter(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Existing Help Button Container (on the right side)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      logFirebaseEvent('DASHBOARD_PAGE_HELP_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');
                                      context.pushNamed(ContactusWidget.routeName);
                                    },
                                    icon: Icon(
                                      Icons.help_outline,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Panic Button Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * 0.015,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 60,
                        maxHeight: 80,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFDC2626), Color(0xFFEF4444)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFDC2626).withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent('DASHBOARD_PAGE_PANIC_BUTTON_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');
                            context.pushNamed(PanicScreenWidget.routeName);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final screenWidth = MediaQuery.of(context).size.width;
                                final isSmallScreen = screenWidth < 400;
                                final isMediumScreen = screenWidth < 600;

                                // Responsive font sizes
                                final titleFontSize = isSmallScreen ? 16.0 : isMediumScreen ? 17.0 : 18.0;
                                final subtitleFontSize = isSmallScreen ? 12.0 : isMediumScreen ? 13.0 : 14.0;
                                final iconSize = isSmallScreen ? 20.0 : isMediumScreen ? 22.0 : 24.0;
                                final containerSize = isSmallScreen ? 28.0 : isMediumScreen ? 30.0 : 32.0;
                                final spacing = isSmallScreen ? 12.0 : 16.0;

                                return Row(
                                  children: [
                                    // Emergency Icon Container
                                    Container(
                                      padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(isSmallScreen ? 14 : 16),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 12,
                                            offset: Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        width: containerSize * 1.8,
                                        height: containerSize * 1.8,
                                        child: Image.asset(
                                          'assets/images/PanicButton.png',
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error, stackTrace) {
                                            // Fallback to icon if image not found
                                            return Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFDC2626).withOpacity(0.1),
                                              ),
                                              child: Icon(
                                                Icons.warning,
                                                color: Color(0xFFDC2626),
                                                size: iconSize,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: spacing),

                                    // Text Content - Flexible to prevent overflow
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Panic Button',
                                            style: GoogleFonts.inter(
                                              fontSize: titleFontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              letterSpacing: 0.5,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            isSmallScreen
                                                ? 'Tap for emergency help'
                                                : 'Tap for immediate emergency help',
                                            style: GoogleFonts.inter(
                                              fontSize: subtitleFontSize,
                                              color: Colors.white.withOpacity(0.9),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: spacing),

                                    // Arrow Icon
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: isSmallScreen ? 16 : 18,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Services Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 24,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Our Care Services',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Comprehensive care solutions tailored for your loved ones',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 24),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85,
                          children: [
                            _buildServiceCard(
                              title: 'Healthcare',
                              image: 'assets/images/WhatsApp_Image_2025-03-22_at_13.46.23_19615335.jpg',
                              primaryColor: Color(0xFF059669),
                              secondaryColor: Color(0xFF10B981),
                              onTap: () async {
                                logFirebaseEvent('DASHBOARD_PAGE_HEALTHCARE_CARD_ON_TAP');
                                logFirebaseEvent('Card_navigate_to');
                                context.pushNamed(HealthcareblogWidget.routeName);
                              },
                            ),
                            _buildServiceCard(
                              title: 'Emergency',
                              image: 'assets/images/IMG_4787.JPG',
                              primaryColor: Color(0xFFDC2626),
                              secondaryColor: Color(0xFFEF4444),
                              onTap: () async {
                                logFirebaseEvent('DASHBOARD_PAGE_EMERGENCY_CARD_ON_TAP');
                                logFirebaseEvent('Card_navigate_to');
                                context.pushNamed(EmergencyBlogWidget.routeName);
                              },
                            ),
                            _buildServiceCard(
                              title: 'Convenience',
                              image: 'assets/images/IMG_4796.JPG',
                              primaryColor: Color(0xFF7C3AED),
                              secondaryColor: Color(0xFF8B5CF6),
                              onTap: () async {
                                logFirebaseEvent('DASHBOARD_PAGE_CONVENIENCE_CARD_ON_TAP');
                                logFirebaseEvent('Card_navigate_to');
                                context.pushNamed(ConvenienceBlogWidget.routeName);
                              },
                            ),
                            _buildServiceCard(
                              title: 'Lifestyle',
                              image: 'assets/images/lifestyle.jpg', // Updated to .jpg
                              primaryColor: Color(0xFFEA580C),
                              secondaryColor: Color(0xFFF97316),
                              onTap: () async {
                                logFirebaseEvent('DASHBOARD_PAGE_LIFESTYLE_CARD_ON_TAP');
                                logFirebaseEvent('Card_navigate_to');
                                context.pushNamed(LifestyleBogWidget.routeName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),

                  // Testimonials Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 32),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F5F9),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 4,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'What Families Say',
                                    style: GoogleFonts.inter(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1F2937),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Real experiences from families who trust us with their loved ones',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Color(0xFF6B7280),
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          height: 250, // Increased height to accommodate more text
                          child: PageView.builder(
                            controller: _testimonialController,
                            itemCount: testimonials.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: _buildTestimonialCard(testimonials[index]),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: testimonials.asMap().entries.map((entry) {
                            return Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}