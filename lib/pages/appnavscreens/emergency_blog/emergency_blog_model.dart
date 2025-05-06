import '/components/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'emergency_blog_widget.dart' show EmergencyBlogWidget;
import 'package:flutter/material.dart';

class EmergencyBlogModel extends FlutterFlowModel<EmergencyBlogWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
  }
}
