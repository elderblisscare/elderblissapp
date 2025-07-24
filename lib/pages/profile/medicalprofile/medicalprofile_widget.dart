import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'medicalprofile_model.dart';
export 'medicalprofile_model.dart';

class MedicalprofileWidget extends StatefulWidget {
  const MedicalprofileWidget({super.key});

  static String routeName = 'medicalprofile';
  static String routePath = 'medicalprofile';

  @override
  State<MedicalprofileWidget> createState() => _MedicalprofileWidgetState();
}

class _MedicalprofileWidgetState extends State<MedicalprofileWidget> {
  late MedicalprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicalprofileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'medicalprofile'});
    _model.textController1 ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.medicalCondition, ''));
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.drugAllergy, ''));
    _model.textFieldFocusNode3 ??= FocusNode();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('MEDICALPROFILE_arrow_back_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Medical Info',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.sora(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height - kToolbarHeight - MediaQuery.of(context).padding.top,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Card - Display Name
                  Container(
                    margin: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary,
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, -1.0),
                        end: AlignmentDirectional(1.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
                          offset: Offset(0.0, 8.0),
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 28.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                              size: 32.0,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Display Name',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.sora(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(height: 16.0),
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(),
                                        color: Colors.white70,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(),
                                        color: Colors.white60,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.6),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.2),
                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                cursorColor: Colors.white,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Content Cards
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Blood Group Card
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate.withOpacity(0.3),
                              width: 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 24.0,
                                color: Colors.black.withOpacity(0.08),
                                offset: Offset(0.0, 8.0),
                                spreadRadius: 0.0,
                              ),
                              BoxShadow(
                                blurRadius: 6.0,
                                color: Colors.black.withOpacity(0.04),
                                offset: Offset(0.0, 2.0),
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(28.0, 28.0, 28.0, 28.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsetsDirectional.all(16.0),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                        FlutterFlowTheme.of(context).secondary.withOpacity(0.1),
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(-1.0, -1.0),
                                      end: AlignmentDirectional(1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.bloodtype_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Blood Group',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.sora(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).alternate.withOpacity(0.5),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('A+'),
                                        ChipData('A-'),
                                        ChipData('B+'),
                                        ChipData('B-'),
                                        ChipData('O+'),
                                        ChipData('O-'),
                                        ChipData('AB+'),
                                        ChipData('AB-')
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.choiceChipsValue = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: FlutterFlowTheme.of(context).primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(),
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                        iconSize: 18.0,
                                        elevation: 2.0,
                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                        borderWidth: 1.0,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized: _model.choiceChipsValue != null,
                                      alignment: WrapAlignment.center,
                                      controller: _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                        [
                                          valueOrDefault(
                                              currentUserDocument?.bloodGroup, '')
                                        ],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 24.0),
                        
                                                 // Medical Conditions Card
                         Container(
                           width: MediaQuery.sizeOf(context).width,
                           decoration: BoxDecoration(
                             color: FlutterFlowTheme.of(context).secondaryBackground,
                             borderRadius: BorderRadius.circular(24.0),
                             border: Border.all(
                               color: FlutterFlowTheme.of(context).alternate.withOpacity(0.3),
                               width: 1.0,
                             ),
                             boxShadow: [
                               BoxShadow(
                                 blurRadius: 24.0,
                                 color: Colors.black.withOpacity(0.08),
                                 offset: Offset(0.0, 8.0),
                                 spreadRadius: 0.0,
                               ),
                               BoxShadow(
                                 blurRadius: 6.0,
                                 color: Colors.black.withOpacity(0.04),
                                 offset: Offset(0.0, 2.0),
                                 spreadRadius: 0.0,
                               ),
                             ],
                           ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(28.0, 28.0, 28.0, 28.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsetsDirectional.all(16.0),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF4CAF50).withOpacity(0.1),
                                        Color(0xFF2E7D32).withOpacity(0.1),
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(-1.0, -1.0),
                                      end: AlignmentDirectional(1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.health_and_safety_rounded,
                                    color: Color(0xFF4CAF50),
                                    size: 32.0,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Medical Conditions',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.sora(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(height: 20.0),
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Enter any medical conditions...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(),
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 3,
                                      minLines: 3,
                                      cursorColor: FlutterFlowTheme.of(context).primary,
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 24.0),
                        
                                                 // Drug Allergies Card
                         Container(
                           width: MediaQuery.sizeOf(context).width,
                           decoration: BoxDecoration(
                             color: FlutterFlowTheme.of(context).secondaryBackground,
                             borderRadius: BorderRadius.circular(24.0),
                             border: Border.all(
                               color: FlutterFlowTheme.of(context).alternate.withOpacity(0.3),
                               width: 1.0,
                             ),
                             boxShadow: [
                               BoxShadow(
                                 blurRadius: 24.0,
                                 color: Colors.black.withOpacity(0.08),
                                 offset: Offset(0.0, 8.0),
                                 spreadRadius: 0.0,
                               ),
                               BoxShadow(
                                 blurRadius: 6.0,
                                 color: Colors.black.withOpacity(0.04),
                                 offset: Offset(0.0, 2.0),
                                 spreadRadius: 0.0,
                               ),
                             ],
                           ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(28.0, 28.0, 28.0, 28.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsetsDirectional.all(16.0),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFFF9800).withOpacity(0.1),
                                        Color(0xFFE65100).withOpacity(0.1),
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(-1.0, -1.0),
                                      end: AlignmentDirectional(1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.warning_rounded,
                                    color: Color(0xFFFF9800),
                                    size: 32.0,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Drug Allergies',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.sora(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(height: 20.0),
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    child: TextFormField(
                                      controller: _model.textController3,
                                      focusNode: _model.textFieldFocusNode3,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Enter any drug allergies...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(),
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 3,
                                      minLines: 3,
                                      cursorColor: FlutterFlowTheme.of(context).primary,
                                      validator: _model.textController3Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 32.0),
                         
                         // Save Button
                         FFButtonWidget(
                           onPressed: () async {
                             logFirebaseEvent('MEDICALPROFILE_SAVE_INFORMATION_BTN_ON_T');
                             logFirebaseEvent('Button_backend_call');
                             
                             final userName = _model.textController1.text.trim();
                             
                             // Update Firebase Auth displayName if name changed
                             if (userName != currentUserDisplayName && userName.isNotEmpty) {
                               if (FirebaseAuth.instance.currentUser != null) {
                                 await FirebaseAuth.instance.currentUser!.updateDisplayName(userName);
                               }
                               // Update app state
                               FFAppState().name = userName;
                             }
                             
                             // Update Firestore user document
                             await currentUserReference!.update(createUsersRecordData(
                               displayName: userName,
                               bloodGroup: _model.choiceChipsValue,
                               medicalCondition: _model.textController2.text,
                               drugAllergy: _model.textController3.text,
                             ));
                             
                             logFirebaseEvent('Button_show_snack_bar');
                             ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                 content: Row(
                                   children: [
                                     Icon(
                                       Icons.check_circle,
                                       color: Colors.white,
                                       size: 24.0,
                                     ),
                                     SizedBox(width: 12.0),
                                     Expanded(
                                       child: Text(
                                         'Medical information saved successfully!',
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.w600,
                                           fontSize: 16.0,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 duration: Duration(milliseconds: 4000),
                                 backgroundColor: Color(0xFF4CAF50),
                                 behavior: SnackBarBehavior.floating,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(16.0),
                                 ),
                                 margin: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                               ),
                             );
                             
                             logFirebaseEvent('Button_navigate_to');
                             context.pushNamed(ProfileWidget.routeName);
                           },
                           text: 'Save Information',
                           options: FFButtonOptions(
                             width: MediaQuery.sizeOf(context).width,
                             height: 56.0,
                             padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                             iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                             color: FlutterFlowTheme.of(context).primary,
                             textStyle: FlutterFlowTheme.of(context)
                                 .titleMedium
                                 .override(
                                   font: GoogleFonts.inter(
                                     fontWeight: FontWeight.w600,
                                   ),
                                   color: Colors.white,
                                   letterSpacing: 0.0,
                                   fontWeight: FontWeight.w600,
                                 ),
                             elevation: 4.0,
                             borderSide: BorderSide(
                               color: Colors.transparent,
                               width: 0.0,
                             ),
                             borderRadius: BorderRadius.circular(16.0),
                           ),
                         ),
                        
                        // Bottom spacing for safe area
                        SizedBox(height: 32.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



