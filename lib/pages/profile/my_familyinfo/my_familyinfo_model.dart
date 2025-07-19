import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_familyinfo_widget.dart' show MyFamilyinfoWidget;
import 'package:flutter/material.dart';

class MyFamilyinfoModel extends FlutterFlowModel<MyFamilyinfoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameValidator;
  
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneValidator;
  
  // State field(s) for Email widget (optional, not used in current implementation)
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailValidator;
  
  // State field(s) for Relationship selection
  String? selectedRelationship;
  FormFieldController<List<String>>? relationshipController;

  @override
  void initState(BuildContext context) {
    // Initialize controllers if needed
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();
    
    phoneFocusNode?.dispose();
    phoneController?.dispose();
    
    emailFocusNode?.dispose();
    emailController?.dispose();
  }
}
