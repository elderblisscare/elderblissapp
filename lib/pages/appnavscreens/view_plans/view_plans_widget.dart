import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // <-- 1. NEW IMPORT FOR WHATSAPP ICON

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'view_plans_model.dart';
export 'view_plans_model.dart';

class Plan {
  final String name;
  final String tagline;
  final String price;
  final String pricePeriod;
  final String billingTerm;
  final List<String> features;
  final bool isFeatured;

  Plan({
    required this.name,
    required this.tagline,
    required this.price,
    required this.pricePeriod,
    required this.billingTerm,
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

  final List<Plan> plans = [
    Plan(
      name: 'Bliss 911',
      tagline: 'Emergency Care plan for Active Elders',
      price: '₹499',
      pricePeriod: '/Month',
      billingTerm: '(Billed Annually)',
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
      pricePeriod: '/Month',
      billingTerm: '(Billed Annually)',
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
      isFeatured: true,
    ),
    Plan(
      name: 'Bliss Social',
      tagline: 'Companionship, Conversation & Care',
      price: '₹5000',
      pricePeriod: '/Month',
      billingTerm: '(Billed Annually)',
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
      pricePeriod: '/Month',
      billingTerm: '(Billed Annually)',
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
    // --- RESPONSIVE SCALING LOGIC ---
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 375.0;

    final accessibilityTextScale = MediaQuery.textScalerOf(context).scale(1.0);
    final clampedTextScale = accessibilityTextScale.clamp(1.0, 1.3);

    final double layoutScaleFactor = (screenWidth / baseWidth).clamp(1.0, 1.2);

    final double fontScaleFactor = ((screenWidth / baseWidth) * clampedTextScale).clamp(1.0, 1.15);
    
    final double bottomNavHeight = MediaQuery.of(context).padding.bottom + 80;
    // --- END OF RESPONSIVE SCALING LOGIC ---

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gradient Header Section
                Container(
                  width: double.infinity,
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
                    padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Your Plan',
                          style: FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: GoogleFonts.sora().fontFamily,
                                color: Colors.white,
                                fontSize: 28 * fontScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 8.0 * layoutScaleFactor),
                        Text(
                          'Select the perfect plan tailored for your healthcare needs',
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                color: Color(0xFFE0E0E0),
                                fontSize: 16 * fontScaleFactor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Plans List
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                    child: Column(
                      children: [
                        ...plans.map((plan) => _buildPlanCard(context, plan, layoutScaleFactor, fontScaleFactor)).toList()
                            .divide(SizedBox(height: 20.0)),
                        const SizedBox(height: 40.0),
                        _buildConsultationCard(context, layoutScaleFactor, fontScaleFactor),
                        SizedBox(height: bottomNavHeight + 20),
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

  Widget _buildPlanCard(BuildContext context, Plan plan, double layoutScale, double fontScale) {
    final bool isFeatured = plan.isFeatured;
    final theme = FlutterFlowTheme.of(context);

    return Material(
      color: Colors.transparent,
      elevation: isFeatured ? 8.0 : 4.0,
      shadowColor: isFeatured ? Color(0xFFC71F38).withOpacity(0.6) : Color(0xFFFF5E5E).withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isFeatured ? Color(0xFFFFF7ED) : theme.secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: isFeatured ? Color(0xFFC71F38) : theme.alternate,
            width: isFeatured ? 2.0 : 1.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(28.0, 24.0, 28.0, 24.0),
                decoration: BoxDecoration(
                  color: isFeatured ? Color(0xFFC71F38) : Color(0xFFFF5E5E),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isFeatured)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'RECOMMENDED',
                          style: theme.labelSmall.override(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 11 * fontScale,
                                color: Colors.white,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    if (isFeatured) const SizedBox(height: 12.0),
                    Text(
                      plan.name,
                      style: theme.headlineMedium.override(
                            fontFamily: GoogleFonts.sora().fontFamily,
                            fontSize: 24 * fontScale,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                    ),
                    SizedBox(height: 8.0 * layoutScale),
                    Text(
                      plan.tagline,
                      style: theme.bodyMedium.override(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 14 * fontScale,
                            color: Colors.white.withOpacity(0.9),
                            lineHeight: 1.4,
                          ),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          plan.price,
                          style: theme.displaySmall.override(
                                fontFamily: GoogleFonts.sora().fontFamily,
                                fontSize: 32 * fontScale,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 4.0 * layoutScale, left: 8.0 * layoutScale),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  plan.pricePeriod,
                                  style: theme.bodyMedium.override(
                                        fontFamily: GoogleFonts.inter().fontFamily,
                                        fontSize: 14 * fontScale,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.2,
                                      ),
                                ),
                                Text(
                                  plan.billingTerm,
                                  style: theme.labelSmall.override(
                                        fontFamily: GoogleFonts.inter().fontFamily,
                                        fontSize: 12 * fontScale,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 28.0, 28.0, 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: plan.features.map((feature) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0 * layoutScale),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.0 * layoutScale),
                                decoration: BoxDecoration(
                                  color: theme.primary.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: theme.primary,
                                  size: 18.0 * layoutScale,
                                ),
                              ),
                              SizedBox(width: 12.0 * layoutScale),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: theme.bodyLarge.override(
                                        fontFamily: GoogleFonts.inter().fontFamily,
                                        fontSize: 15 * fontScale,
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
                    FFButtonWidget(
                      onPressed: () async {
                        await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                      },
                      text: 'Select ${plan.name} Plan',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        iconPadding: EdgeInsets.zero,
                        color: isFeatured ? Color(0xFFC71F38) : Color(0xFFFF5E5E),
                        textStyle: theme.titleMedium.override(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConsultationCard(BuildContext context, double layoutScale, double fontScale) {
    final theme = FlutterFlowTheme.of(context);
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
              theme.primary.withOpacity(0.08),
              theme.secondary.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: theme.primary.withOpacity(0.2),
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
                      color: theme.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.support_agent_rounded,
                      color: theme.primary,
                      size: 28.0,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Still Not Sure?',
                      style: theme.headlineMedium.override(
                            fontFamily: GoogleFonts.sora().fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                'Get a free consultation to find the perfect plan for your needs. Our experts are here to guide you through your healthcare journey!',
                style: theme.bodyLarge.override(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: theme.secondaryText,
                      lineHeight: 1.5,
                    ),
              ),
              const SizedBox(height: 24.0),
              FFButtonWidget(
                onPressed: () async {
                  await launchURL('https://wa.me/message/BFIUAWXCKN3BM1');
                },
                text: 'Get Free Consultation',
                // 2. UPDATED ICON
                icon: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: FlutterFlowTheme.of(context).info,
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 56.0,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  iconPadding: EdgeInsets.only(right: 8.0),
                  color: theme.primary,
                  textStyle: theme.titleMedium.override(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: theme.info,
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