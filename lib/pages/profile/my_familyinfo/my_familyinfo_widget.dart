import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_familyinfo_model.dart';
export 'my_familyinfo_model.dart';

class MyFamilyinfoWidget extends StatefulWidget {
  const MyFamilyinfoWidget({super.key});

  static String routeName = 'MyFamilyinfo';
  static String routePath = 'myFamilyinfo';

  @override
  State<MyFamilyinfoWidget> createState() => _MyFamilyinfoWidgetState();
}

class _MyFamilyinfoWidgetState extends State<MyFamilyinfoWidget> {
  late MyFamilyinfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _hasShownTooltip = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyFamilyinfoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyFamilyinfo'});
    
    _model.nameController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();
    
    _model.phoneController ??= TextEditingController();
    _model.phoneFocusNode ??= FocusNode();
    
    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    // Show tooltip after the widget is built if no contact exists
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkAndShowTooltip());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _checkAndShowTooltip() {
    if (!_hasShownTooltip && 
        (currentUserDocument?.nameEmergency?.isEmpty ?? true) && 
        (currentUserDocument?.contactEmergency?.isEmpty ?? true)) {
      _showAddContactTooltip();
      _hasShownTooltip = true;
    }
  }

  void _showAddContactTooltip() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0.0, 8.0),
                ),
              ],
            ),
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
                    Icons.touch_app,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 48.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Add Your Emergency Contact',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.sora(fontWeight: FontWeight.w600),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tap the ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          letterSpacing: 0.0,
                        ),
                      ),
                      TextSpan(
                        text: '+ icon',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' in the top-right corner to add your emergency contact information.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          letterSpacing: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Look for the + button above',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.inter(),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                FFButtonWidget(
                  onPressed: () => Navigator.pop(context),
                  text: 'Got it!',
                  options: FFButtonOptions(
                    width: 120.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                    elevation: 4.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddEditContactModal() {
    // Pre-populate with existing data
    _model.nameController?.text = currentUserDocument?.nameEmergency ?? '';
    _model.phoneController?.text = currentUserDocument?.contactEmergency ?? '';
    _model.emailController?.text = ''; // Email not stored in original schema
    _model.selectedRelationship = currentUserDocument?.relationEmergency;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) => GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.85,
                child: _buildContactFormModal(setModalState),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactFormModal(StateSetter setModalState) {
    final bool hasExistingContact = (currentUserDocument?.nameEmergency?.isNotEmpty ?? false) ||
                                   (currentUserDocument?.contactEmergency?.isNotEmpty ?? false);

    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 60.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            SizedBox(height: 24.0),
            
            // Title
            Text(
              hasExistingContact ? 'Edit Emergency Contact' : 'Add Emergency Contact',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.sora(fontWeight: FontWeight.w600),
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 32.0),
            
            // Form fields
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Name field
                    _buildFormField(
                      controller: _model.nameController!,
                      focusNode: _model.nameFocusNode!,
                      label: 'Full Name',
                      hint: 'Enter contact name',
                      icon: Icons.person,
                    ),
                    SizedBox(height: 20.0),
                    
                    // Phone field
                    _buildFormField(
                      controller: _model.phoneController!,
                      focusNode: _model.phoneFocusNode!,
                      label: 'Phone Number',
                      hint: 'Enter phone number',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20.0),
                    
                    // Relationship selection
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.family_restroom,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Relationship',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(),
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            FlutterFlowChoiceChips(
                              options: [
                                ChipData('Spouse'),
                                ChipData('Child'),
                                ChipData('Parent'),
                                ChipData('Sibling'),
                                ChipData('Friend'),
                                ChipData('Caregiver'),
                                ChipData('Doctor'),
                                ChipData('Other'),
                              ],
                              onChanged: (val) => setModalState(() => _model.selectedRelationship = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.w600),
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
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
                              initialized: _model.selectedRelationship != null,
                              alignment: WrapAlignment.start,
                              controller: _model.relationshipController ??= FormFieldController<List<String>>(
                                _model.selectedRelationship != null ? [_model.selectedRelationship!] : [],
                              ),
                              wrapped: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 24.0),
            
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () => Navigator.pop(context),
                    text: 'Cancel',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () => _saveContact(),
                    text: hasExistingContact ? 'Update Contact' : 'Save Contact',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                      elevation: 4.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
            font: GoogleFonts.inter(),
            letterSpacing: 0.0,
          ),
          hintText: hint,
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
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
          contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
          prefixIcon: Icon(
            icon,
            color: FlutterFlowTheme.of(context).primary,
            size: 20.0,
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
          font: GoogleFonts.inter(),
          letterSpacing: 0.0,
        ),
        keyboardType: keyboardType,
        cursorColor: FlutterFlowTheme.of(context).primary,
      ),
    );
  }

  Future<void> _saveContact() async {
    if (_model.nameController?.text.isEmpty == true || 
        _model.phoneController?.text.isEmpty == true || 
        _model.selectedRelationship == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
      return;
    }

    try {
      // Save to users record
      await currentUserReference!.update(createUsersRecordData(
        nameEmergency: _model.nameController?.text ?? '',
        contactEmergency: _model.phoneController?.text ?? '',
        relationEmergency: _model.selectedRelationship,
      ));

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 24.0),
              SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  'Emergency contact saved successfully!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          duration: Duration(milliseconds: 3000),
          backgroundColor: Color(0xFF4CAF50),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
        ),
      );

      // Refresh the page
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving contact: $e'),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
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
              logFirebaseEvent('MY_FAMILYINFO_arrow_back_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'My Family',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.sora(fontWeight: FontWeight.w600),
              color: Colors.white,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () => _showAddEditContactModal(),
              ),
            ),
          ],
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
                  // Header Card
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
                              Icons.family_restroom,
                              color: Colors.white,
                              size: 32.0,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Emergency Contact',
                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                              font: GoogleFonts.sora(fontWeight: FontWeight.w600),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Manage your emergency contact information',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(),
                              color: Colors.white.withOpacity(0.8),
                              letterSpacing: 0.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Content
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Emergency Contact Display
                        AuthUserStreamWidget(
                          builder: (context) {
                            final hasContact = (currentUserDocument?.nameEmergency?.isNotEmpty ?? false) ||
                                            (currentUserDocument?.contactEmergency?.isNotEmpty ?? false);
                            
                            if (!hasContact) {
                              return _buildEmptyState();
                            }
                            
                            return _buildContactCard();
                          },
                        ),
                        
                        // Bottom spacing
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

  Widget _buildEmptyState() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 40.0),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(20.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(
              Icons.family_restroom,
              color: FlutterFlowTheme.of(context).primary,
              size: 48.0,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            'No Emergency Contact',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
              font: GoogleFonts.sora(fontWeight: FontWeight.w600),
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            'Add an emergency contact to ensure your loved ones can be reached when needed.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(),
              color: FlutterFlowTheme.of(context).secondaryText,
              letterSpacing: 0.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          FFButtonWidget(
            onPressed: () => _showAddEditContactModal(),
            text: 'Add Emergency Contact',
            options: FFButtonOptions(
              height: 50.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.w600),
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
        ],
      ),
    );
  }

  Widget _buildContactCard() {
    return Container(
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
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(12.0),
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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Icon(
                    Icons.person,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUserDocument?.nameEmergency ?? 'Unknown',
                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.sora(fontWeight: FontWeight.w600),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        currentUserDocument?.relationEmergency ?? 'Family Member',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => _showAddEditContactModal(),
                  child: Container(
                    padding: EdgeInsetsDirectional.all(8.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      currentUserDocument?.contactEmergency ?? 'No phone number',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => logFirebaseEvent('MY_FAMILYINFO_phone_call_action'),
                    child: Container(
                      padding: EdgeInsetsDirectional.all(8.0),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
