import 'package:flutter/material.dart';
import 'package:elderblisscare1/flutter_flow/flutter_flow_theme.dart';
import 'package:elderblisscare1/flutter_flow/theme_switcher.dart';

/// Example Widget: How to add Theme Switcher to Profile/Settings Page
/// 
/// This is a reference implementation. Copy relevant parts to your actual
/// Profile page (typically lib/pages/profile/profile_widget.dart)

class ProfilePageWithThemeExample extends StatefulWidget {
  const ProfilePageWithThemeExample({Key? key}) : super(key: key);

  @override
  State<ProfilePageWithThemeExample> createState() =>
      _ProfilePageWithThemeExampleState();
}

class _ProfilePageWithThemeExampleState
    extends State<ProfilePageWithThemeExample> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: theme.primary,
        elevation: 0,
      ),
      backgroundColor: theme.primaryBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section Header
            Text(
              'Account Settings',
              style: theme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Profile Info Card (Example)
            Container(
              decoration: BoxDecoration(
                color: theme.secondaryBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.alternate),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: theme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.person,
                      color: theme.primary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: theme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '+91 9151 5385 42',
                          style: theme.bodySmall.copyWith(
                            color: theme.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Display Settings Section
            Text(
              'Display & Appearance',
              style: theme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // THEME SWITCHER WIDGET - This is the main addition
            ThemeSwitcher(
              compact: false,
              onThemeChanged: () {
                // Optional: Show a snackbar or perform other actions
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Theme updated'),
                    backgroundColor: theme.primary,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Other Settings (Examples)
            Text(
              'Notifications',
              style: theme.headlineSmall,
            ),
            const SizedBox(height: 16),

            SettingsTile(
              icon: Icons.notifications,
              title: 'Push Notifications',
              subtitle: 'Emergency alerts and updates',
              value: true,
              onChanged: (value) {
                // Handle notification settings
              },
            ),

            const SizedBox(height: 12),

            SettingsTile(
              icon: Icons.text_fields,
              title: 'Larger Text',
              subtitle: 'Increase font size for readability',
              value: false,
              onChanged: (value) {
                // Handle text size settings
              },
            ),

            const SizedBox(height: 24),

            // About Section
            Text(
              'About',
              style: theme.headlineSmall,
            ),
            const SizedBox(height: 16),

            ListTile(
              title: Text(
                'Version',
                style: theme.bodyMedium,
              ),
              trailing: Text(
                '2.0.0',
                style: theme.bodySmall.copyWith(
                  color: theme.secondaryText,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.error,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: theme.titleSmall.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable Settings Toggle Tile
class SettingsTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;

  const SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.alternate),
      ),
      child: ListTile(
        leading: Icon(widget.icon, color: theme.primary),
        title: Text(widget.title, style: theme.bodyMedium),
        subtitle: Text(
          widget.subtitle,
          style: theme.bodySmall.copyWith(color: theme.secondaryText),
        ),
        trailing: Switch(
          value: widget.value,
          onChanged: widget.onChanged,
          activeColor: theme.primary,
        ),
      ),
    );
  }
}
