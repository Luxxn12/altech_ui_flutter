# altech_ui_flutter

![ALTECH Logo](https://raw.githubusercontent.com/Luxxn12/altech_ui_flutter/main/assets/images/logo-altech.png)

`altech_ui_flutter` is a modern Flutter UI component library to help developers ship elegant screens faster with reusable, customizable, and developer-friendly components.

## Highlights

- Material 3 first (`useMaterial3: true`)
- Light and dark theme support
- Centralized theme system
- Design tokens for colors, typography, spacing, radius, and shadow
- Reusable + customizable components
- Simple API for common product flows
- Ready for pub.dev publishing

## Installation

```yaml
dependencies:
  altech_ui_flutter: ^0.1.0
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

Access theme extensions from context:

```dart
final semantic = context.semanticColors;
final shadows = context.shadows;
```

## Components

### Alert

```dart
AltechAlert.show(
  context,
  title: 'Success',
  message: 'Data berhasil disimpan',
  type: AlertType.success,
);
```

### Dialog

```dart
AltechDialog.show(
  context,
  title: 'Delete Item?',
  message: 'Action ini tidak bisa dibatalkan.',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  onConfirm: () {},
);
```

### Confirmation Dialog

```dart
AltechConfirmationDialog.show(
  context,
  title: 'Keluar aplikasi?',
  message: 'Progress yang belum disimpan akan hilang.',
);
```

### Bottom Sheet

```dart
AltechBottomSheet.show(
  context,
  title: 'Filter',
  child: const Text('Konten bottom sheet'),
);
```

### Snackbar / Toast

```dart
AltechSnackbar.show(
  context,
  message: 'Profil berhasil diperbarui',
  type: AlertType.success,
);

AltechToast.show(context, message: 'Saved');
```

### Loading Overlay

```dart
AltechLoadingOverlay(
  isLoading: isSubmitting,
  message: 'Memproses...',
  child: YourPageContent(),
)
```

Or global overlay:

```dart
AltechLoading.show(context, message: 'Please wait...');
AltechLoading.hide();
```

### Button

```dart
AltechButton(
  text: 'Login',
  variant: ButtonVariant.primary,
  onPressed: () {},
)
```

### TextField

```dart
AltechTextField(
  hintText: 'Masukkan email',
  prefixIcon: Icons.email,
)
```

### Card

```dart
AltechCard(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text('Modern Card'),
      Text('Reusable card component'),
    ],
  ),
)
```

### Avatar / Badge / Chip

```dart
const AltechAvatar(initials: 'A');
const AltechBadge(label: 'PRO');
const AltechChip(label: 'Design System');
```

### Empty / Error State

```dart
const AltechEmptyState(
  title: 'Belum ada data',
  message: 'Mulai dengan menambahkan item baru.',
);

AltechErrorState(
  title: 'Oops!',
  message: 'Terjadi kesalahan saat memuat data.',
  onRetry: () {},
)
```

### Skeleton / Shimmer

```dart
const AltechSkeleton(width: 220, height: 16);
const AltechShimmer(width: 220, height: 16);
```

### Responsive Layout Helper

```dart
AltechResponsiveLayout(
  mobile: MobileWidget(),
  tablet: TabletWidget(),
  desktop: DesktopWidget(),
)
```

### AppBar / Navigation Bar

```dart
const AltechAppBar(title: 'Dashboard');

AltechNavigationBar(
  selectedIndex: index,
  onDestinationSelected: (value) => setState(() => index = value),
  destinations: const [
    AltechNavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
    AltechNavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
  ],
)
```

### Reusable Form Components

```dart
AltechDropdownField<String>(
  hintText: 'Pilih role',
  items: const [
    DropdownMenuItem(value: 'admin', child: Text('Admin')),
    DropdownMenuItem(value: 'user', child: Text('User')),
  ],
  onChanged: (value) {},
)

AltechCheckboxField(
  value: accepted,
  label: 'Saya setuju syarat & ketentuan',
  onChanged: (value) {},
)
```

## Project Structure

```txt
lib/
 ├── altech_ui_flutter.dart
 └── src/
      ├── components/
      │    ├── alerts/
      │    ├── dialogs/
      │    ├── buttons/
      │    ├── inputs/
      │    ├── cards/
      │    ├── snackbars/
      │    ├── loaders/
      │    ├── sheets/
      │    ├── avatars/
      │    ├── badges/
      │    ├── chips/
      │    ├── states/
      │    ├── navigation/
      │    ├── layout/
      │    └── forms/
      ├── theme/
      │    ├── colors/
      │    ├── typography/
      │    ├── spacing/
      │    └── themes/
      ├── utils/
      └── extensions/
```


## Recommended Architecture for Flutter UI Library

- Token-driven design system (single source of truth)
- Centralized theme + theme extensions for semantic values
- Thin and composable widgets
- Stateless by default; stateful only where animation/interaction is required
- Public API through one barrel file (`altech_ui_flutter.dart`)
- Versioning discipline (SemVer) and changelog-driven release process

## References

- Flutter SDK archive and release schedule: https://docs.flutter.dev/install/archive
- Material 3 in Flutter (`useMaterial3`): https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html
- pub.dev automated publishing from GitHub Actions: https://dart.dev/tools/pub/automated-publishing
