import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth4_login_model.dart';
export 'auth4_login_model.dart';

class Auth4LoginWidget extends StatefulWidget {
  const Auth4LoginWidget({super.key});

  static String routeName = 'auth_4_Login';
  static String routePath = 'auth4Login';

  @override
  State<Auth4LoginWidget> createState() => _Auth4LoginWidgetState();
}

class _Auth4LoginWidgetState extends State<Auth4LoginWidget>
    with TickerProviderStateMixin {
  late Auth4LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth4LoginModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'auth_4_Login'});
    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 40.0),
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
    final logoSize = isTabletMode ? 100.0 : (isUltraNarrow ? 50.0 : (isFoldedMode ? 60.0 : 80.0));
    final maxWidth = isTabletMode ? 500.0 : (isFoldedMode ? double.infinity : 770.0);
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('AUTH_4_LOGIN_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Center(
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: maxWidth,
                minHeight: isLandscape ? screenHeight * 0.8 : screenHeight * 0.6,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(horizontalPadding, 0.0, horizontalPadding, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo Section with enhanced responsive sizing
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, verticalSpacing, 0.0, verticalSpacingLarge),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(isTabletMode ? 20 : (isUltraNarrow ? 8 : (isFoldedMode ? 12 : 16))),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.phone_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: iconSize,
                            ),
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, isUltraNarrow ? 4.0 : 8.0),
                        child: Text(
                          'Login with phone',
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
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation1']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, isUltraNarrow ? 8.0 : (isLandscape ? 12.0 : 16.0)),
                        child: Text(
                          'Enter your phone number in order to get started with your profile creation.',
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
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation2']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, isUltraNarrow ? 8.0 : 12.0, 0.0, isUltraNarrow ? 12.0 : (isLandscape ? 16.0 : 24.0)),
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
                            validator: _model
                                .phoneNumberTextControllerValidator
                                .asValidator(context),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['textFieldOnPageLoadAnimation']!),
                      ),
                      
                      // Button section with enhanced responsive positioning
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, isUltraNarrow ? 8.0 : 12.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: isTabletMode ? MainAxisAlignment.center : (isUltraNarrow ? MainAxisAlignment.center : MainAxisAlignment.end),
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('AUTH_4_LOGIN_PAGE_SEND_CODE_BTN_ON_TAP');
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
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                      ignoreRedirect: true,
                                    );
                                  },
                                );
                              },
                              text: 'Send Code',
                              options: FFButtonOptions(
                                height: isTabletMode ? 56.0 : (isUltraNarrow ? 44.0 : (isFoldedMode ? 48.0 : 52.0)),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  isTabletMode ? 60.0 : (isUltraNarrow ? 28.0 : (isFoldedMode ? 36.0 : 44.0)), 
                                  0.0, 
                                  isTabletMode ? 60.0 : (isUltraNarrow ? 28.0 : (isFoldedMode ? 36.0 : 44.0)), 
                                  0.0
                                ),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      fontSize: isTabletMode ? 18.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 14.0 : 16.0)),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                hoverColor: FlutterFlowTheme.of(context).accent1,
                                hoverBorderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                hoverTextColor: FlutterFlowTheme.of(context).primaryText,
                                hoverElevation: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
