import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth4_onboarding_phone_verify_model.dart';
export 'auth4_onboarding_phone_verify_model.dart';

class Auth4OnboardingPhoneVerifyWidget extends StatefulWidget {
  const Auth4OnboardingPhoneVerifyWidget({
    super.key,
    this.phoneNumber,
    bool? isLogin,
  }) : this.isLogin = isLogin ?? false;

  final String? phoneNumber;
  final bool isLogin;

  static String routeName = 'auth_4_OnboardingPhoneVerify';
  static String routePath = 'auth4OnboardingPhoneVerify';

  @override
  State<Auth4OnboardingPhoneVerifyWidget> createState() =>
      _Auth4OnboardingPhoneVerifyWidgetState();
}

class _Auth4OnboardingPhoneVerifyWidgetState
    extends State<Auth4OnboardingPhoneVerifyWidget>
    with TickerProviderStateMixin {
  late Auth4OnboardingPhoneVerifyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth4OnboardingPhoneVerifyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'auth_4_OnboardingPhoneVerify'});
    _model.pinCodeFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
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
    });
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
    final maxWidth = isTabletMode ? 500.0 : (isFoldedMode ? double.infinity : 670.0);
    final iconSize = isTabletMode ? 50.0 : (isUltraNarrow ? 28.0 : (isFoldedMode ? 35.0 : 40.0));
    final pinFieldSize = isTabletMode ? 56.0 : (isUltraNarrow ? 36.0 : (isFoldedMode ? 40.0 : 44.0));
    final pinFieldWidth = isTabletMode ? 56.0 : (isUltraNarrow ? 36.0 : (isFoldedMode ? 40.0 : 44.0));
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
              logFirebaseEvent('AUTH_4_ONBOARDING_PHONE_VERIFY_arrow_bac');
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
                    crossAxisAlignment: isTabletMode ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      // Icon Section
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
                              Icons.verified_user_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: iconSize,
                            ),
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, isUltraNarrow ? 4.0 : 8.0),
                        child: Text(
                          'Verify Code',
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
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, isUltraNarrow ? 16.0 : (isLandscape ? 12.0 : 24.0)),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          textAlign: isTabletMode ? TextAlign.center : TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Enter the 6 digit code we sent to the number below: ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.phoneNumber,
                                  '--',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
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
                                  lineHeight: 1.2,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, isUltraNarrow ? 8.0 : 16.0, 0.0, isUltraNarrow ? 16.0 : (isLandscape ? 16.0 : 32.0)),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: isTabletMode ? 400.0 : (isUltraNarrow ? 280.0 : double.infinity),
                          ),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle: FlutterFlowTheme.of(context)
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
                                  fontSize: isTabletMode ? 20.0 : (isUltraNarrow ? 12.0 : (isFoldedMode ? 14.0 : 16.0)),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                            mainAxisAlignment: isUltraNarrow ? MainAxisAlignment.spaceBetween : (isTabletMode ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.spaceBetween),
                            enableActiveFill: false,
                            autoFocus: true,
                            focusNode: _model.pinCodeFocusNode,
                            enablePinAutofill: true,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            obscureText: false,
                            hintCharacter: '-',
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: pinFieldSize,
                              fieldWidth: pinFieldWidth,
                              borderWidth: 2.0,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              shape: PinCodeFieldShape.underline,
                              activeColor: FlutterFlowTheme.of(context).primaryText,
                              inactiveColor: FlutterFlowTheme.of(context).alternate,
                              selectedColor: FlutterFlowTheme.of(context).primary,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) {},
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator.asValidator(context),
                          ),
                        ),
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
                                logFirebaseEvent('AUTH_4_ONBOARDING_PHONE_VERIFY_VERIFY_CO');
                                logFirebaseEvent('Button_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                
                                final smsCodeVal = _model.pinCodeController!.text;
                                if (smsCodeVal.isEmpty) {
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Enter SMS verification code.'),
                                      backgroundColor: Colors.orange,
                                    ),
                                  );
                                  return;
                                }
                                
                                final phoneVerifiedUser = await authManager.verifySmsCode(
                                  context: context,
                                  smsCode: smsCodeVal,
                                );
                                
                                if (phoneVerifiedUser == null) {
                                  return;
                                }

                                logFirebaseEvent('Button_navigate_to');
                                
                                if (widget.isLogin == true) {
                                  context.pushNamedAuth(
                                    Auth4OnboardingOneWidget.routeName,
                                    context.mounted,
                                    queryParameters: {
                                      'index': serializeParam(1, ParamType.int),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.goNamedAuth(
                                    Auth4OnboardingOneWidget.routeName,
                                    context.mounted,
                                    queryParameters: {
                                      'index': serializeParam(1, ParamType.int),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.leftToRight,
                                        duration: Duration(milliseconds: 250),
                                      ),
                                    },
                                  );
                                }
                              },
                              text: 'Verify Code',
                              options: FFButtonOptions(
                                height: isTabletMode ? 56.0 : (isUltraNarrow ? 44.0 : (isFoldedMode ? 48.0 : 52.0)),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  isTabletMode ? 60.0 : (isUltraNarrow ? 20.0 : (isFoldedMode ? 36.0 : 44.0)), 
                                  0.0, 
                                  isTabletMode ? 60.0 : (isUltraNarrow ? 20.0 : (isFoldedMode ? 36.0 : 44.0)), 
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
