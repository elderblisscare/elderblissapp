import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth4_login_widget.dart' show Auth4LoginWidget;
import 'package:flutter/material.dart';

class Auth4LoginModel extends FlutterFlowModel<Auth4LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
