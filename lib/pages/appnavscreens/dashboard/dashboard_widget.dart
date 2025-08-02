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

  // Testimonials data
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

    _fadeController.forward();

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
    if (!_imagesPreloaded) {
      _preloadImagesImmediate();
      _imagesPreloaded = true;
    }
  }

  void _preloadImagesImmediate() {
    final imageList = [
      'assets/images/IMG_4787.JPG',
      'assets/images/WhatsApp_Image_2025-03-22_at_13.46.23_19615335.jpg',
      'assets/images/IMG_4796.JPG',
      'assets/images/lifestyle.jpg',
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

  // UPDATED: Helper widget now accepts separate scale factors for layout and font.
  Widget _buildServiceCard({
    required String title,
    required String image,
    required VoidCallback onTap,
    required Color primaryColor,
    required Color secondaryColor,
    required double layoutScale,
    required double fontScale,
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
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(12 * layoutScale), // Use layout scale
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 17 * fontScale, // Use font scale
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
                              fontSize: 12 * fontScale, // Use font scale
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

  // UPDATED: Helper widget now accepts separate scale factors for layout and font.
  Widget _buildTestimonialCard(
      Map<String, String> testimonial, double layoutScale, double fontScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(18 * layoutScale), // Use layout scale
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
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star_rounded,
                color: Color(0xFFFFD700),
                size: 20 * layoutScale, // Use layout scale for icon
              ),
            ),
          ),
          SizedBox(height: 12 * layoutScale), // Use layout scale
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                '"${testimonial['text']}"',
                style: GoogleFonts.inter(
                  fontSize: 14 * fontScale, // Use font scale
                  color: Color(0xFF374151),
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          SizedBox(height: 12 * layoutScale), // Use layout scale
          Row(
            children: [
              CircleAvatar(
                radius: 20 * layoutScale, // Use layout scale
                backgroundColor: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                child: Icon(
                  Icons.person,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20 * layoutScale, // Use layout scale
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
                        fontSize: 14 * fontScale, // Use font scale
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      testimonial['role']!,
                      style: GoogleFonts.inter(
                        fontSize: 10 * fontScale, // Reduced from 12 to 10
                        color: Color(0xFF6B7280),
                      ),
                      overflow: TextOverflow.ellipsis,
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

    // --- UPDATED RESPONSIVE SCALING LOGIC ---
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const double baseWidth = 375.0;

    // Get accessibility text scale factor and clamp it to prevent UI breakage
    final accessibilityTextScale = MediaQuery.textScalerOf(context).scale(1.0);
    final clampedTextScale = accessibilityTextScale.clamp(1.0, 1.3); // Max 130% for accessibility

    // A factor for layout elements like padding and container sizes.
    // Clamped to prevent elements from becoming excessively large.
    final double layoutScaleFactor = (screenWidth / baseWidth).clamp(1.0, 1.2);

    // Conservative font scale factor that considers accessibility settings
    final double fontScaleFactor = ((screenWidth / baseWidth) * clampedTextScale).clamp(1.0, 1.15);
    
    // Calculate bottom navigation bar height to prevent content overlap
    final double bottomNavHeight = MediaQuery.of(context).padding.bottom + 80; // Safe area + nav bar height
    // --- END OF RESPONSIVE SCALING LOGIC ---

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
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.06, 20, screenWidth * 0.06, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 11),
                                  child: Container(
                                    width: 45 * layoutScaleFactor, // Use layout scale
                                    height: 45 * layoutScaleFactor, // Use layout scale
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/favicon.png',
                                        fit: BoxFit.contain,
                                        height: 35 * layoutScaleFactor, // Use layout scale
                                        width: 35 * layoutScaleFactor, // Use layout scale
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(
                                            Icons.error,
                                            color: Colors.grey,
                                            size: 30,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ElderBlissCare',
                                        style: GoogleFonts.inter(
                                          fontSize: 22 * fontScaleFactor, // Reduced from 26 to 22
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
                                                fontSize: 16 * fontScaleFactor, // Use font scale
                                                color: Colors.white.withOpacity(0.9),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: currentUserDisplayName.isNotEmpty
                                                  ? currentUserDisplayName
                                                  : 'User',
                                              style: GoogleFonts.inter(
                                                fontSize: 16 * fontScaleFactor, // Use font scale
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
                                      size: 24 * layoutScaleFactor, // Use layout scale
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
                      horizontal: screenWidth * 0.06,
                      vertical: 16,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 60,
                        maxHeight: 100,
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
                              horizontal: screenWidth * 0.04,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(16),
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
                                    width: 32 * layoutScaleFactor * 1.5, // Use layout scale
                                    height: 32 * layoutScaleFactor * 1.5, // Use layout scale
                                    child: Image.asset(
                                      'assets/images/PanicButton.png',
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(
                                          Icons.warning,
                                          color: Color(0xFFDC2626),
                                          size: 24 * layoutScaleFactor, // Use layout scale
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16 * layoutScaleFactor),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Panic Button',
                                        style: GoogleFonts.inter(
                                          fontSize: 17.0 * fontScaleFactor, // Use font scale
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        screenWidth < 400
                                            ? 'Tap for emergency help'
                                            : 'Tap for immediate emergency help',
                                        style: GoogleFonts.inter(
                                          fontSize: 11.0 * fontScaleFactor, // Reduced from 13 to 11
                                          color: Colors.white.withOpacity(0.9),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16 * layoutScaleFactor),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16 * layoutScaleFactor, // Use layout scale
                                ),
                              ],
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
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 24 * layoutScaleFactor, // Use layout scale
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Our Care Services',
                              style: GoogleFonts.inter(
                                fontSize: 22 * fontScaleFactor, // Use font scale
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
                            fontSize: 15 * fontScaleFactor, // Use font scale
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
                          childAspectRatio: screenWidth > 420 ? 0.8 : 0.85,
                          children: [
                            _buildServiceCard(
                              title: 'Healthcare',
                              image: 'assets/images/WhatsApp_Image_2025-03-22_at_13.46.23_19615335.jpg',
                              primaryColor: Color(0xFF059669),
                              secondaryColor: Color(0xFF10B981),
                              layoutScale: layoutScaleFactor,
                              fontScale: fontScaleFactor,
                              onTap: () async {
                                context.pushNamed(HealthcareblogWidget.routeName);
                              },
                            ),
                            _buildServiceCard(
                              title: 'Emergency',
                              image: 'assets/images/IMG_4787.JPG',
                              primaryColor: Color(0xFFDC2626),
                              secondaryColor: Color(0xFFEF4444),
                              layoutScale: layoutScaleFactor,
                              fontScale: fontScaleFactor,
                              onTap: () async {
                                context.pushNamed(EmergencyBlogWidget.routeName);
                              },
                            ),
                            _buildServiceCard(
                              title: 'Convenience',
                              image: 'assets/images/IMG_4796.JPG',
                              primaryColor: Color(0xFF7C3AED),
                              secondaryColor: Color(0xFF8B5CF6),
                              layoutScale: layoutScaleFactor,
                              fontScale: fontScaleFactor,
                              onTap: () async {
                                context.pushNamed(ConvenienceBlogWidget.routeName);
                              },
                            ),
                            _buildServiceCard(
                              title: 'Lifestyle',
                              image: 'assets/images/lifestyle.jpg',
                              primaryColor: Color(0xFFEA580C),
                              secondaryColor: Color(0xFFF97316),
                              layoutScale: layoutScaleFactor,
                              fontScale: fontScaleFactor,
                              onTap: () async {
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
                                    height: 24 * layoutScaleFactor, // Use layout scale
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'What Families Say',
                                    style: GoogleFonts.inter(
                                      fontSize: 22 * fontScaleFactor, // Use font scale
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
                                  fontSize: 15 * fontScaleFactor, // Use font scale
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
                          // UPDATED: Height increased for better fit on taller devices.
                          height: screenHeight * 0.36,
                          child: PageView.builder(
                            controller: _testimonialController,
                            itemCount: testimonials.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: _buildTestimonialCard(
                                    testimonials[index],
                                    layoutScaleFactor,
                                    fontScaleFactor),
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

                  // Add sufficient bottom padding to prevent footer navigation overlap
                  SizedBox(height: bottomNavHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}