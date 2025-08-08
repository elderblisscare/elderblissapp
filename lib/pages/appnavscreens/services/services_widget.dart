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

  Widget _buildServiceFeature(BuildContext context, String feature) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: FlutterFlowTheme.of(context).primary,
            size: 18.0,
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Text(
              feature,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: GoogleFonts.inter().fontFamily,
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
                              24.0, 24.0, 24.0, 24.0),
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
                              24.0, 24.0, 24.0, 24.0),
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
                                                  Icons.emergency,
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
                                                      'Emergency Services',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.sora()
                                                                        .fontFamily,
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
                                                    SizedBox(height: 8.0),
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
                                            'Comprehensive emergency healthcare support including:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      GoogleFonts.inter()
                                                          .fontFamily,
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
                                                  '24×7 emergency support helpline'),
                                              _buildServiceFeature(context,
                                                  'Emergency Doctor on call'),
                                              _buildServiceFeature(
                                                  context,
                                                  'Paramedic Support during Emergency'),
                                              _buildServiceFeature(
                                                  context,
                                                  'Family Emergency Response Plan Setup'),
                                              _buildServiceFeature(context,
                                                  'Support during Hospitalization'),
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
                                                  Icons.home_filled,
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
                                                      'Medical Setup at Home',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts.sora()
                                                                        .fontFamily,
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
                                                    SizedBox(height: 8.0),
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
                                            'Professional medical setup for home-based care including:',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      GoogleFonts.inter()
                                                          .fontFamily,
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
                                                  'Complete ICU setup at home'),
                                              _buildServiceFeature(context,
                                                  'Critical Care Doctors'),
                                              _buildServiceFeature(context,
                                                  'Nursing Supervisor support'),
                                              _buildServiceFeature(context,
                                                  'Trained Nursing Attendants'),
                                              _buildServiceFeature(context,
                                                  'General Duty Assistants'),
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
                                                    SizedBox(height: 8.0),
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
                                                  'Patient Monitor & ECG Machine'),
                                              _buildServiceFeature(
                                                  context, 'Ventilator & Crash Cart'),
                                              _buildServiceFeature(context,
                                                  'IV Equipment & Catheters'),
                                              _buildServiceFeature(context,
                                                  'Nasogastric suction systems'),
                                              _buildServiceFeature(context,
                                                  'Pleureva & Emergency equipment'),
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
                                                    SizedBox(height: 8.0),
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
                                                  context, 'Doctor Home Visits'),
                                              _buildServiceFeature(context,
                                                  'Physiotherapy at Home'),
                                              _buildServiceFeature(context,
                                                  'Trained Eldercare Nurses'),
                                              _buildServiceFeature(
                                                  context, '24-Hour Nursing Care'),
                                              _buildServiceFeature(context,
                                                  'Professional Attendants (GDA Staff)'),
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
                                                    SizedBox(height: 8.0),
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
                                                  'Home safety audits & fall prevention'),
                                              _buildServiceFeature(context,
                                                  'KYC verification of house help'),
                                              _buildServiceFeature(context,
                                                  'Smart safety technology integration'),
                                              _buildServiceFeature(context,
                                                  'Fall detector recommendations'),
                                              _buildServiceFeature(context,
                                                  'Security system consultation'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 32.0, 24.0, 0.0),
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
                                24.0, 32.0, 24.0, 32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                   FontAwesomeIcons.whatsapp,
                                  color: Colors.white,
                                  size: 48.0,
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  'Need Help?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily:
                                            GoogleFonts.sora().fontFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(GoogleFonts.sora()
                                                .fontFamily),
                                      ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Get in touch with our experts to discuss your healthcare needs',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                        color: Color(0xFFE0E0E0),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(GoogleFonts.inter()
                                                .fontFamily),
                                      ),
                                ),
                                SizedBox(height: 24.0),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SERVICES_CONTACT_US_BTN_ON_TAP');
                                    logFirebaseEvent('Button_launch_u_r_l');
                                    await launchURL(
                                        'https://wa.me/message/BFIUAWXCKN3BM1');
                                  },
                                  text: 'Contact Us on WhatsApp',
                                  icon: Icon(
                                   FontAwesomeIcons.whatsapp,// The icon has been changed here
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: MediaQuery.sizeOf(context).width *
                                        1.0,
                                    height: 56.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
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
                        height: 200.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
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