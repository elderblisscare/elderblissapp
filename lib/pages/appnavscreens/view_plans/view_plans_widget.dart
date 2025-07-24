import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_plans_model.dart';
export 'view_plans_model.dart';

// Define a data model for your plans for better organization and reusability
class Plan {
  final String name;
  final String tagline;
  final String price;
  final String billingCycle;
  final List<String> features;
  final bool isFeatured; // Optional: to highlight a specific plan

  Plan({
    required this.name,
    required this.tagline,
    required this.price,
    required this.billingCycle,
    required this.features,
    this.isFeatured = false,
  });
}

class ViewPlansWidget extends StatefulWidget {
  const ViewPlansWidget({super.key});

  static String routeName = 'View_plans';
  static String routePath = 'viewPlans';

  @override
  State<ViewPlansWidget> createState() => _ViewPlansWidgetState();
}

class _ViewPlansWidgetState extends State<ViewPlansWidget> {
  late ViewPlansModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Define your plans using the Plan data model
  final List<Plan> plans = [
    Plan(
      name: 'Bliss 911',
      tagline: 'Emergency Care plan for Active Elders',
      price: '₹499',
      billingCycle: '/Month (Billed Annually)',
      features: [
        '24/7 Emergency Coordination',
        'Doctor Tele-Consultation',
        'Wellness Assistance Center',
        'Dedicated Elderbliss Guardian',
        'Care Manager',
        'Digital Dashboard',
        'Value added services',
        'Travel Helpdesk',
        'Digital Medical Records',
      ],
    ),
    Plan(
      name: 'Bliss Lifestyle',
      tagline: 'Everyday Wellness & Support for Graceful Aging',
      price: '₹2100',
      billingCycle: '/Month (Billed Annually)',
      features: [
        '24/7 Emergency Response',
        'Unlimited Doctor Tele-Consultation',
        'One BLS Ambulance Complimentary',
        'Dedicated Elderbliss Guardian',
        'Care Manager',
        'Full Body Check-up',
        'Health Parameters Monitoring',
        'Dentist Consultation',
        'Care Companion',
        'Wellness Assistance Center',
        'Digital Dashboard',
        'Value added services',
        'Travel Helpdesk',
        'Digital Medical Records',
      ],
      isFeatured: true, // Example of highlighting a plan
    ),
    Plan(
      name: 'Bliss Social',
      tagline: 'Companionship, Conversation & Care',
      price: '₹5000',
      billingCycle: '/Month (Billed Annually)',
      features: [
        '24/7 Emergency Response',
        'Dedicated Elderbliss Guardian',
        'Engagement Activities',
        'Daily care calls',
        'Weekly Visits',
        'Complete Companionship for elders',
        'Wellness Assistance Center',
        'Digital Dashboard',
        'Value added services',
        'Travel Helpdesk',
        'Digital Medical Records',
      ],
    ),
    Plan(
      name: 'Bliss Healthplus',
      tagline: 'Proactive Health Support for Safer Aging',
      price: '₹5500',
      billingCycle: '/Month (Billed Annually)',
      features: [
        '24/7 Emergency Response',
        'Unlimited Doctor Tele-Consultation',
        'Monthly Doctor visit',
        'Two BLS Ambulance Complimentary',
        'Dedicated Elderbliss Guardian',
        'Care Manager',
        'Full Body Check-up',
        'Health Parameters Monitoring',
        'Dentist Consultation',
        'Care Companion',
        'Wellness Assistance Center',
        'Digital Dashboard',
        'Value added services',
        'Travel Helpdesk',
        'Digital Medical Records',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPlansModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'View_plans'});
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gradient Header Section - Similar to Services page
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Your Plan',
                          style: FlutterFlowTheme.of(context).headlineLarge.override(
                            fontFamily: GoogleFonts.sora().fontFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Select the perfect plan tailored for your healthcare needs',
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            color: Color(0xFFE0E0E0),
                            letterSpacing: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Plans List
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                    child: Column(
                      children: [
                        ...plans.map((plan) => _buildPlanCard(context, plan)).toList()
                            .divide(SizedBox(height: 20.0)),
                        const SizedBox(height: 40.0), // Spacing before the consultation card
                        _buildConsultationCard(context), // Add the new consultation card
                        const SizedBox(height: 60.0), // Added more height at the end of the page
                      ],
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

  // Reusable Widget for a Plan Card - Enhanced design
  Widget _buildPlanCard(BuildContext context, Plan plan) {
    final bool isFeatured = plan.isFeatured;
    return Material(
      color: Colors.transparent,
      elevation: isFeatured ? 8.0 : 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isFeatured
              ? Color(0xFFFFF7ED) // Bright background for featured plan - used previously in LifestyleBog
              : FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: isFeatured
              ? Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                )
              : Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
          // Removed gradient for featured plan to use solid bright color
          // gradient: isFeatured ? LinearGradient(...) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plan Name and Tagline
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        'RECOMMENDED',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                ],
              ),
              if (isFeatured) const SizedBox(height: 12.0),
              Text(
                plan.name,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: GoogleFonts.sora().fontFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w700,
                      color: isFeatured
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                plan.tagline,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      letterSpacing: 0.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      lineHeight: 1.4,
                    ),
              ),
              const SizedBox(height: 24.0),

              // Price and Billing Cycle
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    plan.price,
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: GoogleFonts.sora().fontFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
                    child: Text(
                      plan.billingCycle,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Features List with improved design
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: plan.features.map((feature) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 18.0,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Text(
                            feature,
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  letterSpacing: 0.0,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  lineHeight: 1.4,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32.0),

              // Select Plan Button - Enhanced design and WhatsApp redirection
              FFButtonWidget(
                onPressed: () async {
                  try {
                    logFirebaseEvent('VIEW_PLANS_SELECT_PLAN_BTN_ON_TAP');
                  } catch (e) {
                    // Continue even if logging fails
                    print('Firebase logging error: $e');
                  }
                  await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                },
                text: 'Select ${plan.name} Plan',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 56.0,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: isFeatured
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: isFeatured
                            ? FlutterFlowTheme.of(context).info
                            : FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                  elevation: isFeatured ? 6.0 : 2.0,
                  borderRadius: BorderRadius.circular(28.0),
                  borderSide: isFeatured
                      ? BorderSide.none
                      : BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // New Widget for the "Still Not Sure?" consultation card
  Widget _buildConsultationCard(BuildContext context) {
    return Material(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary.withOpacity(0.08),
              FlutterFlowTheme.of(context).secondary.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Still Not Sure?',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                            fontFamily: GoogleFonts.sora().fontFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w700,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                'Get a free consultation to find the perfect plan for your needs. Our experts are here to guide you through your healthcare journey!',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      letterSpacing: 0.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      lineHeight: 1.5,
                    ),
              ),
              const SizedBox(height: 24.0),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('VIEW_PLANS_CONSULTATION_BTN_ON_TAP');
                  await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                },
                text: 'Get Free Consultation',
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: FlutterFlowTheme.of(context).info,
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 56.0,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary, // Changed to app's primary color
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(28.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}