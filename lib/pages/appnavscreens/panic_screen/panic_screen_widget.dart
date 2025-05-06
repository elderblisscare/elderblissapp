import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'panic_screen_model.dart';
export 'panic_screen_model.dart';

class PanicScreenWidget extends StatefulWidget {
  const PanicScreenWidget({super.key});

  static String routeName = 'panicScreen';
  static String routePath = 'panicScreen';

  @override
  State<PanicScreenWidget> createState() => _PanicScreenWidgetState();
}

class _PanicScreenWidgetState extends State<PanicScreenWidget> {
  late PanicScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanicScreenModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'panicScreen'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
        backgroundColor: FlutterFlowTheme.of(context).error,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sending request...',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.sora(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('PANIC_SCREEN_REQUEST_CALL_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');
                      _model.authtoken = await GetAuthTokenCall.call();

                      if (GetAuthTokenCall.accesstoken(
                                (_model.authtoken?.jsonBody ?? ''),
                              ) !=
                              null &&
                          GetAuthTokenCall.accesstoken(
                                (_model.authtoken?.jsonBody ?? ''),
                              ) !=
                              '') {
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().authtoken = GetAuthTokenCall.accesstoken(
                          (_model.authtoken?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});
                        logFirebaseEvent('Button_backend_call');
                        _model.apiResultqnv = await ZenzoapiCall.call(
                          authToken: FFAppState().authtoken,
                          phonenumber: currentPhoneNumber,
                        );
                      }
                      logFirebaseEvent('Button_backend_call');
                      _model.zohoauthtoken1 = await ZohoauthCall.call();

                      if (ZohoauthCall.zohoauthtoken(
                                (_model.zohoauthtoken1?.jsonBody ?? ''),
                              ) !=
                              null &&
                          ZohoauthCall.zohoauthtoken(
                                (_model.zohoauthtoken1?.jsonBody ?? ''),
                              ) !=
                              '') {
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().zohoauthtoken = ZohoauthCall.zohoauthtoken(
                          (_model.zohoauthtoken1?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});
                        logFirebaseEvent('Button_backend_call');
                        _model.apiResult05e = await ZohocreateleadCall.call(
                          accesstoken: FFAppState().zohoauthtoken,
                          name: currentUserDisplayName,
                          phonenumber: currentPhoneNumber,
                        );
                      }
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(DashboardWidget.routeName);

                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Callback Requested',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 5699),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );

                      safeSetState(() {});
                    },
                    text: 'Request Call',
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).error,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('PANIC_SCREEN_PAGE_CANCEL_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.goNamed(DashboardWidget.routeName);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).error,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
