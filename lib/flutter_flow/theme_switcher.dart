import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elderblisscare1/flutter_flow/theme_controller.dart';
import 'package:elderblisscare1/flutter_flow/flutter_flow_theme.dart';

/// Theme Switcher Widget for toggling between light and dark modes.
/// 
/// This widget provides an accessible, easy-to-use interface for elderly users
/// to switch between light and dark themes. It works with the ThemeController
/// to persist user preference.
/// 
/// Usage:
/// ```dart
/// ThemeSwitcher()
/// ```
class ThemeSwitcher extends StatelessWidget {
  final bool compact;
  final VoidCallback? onThemeChanged;

  const ThemeSwitcher({
    Key? key,
    this.compact = false,
    this.onThemeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final theme = FlutterFlowTheme.of(context);

    if (compact) {
      // Compact icon button version for app bars/toolbars
      return IconButton(
        icon: Icon(
          themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          color: theme.primary,
          semanticLabel: 'Toggle ${themeController.isDarkMode ? 'light' : 'dark'} mode',
        ),
        onPressed: () async {
          await themeController.toggleTheme();
          onThemeChanged?.call();
        },
        tooltip: 'Switch to ${themeController.isDarkMode ? 'Light' : 'Dark'} Mode',
      );
    }

    // Full widget version for settings/profile pages
    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.alternate),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.palette,
                color: theme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme Settings',
                      style: theme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Current: ${themeController.themeName}',
                      style: theme.bodySmall.copyWith(
                        color: theme.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Theme toggle options
          Row(
            children: [
              Expanded(
                child: ThemeOptionButton(
                  icon: Icons.light_mode,
                  label: 'Light Mode',
                  isSelected: !themeController.isDarkMode,
                  onTap: () async {
                    await themeController.setThemeMode(ThemeMode.light);
                    onThemeChanged?.call();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ThemeOptionButton(
                  icon: Icons.dark_mode,
                  label: 'Dark Mode',
                  isSelected: themeController.isDarkMode,
                  onTap: () async {
                    await themeController.setThemeMode(ThemeMode.dark);
                    onThemeChanged?.call();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Info text
          Text(
            'Dark mode reduces eye strain and improves readability in low light conditions.',
            style: theme.bodySmall.copyWith(
              color: theme.secondaryText,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Individual theme option button with large touch target for accessibility
class ThemeOptionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ThemeOptionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ThemeOptionButton> createState() => _ThemeOptionButtonState();
}

class _ThemeOptionButtonState extends State<ThemeOptionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? theme.primary.withOpacity(0.1)
                : theme.primaryBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.isSelected ? theme.primary : theme.alternate,
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: theme.primary.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: widget.isSelected ? theme.primary : theme.secondaryText,
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: theme.labelMedium.copyWith(
                  color: widget.isSelected ? theme.primary : theme.secondaryText,
                  fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
