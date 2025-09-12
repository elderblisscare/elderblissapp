import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = 'profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_PAGE_Profile_ON_INIT_STATE');
      logFirebaseEvent('Profile_haptic_feedback');
      HapticFeedback.mediumImpact();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // --- GALAXY FOLD RESPONSIVE SCALING LOGIC ---
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 375.0;

    // Get accessibility text scale factor and clamp it to prevent UI breakage
    final accessibilityTextScale = MediaQuery.textScalerOf(context).scale(1.0);
    final clampedTextScale = accessibilityTextScale.clamp(1.0, 1.3); // Max 130% for accessibility

    // Galaxy Fold optimization: Detect very narrow screens (≤ 340px ≈ 2.64 inches)
    final bool isVeryNarrowScreen = screenWidth <= 340;
    
    // Adjust scaling factors for Galaxy Fold and similar devices
    final double layoutScaleFactor = isVeryNarrowScreen 
        ? (screenWidth / 320.0).clamp(0.85, 1.0) // Use 320px as base for narrow screens
        : (screenWidth / baseWidth).clamp(1.0, 1.2);
        
    final double fontScaleFactor = isVeryNarrowScreen
        ? ((screenWidth / 320.0) * clampedTextScale).clamp(0.9, 1.1) // Ensure readable text on narrow screens
        : ((screenWidth / baseWidth) * clampedTextScale).clamp(1.0, 1.15);
    // --- END OF RESPONSIVE SCALING LOGIC ---

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Profile Header - Optimized for Galaxy Fold
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor,
                      (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor,
                      (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor,
                      0.0
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 
                              (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                              0.0, 
                              (isVeryNarrowScreen ? 4.0 : 6.0) * layoutScaleFactor
                          ),
                          child: Text(
                            'Hi',
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
                                  fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  font: GoogleFonts.sora(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                                  fontSize: (isVeryNarrowScreen ? 24.0 : 32.0) * fontScaleFactor,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 
                              (isVeryNarrowScreen ? 16.0 : 24.0) * layoutScaleFactor, 
                              0.0, 
                              0.0
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(8.0 * layoutScaleFactor),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).accent1,
                              ),
                            ),
                          ),
                        ),
                        // Profile Menu - Optimized for Galaxy Fold
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 
                              (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor, 
                              0.0, 
                              0.0
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_PAGE_EditProfileTile_ON_TAP');
                                  logFirebaseEvent(
                                      'EditProfileTile_navigate_to');

                                  context.pushNamed(
                                      MedicalprofileWidget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor, 
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PROFILE_PAGE_Row_ya8doloq_ON_TAP');
                                          logFirebaseEvent('Row_navigate_to');

                                          context.pushNamed(
                                              MedicalprofileWidget.routeName);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                              height: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all((isVeryNarrowScreen ? 3.0 : 4.0) * layoutScaleFactor),
                                                child: Icon(
                                                  Icons.person_outline_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: (isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      (isVeryNarrowScreen ? 12.0 : 18.0) * layoutScaleFactor, 
                                                      0.0, 
                                                      0.0, 
                                                      0.0
                                                  ),
                                              child: Text(
                                                'Edit Profile',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_PAGE_MyFamily_ON_TAP');
                                  logFirebaseEvent('MyFamily_navigate_to');

                                  context
                                      .pushNamed(MyFamilyinfoWidget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor, 
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                            height: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all((isVeryNarrowScreen ? 3.0 : 4.0) * layoutScaleFactor),
                                              child: Icon(
                                                Icons.people,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: (isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    (isVeryNarrowScreen ? 12.0 : 18.0) * layoutScaleFactor, 
                                                    0.0, 
                                                    0.0, 
                                                    0.0
                                                ),
                                            child: Text(
                                              'My Family',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_PAGE_AboutUsTile_ON_TAP');
                                  logFirebaseEvent('AboutUsTile_navigate_to');

                                  context.pushNamed(AboutUsWidget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor, 
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                            height: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all((isVeryNarrowScreen ? 3.0 : 4.0) * layoutScaleFactor),
                                              child: Icon(
                                                Icons.info_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: (isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    (isVeryNarrowScreen ? 12.0 : 18.0) * layoutScaleFactor, 
                                                    0.0, 
                                                    0.0, 
                                                    0.0
                                                ),
                                            child: Text(
                                              'About Us',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_PAGE_ContactUsTile_ON_TAP');
                                  logFirebaseEvent('ContactUsTile_navigate_to');

                                  context.pushNamed(ContactusWidget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor, 
                                          0.0, 
                                          (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                            height: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all((isVeryNarrowScreen ? 3.0 : 4.0) * layoutScaleFactor),
                                              child: Icon(
                                                Icons.mail_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: (isVeryNarrowScreen ? 16.0 : 20.0) * layoutScaleFactor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    (isVeryNarrowScreen ? 12.0 : 18.0) * layoutScaleFactor, 
                                                    0.0, 
                                                    0.0, 
                                                    0.0
                                                ),
                                            child: Text(
                                              'Contact Us',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 
                                    (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor, 
                                    0.0, 
                                    (isVeryNarrowScreen ? 8.0 : 12.0) * layoutScaleFactor
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROFILE_PAGE_LogoutTile_ON_TAP');
                                    logFirebaseEvent('LogoutTile_auth');
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(SplashWidget.routeName,
                                        context.mounted);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                        height: (isVeryNarrowScreen ? 32.0 : 40.0) * layoutScaleFactor,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all((isVeryNarrowScreen ? 3.0 : 4.0) * layoutScaleFactor),
                                          child: Icon(
                                            Icons.logout,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: (isVeryNarrowScreen ? 14.0 : 18.0) * layoutScaleFactor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            (isVeryNarrowScreen ? 12.0 : 18.0) * layoutScaleFactor, 
                                            0.0, 
                                            0.0, 
                                            0.0
                                        ),
                                        child: Text(
                                          'Log out',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: (isVeryNarrowScreen ? 14.0 : 16.0) * fontScaleFactor,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
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
                      ].addToEnd(SizedBox(height: (isVeryNarrowScreen ? 32.0 : 44.0) * layoutScaleFactor)),
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
}
