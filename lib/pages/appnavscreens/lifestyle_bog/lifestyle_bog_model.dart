import '/components/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lifestyle_bog_widget.dart' show LifestyleBogWidget;
import 'package:flutter/material.dart';

class LifestyleBogModel extends FlutterFlowModel<LifestyleBogWidget> {
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
