import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'panic_screen_widget.dart' show PanicScreenWidget;
import 'package:flutter/material.dart';

class PanicScreenModel extends FlutterFlowModel<PanicScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetAuthToken)] action in Button widget.
  ApiCallResponse? authtoken;
  // Stores action output result for [Backend Call - API (zenzoapi)] action in Button widget.
  ApiCallResponse? apiResultqnv;
  // Stores action output result for [Backend Call - API (Zohoauth)] action in Button widget.
  ApiCallResponse? zohoauthtoken1;
  // Stores action output result for [Backend Call - API (zohocreatelead)] action in Button widget.
  ApiCallResponse? apiResult05e;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
