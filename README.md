# altech_ui_flutter

<p align="center">
  <img src="https://raw.githubusercontent.com/Luxxn12/altech_ui_flutter/main/assets/images/logo-altech.png" alt="ALTECH Logo" width="320" />
</p>

<p align="center">
  Modern, reusable, and customizable Flutter UI components with Material 3, design tokens, and centralized theming.
</p>

## Preview (Partial Components)

These screenshots show only part of the component set. For the full list, check **Components** and run the `example` app.

<p align="center">
  <img src="https://raw.githubusercontent.com/Luxxn12/altech_ui_flutter/main/assets/images/showcase-cards-buttons.png" alt="Cards and Buttons Preview" width="100%" />
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/Luxxn12/altech_ui_flutter/main/assets/images/showcase-dialogs-sheets.png" alt="Dialogs and Sheets Preview" width="100%" />
</p>

## Highlights

- Material 3 first (`useMaterial3: true`)
- Light and dark theme support
- Centralized theme system via `AltechTheme`
- Token-driven design (`colors`, `typography`, `spacing`, `radius`, `shadow`)
- Components optimized for white and dark backgrounds
- Reusable + customizable API for production apps
- Responsive helpers for dashboard-style layouts

## Installation

```yaml
dependencies:
  altech_ui_flutter: ^2.0.1
```

## Quick Start

```dart
import 'package:altech_ui_flutter/altech_ui_flutter.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AltechTheme.light(),
      darkTheme: AltechTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
```

## Design Tokens

- Colors: `AltechColorTokens`, `AltechSemanticColors`
- Typography: `AltechTypography`
- Spacing: `AltechSpacing`
- Radius: `AltechRadius`
- Shadow: `AltechShadowTokens`

```dart
final semantic = context.semanticColors;
final shadows = context.shadows;
```

## Components

### Alerts and Feedback

```dart
AltechAlert.show(
  context,
  title: 'Success',
  message: 'Data saved successfully',
  type: AlertType.success,
);

const AltechFeedbackBanner(
  title: 'Sync Complete',
  message: 'Workspace synced successfully.',
  type: AlertType.success,
);
```

### Dialogs and Sheets

```dart
AltechDialog.show(
  context,
  title: 'Delete Item?',
  message: 'This action cannot be undone.',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  destructive: true,
);

AltechConfirmationDialog.show(
  context,
  title: 'Exit application?',
  message: 'Unsaved progress will be lost.',
);

AltechBottomSheet.show(
  context,
  title: 'Share Document',
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      AltechSheetActionItem(icon: Icons.link_rounded, label: 'Copy Link'),
      AltechSheetActionItem(icon: Icons.mail_outline_rounded, label: 'Email'),
      AltechSheetActionItem(icon: Icons.more_horiz_rounded, label: 'More'),
    ],
  ),
);
```

### Buttons

```dart
AltechButton(
  text: 'Primary Action',
  variant: ButtonVariant.primary,
  onPressed: () {},
)
```

Available variants:
- `primary`
- `secondary`
- `tonal`
- `outline`
- `text`
- `destructive`

### Inputs and Forms

```dart
AltechTextField(
  hintText: 'Enter your email',
  leadingIcon: Icons.email_outlined,
  trailingIcon: Icons.check_circle_outline_rounded,
);

AltechDropdownField<String>(
  hintText: 'Select role',
  prefixIcon: Icons.workspaces_outline,
  items: const [
    DropdownMenuItem(value: 'admin', child: Text('Admin')),
    DropdownMenuItem(value: 'user', child: Text('User')),
  ],
  onChanged: (value) {},
);

AltechCheckboxField(
  value: true,
  label: 'I agree to the terms and conditions',
  onChanged: (value) {},
)
```

### Navigation

```dart
AltechTopSearchBar(
  hintText: 'Search everywhere...',
  onPrimaryAction: () {},
);

AltechSidebarNavigation(
  title: 'Altech UI',
  selectedIndex: 0,
  onChanged: (index) {},
  items: const [
    AltechSidebarNavItem(label: 'Dashboard', icon: Icons.home_outlined),
    AltechSidebarNavItem(label: 'Analytics', icon: Icons.insert_chart_outlined),
  ],
);

AltechNavigationBar(
  floating: true,
  selectedIndex: 0,
  onDestinationSelected: (index) {},
  destinations: const [
    AltechNavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
    AltechNavigationDestination(icon: Icon(Icons.search_rounded), label: 'Search'),
  ],
)
```

### Cards

```dart
const AltechCard(
  child: Text('Reusable card component'),
);

AltechMetricCard(
  title: 'Current Balance',
  value: '\$12,050.00',
  subtitle: 'Available across all accounts',
  variant: MetricCardVariant.dark,
  primaryActionLabel: 'Transfer',
  secondaryActionLabel: 'Details',
  onPrimaryAction: () {},
  onSecondaryAction: () {},
)
```

### States and Loaders

```dart
const AltechEmptyState(
  title: 'No Projects Found',
  message: 'Create your first project to get started.',
);

AltechErrorState(
  title: 'Oops!',
  message: 'An error occurred while loading data.',
  onRetry: () {},
);

const AltechSkeleton(width: 220, height: 16);
const AltechShimmer(width: 220, height: 16);

AltechLoadingOverlay(
  isLoading: isSubmitting,
  message: 'Processing...',
  child: YourPageContent(),
)
```

### Avatars, Badges, Chips

```dart
const AltechAvatar(initials: 'AL');
const AltechAvatarGroup(initials: ['JS', 'MK', 'FR']);

const AltechBadge(
  label: 'In Progress',
  variant: AltechBadgeVariant.info,
);

const AltechChip(
  label: 'Active',
  selected: true,
);
```

### Snackbar and Toast

```dart
AltechSnackbar.show(
  context,
  title: 'Saved',
  message: 'Changes saved successfully.',
  type: AlertType.success,
  actionLabel: 'Undo',
  onActionPressed: () {},
);

AltechToast.show(context, message: 'Saved');
```

### Layout Helpers

```dart
AltechResponsiveLayout(
  mobile: MobileWidget(),
  tablet: TabletWidget(),
  desktop: DesktopWidget(),
);

AltechSplitView(
  left: LeftWidget(),
  right: RightWidget(),
);

AltechDashboardShell(
  sidebar: SidebarWidget(),
  main: MainWidget(),
)
```

## Full Exported API

`altech_ui_flutter.dart` exports all public components and tokens, including:
- Alerts: `AltechAlert`, `AltechFeedbackBanner`, `AlertType`
- Dialogs: `AltechDialog`, `AltechConfirmationDialog`, `AltechModal`, `AltechStatusPopup`
- Sheets: `AltechBottomSheet`, `AltechSheetActionItem`
- Inputs/Forms: `AltechTextField`, `AltechDropdownField`, `AltechCheckboxField`
- Navigation: `AltechAppBar`, `AltechTopSearchBar`, `AltechSidebarNavigation`, `AltechNavigationBar`
- Cards: `AltechCard`, `AltechMetricCard`
- States/Loaders: `AltechEmptyState`, `AltechErrorState`, `AltechLoadingOverlay`, `AltechSkeleton`, `AltechShimmer`
- Feedback: `AltechSnackbar`, `AltechToast`
- Avatar/Badge/Chip: `AltechAvatar`, `AltechAvatarGroup`, `AltechBadge`, `AltechChip`
- Layout: `AltechResponsiveLayout`, `AltechSplitView`, `AltechDashboardShell`
- Theme and tokens: `AltechTheme`, `AltechColorTokens`, `AltechSemanticColors`, `AltechTypography`, `AltechSpacing`, `AltechRadius`, `AltechShadowTokens`

## Example App

Run locally:

```bash
cd example
flutter run -d chrome
```

## Project Structure

```txt
lib/
 ├── altech_ui_flutter.dart
 └── src/
      ├── components/
      │    ├── alerts/
      │    ├── avatars/
      │    ├── badges/
      │    ├── buttons/
      │    ├── cards/
      │    ├── chips/
      │    ├── dialogs/
      │    ├── forms/
      │    ├── inputs/
      │    ├── layout/
      │    ├── loaders/
      │    ├── navigation/
      │    ├── sheets/
      │    ├── snackbars/
      │    └── states/
      ├── theme/
      │    ├── colors/
      │    ├── typography/
      │    ├── spacing/
      │    └── themes/
      ├── utils/
      └── extensions/
```

## Publishing Notes

Before publishing a new version:

```bash
flutter analyze
flutter test
flutter pub publish --dry-run
```

Then update:
- `version` in `pubspec.yaml`
- `CHANGELOG.md` with the same version

## License

MIT License.
