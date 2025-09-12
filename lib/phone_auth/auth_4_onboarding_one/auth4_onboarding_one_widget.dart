import '/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth4_onboarding_one_model.dart';
export 'auth4_onboarding_one_model.dart';

class Auth4OnboardingOneWidget extends StatefulWidget {
  const Auth4OnboardingOneWidget({
    super.key,
    int? index,
  }) : this.index = index ?? 0;

  final int index;

  static String routeName = 'auth_4_OnboardingOne';
  static String routePath = 'auth4OnboardingOne';

  @override
  State<Auth4OnboardingOneWidget> createState() =>
      _Auth4OnboardingOneWidgetState();
}

class _Auth4OnboardingOneWidgetState extends State<Auth4OnboardingOneWidget>
    with TickerProviderStateMixin {
  late Auth4OnboardingOneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth4OnboardingOneModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'auth_4_OnboardingOne'});
    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();
    _model.phoneNumberFocusNode!.addListener(() => safeSetState(() {}));
    _model.yourNameTextController ??= TextEditingController();
    _model.yourNameFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'cardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.phoneNumberTextController?.text = '+91';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Enhanced Galaxy Fold optimizations for ultra-narrow screens
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTabletMode = screenWidth > 600; // Unfolded state
    final isFoldedMode = screenWidth < 400; // Regular folded state
    final isUltraNarrow = screenWidth < 350; // Ultra-narrow (2.64" Galaxy Fold)
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    
    // Enhanced responsive padding and sizing
    final horizontalPadding = isTabletMode ? 48.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 16.0 : 24.0));
    final logoSize = isTabletMode ? 120.0 : (isUltraNarrow ? 70.0 : (isFoldedMode ? 90.0 : 100.0)); // Increased logo size
    final iconSize = isTabletMode ? 50.0 : (isUltraNarrow ? 28.0 : (isFoldedMode ? 35.0 : 40.0));
    final verticalSpacing = isUltraNarrow ? 8.0 : (isLandscape ? 10.0 : 20.0);
    final verticalSpacingLarge = isUltraNarrow ? 16.0 : (isLandscape ? 16.0 : 32.0);
    
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Custom App Bar
                Padding(
                  padding: EdgeInsets.fromLTRB(horizontalPadding / 1.2, isUltraNarrow ? 12 : 16, horizontalPadding / 1.2, 0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 12.0,
                          borderWidth: 1.0,
                          buttonSize: isTabletMode ? 50.0 : (isUltraNarrow ? 36.0 : (isFoldedMode ? 40.0 : 44.0)),
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: isTabletMode ? 28.0 : (isUltraNarrow ? 18.0 : (isFoldedMode ? 20.0 : 24.0)),
                          ),
                          onPressed: () async {
                            logFirebaseEvent('AUTH_4_ONBOARDING_ONE_arrow_back_rounded');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: max(
                                        0,
                                        min(
                                            valueOrDefault<int>(
                                              widget.index,
                                              0,
                                            ),
                                            1))),
                            scrollDirection: Axis.horizontal,
                            children: [
                              // Page 1: Phone Number
                              Column(
                                children: [
                                  // Top Section: Logo and Welcome Text (fixed at top)
                                  Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(horizontalPadding, 0.0, horizontalPadding, 0.0),
                                      child: Column(
                                        children: [
                                          // Logo Section - enhanced design to match target
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, isUltraNarrow ? 4.0 : 6.0, 0.0, isUltraNarrow ? 12.0 : 16.0),
                                            child: Center(
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  // Outer subtle background circle
                                                  Container(
                                                    width: logoSize + (isTabletMode ? 80 : (isUltraNarrow ? 40 : 60)),
                                                    height: logoSize + (isTabletMode ? 80 : (isUltraNarrow ? 40 : 60)),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  // Main logo container
                                                  Container(
                                                    padding: EdgeInsets.all(isTabletMode ? 28 : (isUltraNarrow ? 16 : (isFoldedMode ? 20 : 24))),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                                                          blurRadius: 30,
                                                          offset: Offset(0, 10),
                                                          spreadRadius: 5,
                                                        ),
                                                        BoxShadow(
                                                          color: Colors.black.withOpacity(0.05),
                                                          blurRadius: 15,
                                                          offset: Offset(0, 5),
                                                        ),
                                                      ],
                                                    ),
                                                    child: ClipOval(
                                                      child: Image.asset(
                                                        'assets/images/favicon.png',
                                                        width: logoSize,
                                                        height: logoSize,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context, error, stackTrace) {
                                                          return Container(
                                                            width: logoSize,
                                                            height: logoSize,
                                                            decoration: BoxDecoration(
                                                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: Icon(
                                                              Icons.favorite_border,
                                                              color: FlutterFlowTheme.of(context).primary,
                                                              size: logoSize * 0.5,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          
                                          // Welcome text - split into two lines and center aligned
                                          Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                  child: Text(
                                                    'Welcome to',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          font: GoogleFonts.sora(
                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                .displayMedium
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                .displayMedium
                                                                .fontStyle,
                                                          ),
                                                          fontSize: isTabletMode ? 36.0 : (isUltraNarrow ? 18.0 : (isFoldedMode ? 24.0 : 32.0)),
                                                          letterSpacing: 0.0,
                                                          fontWeight: FlutterFlowTheme.of(context)
                                                              .displayMedium
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context)
                                                              .displayMedium
                                                              .fontStyle,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, isUltraNarrow ? 4.0 : 8.0),
                                                  child: Text(
                                                    'ElderBlissCare',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.pacifico(
                                                      fontSize: isTabletMode ? 36.0 : (isUltraNarrow ? 18.0 : (isFoldedMode ? 24.0 : 32.0)),
                                                      color: Color(0xFF98404F),
                                                      letterSpacing: 0.0,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  
                                  // Bottom Section: Remaining content (centered like before)
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: isTabletMode ? 500.0 : double.infinity,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(horizontalPadding, 0.0, horizontalPadding, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: isTabletMode ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                                              children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, isUltraNarrow ? 8.0 : (isLandscape ? 12.0 : 16.0)),
                                            child: Text(
                                              'Join thousands of families who trust us with their loved one\'s care. Enter your phone number to begin your journey with us.',
                                              textAlign: isTabletMode ? TextAlign.center : TextAlign.start,
                                              style: FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context)
                                                          .labelLarge
                                                          .fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context)
                                                          .labelLarge
                                                          .fontStyle,
                                                    ),
                                                    fontSize: isTabletMode ? 18.0 : (isUltraNarrow ? 11.0 : (isFoldedMode ? 14.0 : 16.0)),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                                  ),
                                            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, isUltraNarrow ? 8.0 : 12.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                borderRadius: BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1,
                                                ),
                                              ),
                                              child: TextFormField(
                                                controller: _model.phoneNumberTextController,
                                                focusNode: _model.phoneNumberFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Phone Number',
                                                  labelStyle: FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FlutterFlowTheme.of(context)
                                                              .labelLarge
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context)
                                                              .labelLarge
                                                              .fontStyle,
                                                        ),
                                                        fontSize: isTabletMode ? 18.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 14.0 : 16.0)),
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context)
                                                            .labelLarge
                                                            .fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context)
                                                            .labelLarge
                                                            .fontStyle,
                                                      ),
                                                  prefixIcon: Container(
                                                    margin: EdgeInsets.all(isUltraNarrow ? 6 : 8),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: Icon(
                                                      Icons.phone_outlined,
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      size: isTabletMode ? 24 : (isUltraNarrow ? 16 : (isFoldedMode ? 18 : 20)),
                                                    ),
                                                  ),
                                                  errorStyle: FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FlutterFlowTheme.of(context)
                                                              .labelSmall
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context)
                                                              .labelSmall
                                                              .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme.of(context).error,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context)
                                                            .labelSmall
                                                            .fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context)
                                                            .labelSmall
                                                            .fontStyle,
                                                        lineHeight: 3.0,
                                                      ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius: BorderRadius.circular(12.0),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(12.0),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(context).error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(12.0),
                                                  ),
                                                  focusedErrorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(context).error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 
                                                    isTabletMode ? 20.0 : (isUltraNarrow ? 10.0 : (isFoldedMode ? 12.0 : 16.0)), 
                                                    16.0, 
                                                    isTabletMode ? 20.0 : (isUltraNarrow ? 10.0 : (isFoldedMode ? 12.0 : 16.0))
                                                  ),
                                                ),
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                      ),
                                                      fontSize: isTabletMode ? 18.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 14.0 : 16.0)),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                    ),
                                                keyboardType: TextInputType.phone,
                                                cursorColor: FlutterFlowTheme.of(context).primary,
                                                validator: _model.phoneNumberTextControllerValidator.asValidator(context),
                                              ),
                                            ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation']!),
                                          ),
                                          if ((_model.phoneNumberFocusNode?.hasFocus ?? false))
                                            Padding(
                                              padding: EdgeInsets.only(top: isUltraNarrow ? 12 : 16),
                                              child: Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(isTabletMode ? 20 : (isUltraNarrow ? 10 : (isFoldedMode ? 12 : 16))),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).accent2,
                                                  borderRadius: BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).secondary,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'We\'ll send a 6 digit code to you!',
                                                      style: GoogleFonts.inter(
                                                        fontSize: isTabletMode ? 16 : (isUltraNarrow ? 11 : (isFoldedMode ? 12 : 14)),
                                                        fontWeight: FontWeight.w600,
                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      'You will be done in no time, keep up the great work!',
                                                      style: GoogleFonts.inter(
                                                        fontSize: isTabletMode ? 14 : (isUltraNarrow ? 9 : (isFoldedMode ? 10 : 12)),
                                                        color: FlutterFlowTheme.of(context).secondaryText,
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
                                    ),
                                  ),
                                ],
                              ),
                              
                              // Page 2: Name Entry
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: isTabletMode ? 500.0 : double.infinity,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(horizontalPadding, 0.0, horizontalPadding, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: isTabletMode ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                                          children: [
                                            // Logo Section - matching enhanced design
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, isUltraNarrow ? 16.0 : 24.0, 0.0, isUltraNarrow ? 20.0 : 32.0),
                                              child: Center(
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    // Outer subtle background circle
                                                    Container(
                                                      width: (iconSize * 2.5) + (isTabletMode ? 60 : (isUltraNarrow ? 30 : 45)),
                                                      height: (iconSize * 2.5) + (isTabletMode ? 60 : (isUltraNarrow ? 30 : 45)),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).primary.withOpacity(0.05),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    // Main icon container
                                                    Container(
                                                      padding: EdgeInsets.all(isTabletMode ? 24 : (isUltraNarrow ? 12 : (isFoldedMode ? 16 : 20))),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                                                            blurRadius: 30,
                                                            offset: Offset(0, 10),
                                                            spreadRadius: 5,
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.black.withOpacity(0.05),
                                                            blurRadius: 15,
                                                            offset: Offset(0, 5),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        padding: EdgeInsets.all(isTabletMode ? 16 : (isUltraNarrow ? 8 : (isFoldedMode ? 12 : 14))),
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.person_add_outlined,
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          size: iconSize,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, isUltraNarrow ? 4.0 : 8.0),
                                              child: Text(
                                                'What\'s your name?',
                                                textAlign: isTabletMode ? TextAlign.center : TextAlign.start,
                                                style: FlutterFlowTheme.of(context)
                                                    .displayMedium
                                                    .override(
                                                      font: GoogleFonts.sora(
                                                        fontWeight: FlutterFlowTheme.of(context)
                                                            .displayMedium
                                                            .fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context)
                                                            .displayMedium
                                                            .fontStyle,
                                                      ),
                                                      fontSize: isTabletMode ? 36.0 : (isUltraNarrow ? 20.0 : (isFoldedMode ? 24.0 : 32.0)),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context)
                                                          .displayMedium
                                                          .fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context)
                                                          .displayMedium
                                                          .fontStyle,
                                                    ),
                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, isUltraNarrow ? 8.0 : (isLandscape ? 12.0 : 16.0)),
                                              child: Text(
                                                'Enter a name that people would recognize so your friends can find you.',
                                                textAlign: isTabletMode ? TextAlign.center : TextAlign.start,
                                                style: FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context)
                                                            .labelLarge
                                                            .fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context)
                                                            .labelLarge
                                                            .fontStyle,
                                                      ),
                                                      fontSize: isTabletMode ? 18.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 14.0 : 16.0)),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context)
                                                          .labelLarge
                                                          .fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context)
                                                          .labelLarge
                                                          .fontStyle,
                                                    ),
                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, isUltraNarrow ? 8.0 : 12.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).alternate,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: _model.yourNameTextController,
                                                  focusNode: _model.yourNameFocusNode,
                                                  autofocus: false,
                                                  autofillHints: [AutofillHints.name],
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Your Name...',
                                                    labelStyle: FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                .labelLarge
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                .labelLarge
                                                                .fontStyle,
                                                          ),
                                                          fontSize: isTabletMode ? 18.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 14.0 : 16.0)),
                                                          letterSpacing: 0.0,
                                                          fontWeight: FlutterFlowTheme.of(context)
                                                              .labelLarge
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context)
                                                              .labelLarge
                                                              .fontStyle,
                                                        ),
                                                    prefixIcon: Container(
                                                      margin: EdgeInsets.all(isUltraNarrow ? 6 : 8),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Icon(
                                                        Icons.person_outline,
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        size: isTabletMode ? 24 : (isUltraNarrow ? 16 : (isFoldedMode ? 18 : 20)),
                                                      ),
                                                    ),
                                                    errorStyle: FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                .bodySmall
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                .bodySmall
                                                                .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).error,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FlutterFlowTheme.of(context)
                                                              .bodySmall
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context)
                                                              .bodySmall
                                                              .fontStyle,
                                                          lineHeight: 3.0,
                                                        ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide.none,
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(context).error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                      16.0, 
                                                      isTabletMode ? 20.0 : (isUltraNarrow ? 10.0 : (isFoldedMode ? 12.0 : 16.0)), 
                                                      16.0, 
                                                      isTabletMode ? 20.0 : (isUltraNarrow ? 10.0 : (isFoldedMode ? 12.0 : 16.0))
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                        ),
                                                        fontSize: isTabletMode ? 18.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 14.0 : 16.0)),
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                      ),
                                                  keyboardType: TextInputType.name,
                                                  cursorColor: FlutterFlowTheme.of(context).primary,
                                                  validator: _model.yourNameTextControllerValidator.asValidator(context),
                                                ),
                                              ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Page Indicator
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 80),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(
                                              valueOrDefault<int>(
                                                widget.index,
                                                0,
                                              ),
                                              1))),
                              count: 2,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                safeSetState(() {});
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 2.0,
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 44.0,
                                dotHeight: 8.0,
                                dotColor: FlutterFlowTheme.of(context).accent1,
                                activeDotColor: FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Bottom Navigation
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding, 
                    isUltraNarrow ? 8.0 : 12.0, 
                    horizontalPadding, 
                    isUltraNarrow ? 12.0 : 20.0
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_model.pageViewCurrentIndex >= 1)
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('AUTH_4_ONBOARDING_ONE_BACK_BTN_ON_TAP');
                            logFirebaseEvent('Button_page_view');
                            await _model.pageViewController?.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          text: 'Back',
                          options: FFButtonOptions(
                            height: isTabletMode ? 52.0 : (isUltraNarrow ? 44.0 : (isFoldedMode ? 48.0 : 52.0)),
                            padding: EdgeInsets.symmetric(
                              horizontal: isTabletMode ? 24.0 : (isUltraNarrow ? 16.0 : (isFoldedMode ? 20.0 : 24.0))
                            ),
                            iconPadding: EdgeInsets.zero,
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            textStyle: GoogleFonts.inter(
                              fontSize: isTabletMode ? 16 : (isUltraNarrow ? 14 : (isFoldedMode ? 15 : 16)),
                              fontWeight: FontWeight.w600,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(isUltraNarrow ? 12.0 : 16.0),
                          ),
                        ),
                      if (_model.pageViewCurrentIndex < 1) Spacer(),
                      
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('AUTH_4_ONBOARDING_ONE_NEXT_BTN_ON_TAP');
                          if (_model.pageViewCurrentIndex == 0) {
                            logFirebaseEvent('Button_auth');
                            final phoneNumberVal = _model.phoneNumberTextController.text.trim();
                            if (phoneNumberVal.isEmpty) {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please enter your phone number'),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                              return;
                            }
                            if (!phoneNumberVal.startsWith('+')) {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Phone number must include country code (e.g., +91 for India)'),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                              return;
                            }
                            if (phoneNumberVal.length < 10) {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please enter a valid phone number'),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                              return;
                            }
                            await authManager.beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberVal,
                              onCodeSent: (context) async {
                                context.goNamedAuth(
                                  Auth4OnboardingPhoneVerifyWidget.routeName,
                                  context.mounted,
                                  queryParameters: {
                                    'phoneNumber': serializeParam(
                                      _model.phoneNumberTextController.text,
                                      ParamType.String,
                                    ),
                                    'isLogin': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  ignoreRedirect: true,
                                );
                              },
                            );
                          } else if (_model.pageViewCurrentIndex == 1) {
                            logFirebaseEvent('Button_validate_form');
                            if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            
                            // Save user name to both Firebase Auth and Firestore
                            logFirebaseEvent('Button_backend_call');
                            final userName = _model.yourNameTextController.text.trim();
                            
                            // Update Firebase Auth displayName
                            if (FirebaseAuth.instance.currentUser != null) {
                              await FirebaseAuth.instance.currentUser!.updateDisplayName(userName);
                            }
                            
                            // Update Firestore user document
                            await currentUserReference!.update(createUsersRecordData(
                              displayName: userName,
                            ));
                            
                            // Update app state
                            FFAppState().name = userName;
                            
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Welcome to ElderBlissCare!',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                              ),
                            );
                            
                            // Navigate to dashboard
                            logFirebaseEvent('Button_navigate_to');
                            context.pushNamed(DashboardWidget.routeName);
                          }
                        },
                        text: _model.pageViewCurrentIndex == 1 ? 'Complete Setup' : 'Continue',
                        options: FFButtonOptions(
                          height: isTabletMode ? 52.0 : (isUltraNarrow ? 44.0 : (isFoldedMode ? 48.0 : 52.0)),
                          padding: EdgeInsets.symmetric(
                            horizontal: isTabletMode ? 32.0 : (isUltraNarrow ? 20.0 : (isFoldedMode ? 24.0 : 32.0))
                          ),
                          iconPadding: EdgeInsets.zero,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: GoogleFonts.inter(
                            fontSize: isTabletMode ? 16 : (isUltraNarrow ? 14 : (isFoldedMode ? 15 : 16)),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          elevation: 0,
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(isUltraNarrow ? 12.0 : 16.0),
                        ),
                      ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
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
