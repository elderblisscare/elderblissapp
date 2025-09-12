import '/flutter_flow/flutter_flow_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services_model.dart';
export 'services_model.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  static String routeName = 'Services';
  static String routePath = 'services';

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  late ServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Services'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Widget _buildServiceFeature(BuildContext context, String feature, double layoutScale, double fontScale, bool isVeryNarrow) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0 * layoutScale),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: FlutterFlowTheme.of(context).primary,
            size: (isVeryNarrow ? 16.0 : 18.0) * layoutScale,
          ),
          SizedBox(width: 12.0 * layoutScale),
          Expanded(
            child: Text(
              feature,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: (isVeryNarrow ? 13.0 : 15.0) * fontScale,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    lineHeight: 1.4,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(GoogleFonts.inter().fontFamily),
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
    
    // Galaxy Fold optimization: Detect very narrow screens (≤ 340px ≈ 2.64 inches)
    final bool isVeryNarrowScreen = screenWidth <= 340;
    
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
        backgroundColor: Colors.white, // Single white background
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).secondary
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                              24.0 * layoutScaleFactor, 
                              (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                              24.0 * layoutScaleFactor),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Our Services',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: GoogleFonts.sora().fontFamily,
                                      fontSize: (isVeryNarrowScreen ? 26.0 : 30.0) * fontScaleFactor,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              GoogleFonts.sora().fontFamily),
                                    ),
                              ),
                              Text(
                                'Comprehensive healthcare solutions for your well-being',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                      color: Color(0xFFE0E0E0),
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              GoogleFonts.inter().fontFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.white, // Consistent white background
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                              24.0 * layoutScaleFactor, 
                              (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                              24.0 * layoutScaleFactor),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Consistent white background
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: (isVeryNarrowScreen ? 50.0 : 60.0) * layoutScaleFactor,
                                                height: (isVeryNarrowScreen ? 50.0 : 60.0) * layoutScaleFactor,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Icon(
                                                  Icons.emergency,
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  size: (isVeryNarrowScreen ? 26.0 : 32.0) * layoutScaleFactor,
                                                ),
                                              ),
                                              SizedBox(width: 16.0 * layoutScaleFactor),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Emergency Services',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.sora()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 18.0 : 22.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.sora()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                    SizedBox(height: 8.0 * layoutScaleFactor),
                                                    Text(
                                                      '24/7 Support & Emergency Response',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.inter()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 12.0 : 14.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.inter()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20.0 * layoutScaleFactor),
                                          Text(
                                            'Comprehensive emergency healthcare support including:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      GoogleFonts.inter()
                                                          .fontFamily,
                                                  fontSize: (isVeryNarrowScreen ? 13.0 : 15.0) * fontScaleFactor,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          GoogleFonts.inter()
                                                              .fontFamily),
                                                ),
                                          ),
                                          SizedBox(height: 12.0 * layoutScaleFactor),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildServiceFeature(context,
                                                  '24×7 emergency support helpline',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Emergency Doctor on call',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(
                                                  context,
                                                  'Paramedic Support during Emergency',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(
                                                  context,
                                                  'Family Emergency Response Plan Setup',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Support during Hospitalization',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Consistent white background
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                          (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: (isVeryNarrowScreen ? 50.0 : 60.0) * layoutScaleFactor,
                                                height: (isVeryNarrowScreen ? 50.0 : 60.0) * layoutScaleFactor,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Icon(
                                                  Icons.home_filled,
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  size: (isVeryNarrowScreen ? 26.0 : 32.0) * layoutScaleFactor,
                                                ),
                                              ),
                                              SizedBox(width: 16.0 * layoutScaleFactor),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Medical Setup at Home',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.sora()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 18.0 : 22.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.sora()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                    SizedBox(height: 8.0 * layoutScaleFactor),
                                                    Text(
                                                      'Complete ICU & Critical Care Setup',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.inter()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 12.0 : 14.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.inter()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20.0 * layoutScaleFactor),
                                          Text(
                                            'Professional medical setup for home-based care including:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      GoogleFonts.inter()
                                                          .fontFamily,
                                                  fontSize: (isVeryNarrowScreen ? 13.0 : 15.0) * fontScaleFactor,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          GoogleFonts.inter()
                                                              .fontFamily),
                                                ),
                                          ),
                                          SizedBox(height: 12.0 * layoutScaleFactor),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildServiceFeature(context,
                                                  'Complete ICU setup at home',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Critical Care Doctors',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Nursing Supervisor support',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Trained Nursing Attendants',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'General Duty Assistants',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Consistent white background
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 60.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Icon(
                                                  Icons.science,
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  size: 32.0,
                                                ),
                                              ),
                                              SizedBox(width: 16.0),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Medical Equipment',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.sora()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 18.0 : 22.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.sora()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                    SizedBox(height: 8.0 * layoutScaleFactor),
                                                    Text(
                                                      'Advanced Medical Technology',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.inter()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 12.0 : 14.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.inter()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20.0),
                                          Text(
                                            'State-of-the-art medical equipment for comprehensive care:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      GoogleFonts.inter()
                                                          .fontFamily,
                                                  fontSize: (isVeryNarrowScreen ? 13.0 : 15.0) * fontScaleFactor,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          GoogleFonts.inter()
                                                              .fontFamily),
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildServiceFeature(context,
                                                  'Patient Monitor & ECG Machine',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(
                                                  context, 'Ventilator & Crash Cart',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'IV Equipment & Catheters',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Nasogastric suction systems',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Pleureva & Emergency equipment',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Consistent white background
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 60.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Icon(
                                                  Icons.favorite,
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  size: 32.0,
                                                ),
                                              ),
                                              SizedBox(width: 16.0),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Homecare Services',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.sora()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 18.0 : 22.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.sora()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                    SizedBox(height: 8.0 * layoutScaleFactor),
                                                    Text(
                                                      'Professional Care at Home',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.inter()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 12.0 : 14.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.inter()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20.0),
                                          Text(
                                            'Comprehensive healthcare services delivered to your home:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      GoogleFonts.inter()
                                                          .fontFamily,
                                                  fontSize: (isVeryNarrowScreen ? 13.0 : 15.0) * fontScaleFactor,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          GoogleFonts.inter()
                                                              .fontFamily),
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildServiceFeature(
                                                  context, 'Doctor Home Visits',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Physiotherapy at Home',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Trained Eldercare Nurses',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(
                                                  context, '24-Hour Nursing Care',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Professional Attendants (GDA Staff)',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Consistent white background
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 60.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Icon(
                                                  Icons.shield,
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  size: 32.0,
                                                ),
                                              ),
                                              SizedBox(width: 16.0),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Safety Services',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.sora()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 18.0 : 22.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.sora()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                    SizedBox(height: 8.0 * layoutScaleFactor),
                                                    Text(
                                                      'Home Security & Fall Prevention',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.inter()
                                                                        .fontFamily,
                                                                fontSize: (isVeryNarrowScreen ? 12.0 : 14.0) * fontScaleFactor,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            GoogleFonts.inter()
                                                                                .fontFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20.0),
                                          Text(
                                            'Comprehensive safety solutions for peace of mind:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      GoogleFonts.inter()
                                                          .fontFamily,
                                                  fontSize: (isVeryNarrowScreen ? 13.0 : 15.0) * fontScaleFactor,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          GoogleFonts.inter()
                                                              .fontFamily),
                                                ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildServiceFeature(context,
                                                  'Home safety audits & fall prevention',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'KYC verification of house help',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Smart safety technology integration',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Fall detector recommendations',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                              _buildServiceFeature(context,
                                                  'Security system consultation',
                                                  layoutScaleFactor, fontScaleFactor, isVeryNarrowScreen),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: isVeryNarrowScreen ? 16.0 : 20.0)), // Slightly more spacing between cards for Galaxy Fold
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                            (isVeryNarrowScreen ? 24.0 : 32.0) * layoutScaleFactor, // Slightly more top spacing for Galaxy Fold
                            (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                            0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).secondary
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(-1.0, 0.0),
                              end: AlignmentDirectional(1.0, 0.0),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15.0,
                                color: FlutterFlowTheme.of(context)
                                    .primary
                                    .withOpacity(0.2),
                                offset: Offset(0.0, 5.0),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                (isVeryNarrowScreen ? 20.0 : 32.0) * layoutScaleFactor, // Reduced top padding for Galaxy Fold
                                (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                                (isVeryNarrowScreen ? 20.0 : 32.0) * layoutScaleFactor), // Reduced bottom padding for Galaxy Fold
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                   FontAwesomeIcons.whatsapp,
                                  color: Colors.white,
                                  size: (isVeryNarrowScreen ? 40.0 : 48.0) * layoutScaleFactor,
                                ),
                                SizedBox(height: (isVeryNarrowScreen ? 12.0 : 16.0) * layoutScaleFactor),
                                Text(
                                  'Need Help?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily:
                                            GoogleFonts.sora().fontFamily,
                                        fontSize: (isVeryNarrowScreen ? 20.0 : 24.0) * fontScaleFactor,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(GoogleFonts.sora()
                                                .fontFamily),
                                      ),
                                ),
                                SizedBox(height: 8.0 * layoutScaleFactor),
                                Text(
                                  'Get in touch with our experts to discuss your healthcare needs',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                        fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                        color: Color(0xFFE0E0E0),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(GoogleFonts.inter()
                                                .fontFamily),
                                      ),
                                ),
                                SizedBox(height: (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SERVICES_CONTACT_US_BTN_ON_TAP');
                                    logFirebaseEvent('Button_launch_u_r_l');
                                    await launchURL(
                                        'https://wa.me/message/BFIUAWXCKN3BM1');
                                  },
                                  text: isVeryNarrowScreen ? 'Contact on WhatsApp' : 'Contact Us on WhatsApp',
                                  icon: Icon(
                                   FontAwesomeIcons.whatsapp,// The icon has been changed here
                                    size: (isVeryNarrowScreen ? 18.0 : 20.0) * layoutScaleFactor,
                                  ),
                                  options: FFButtonOptions(
                                    width: MediaQuery.sizeOf(context).width *
                                        1.0,
                                    height: (isVeryNarrowScreen ? 52.0 : 56.0) * layoutScaleFactor,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0 * layoutScaleFactor, 0.0, 16.0 * layoutScaleFactor, 0.0),
                                    iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0 * layoutScaleFactor, 0.0),
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                          fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  GoogleFonts.inter()
                                                      .fontFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: isVeryNarrowScreen ? 60.0 : 80.0, // Slightly more space for Galaxy Fold
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      SizedBox(height: isVeryNarrowScreen ? bottomNavHeight * 0.8 : bottomNavHeight * 0.7), // More bottom space for Galaxy Fold
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}