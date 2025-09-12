import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'splashscreena_authenticated_model.dart';
export 'splashscreena_authenticated_model.dart';

class SplashscreenaAuthenticatedWidget extends StatefulWidget {
  const SplashscreenaAuthenticatedWidget({super.key});

  static String routeName = 'SplashscreenaAuthenticated';
  static String routePath = 'splashscreenaAuthenticated';

  @override
  State<SplashscreenaAuthenticatedWidget> createState() =>
      _SplashscreenaAuthenticatedWidgetState();
}

class _SplashscreenaAuthenticatedWidgetState
    extends State<SplashscreenaAuthenticatedWidget> {
  late SplashscreenaAuthenticatedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashscreenaAuthenticatedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SplashscreenaAuthenticated'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASHSCREENA_AUTHENTICATED_Splashscreen');
      logFirebaseEvent('SplashscreenaAuthenticated_navigate_to');

      context.goNamed(DashboardWidget.routeName);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: 469.8,
            height: 839.5,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/MG_4799.JPG',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
