import 'package:altech_ui_flutter/altech_ui_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = AltechTheme.light();

    return MaterialApp(
      title: 'Altech UI 2.0',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme.copyWith(scaffoldBackgroundColor: Colors.white),
      darkTheme: AltechTheme.dark(),
      home: const ShowcasePage(),
    );
  }
}

class ShowcasePage extends StatefulWidget {
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  int _sidebarIndex = 0;
  int _floatingNavIndex = 0;
  String? _workspace = 'design-system';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 34, 12, 36),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _heroSection(context),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'NAVIGATION'),
                  const SizedBox(height: 12),
                  _navigationSection(context),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'CARDS (ALTECHCARD)'),
                  const SizedBox(height: 12),
                  _cardsSection(),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'BUTTONS'),
                  const SizedBox(height: 12),
                  _buttonSection(),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'INPUTS & FORM'),
                  const SizedBox(height: 12),
                  _inputsSection(),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'DIALOGS & SHEETS'),
                  const SizedBox(height: 12),
                  _dialogsSheetsSection(),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'STATES & LOADERS'),
                  const SizedBox(height: 12),
                  _statesLoaderSection(),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'FEEDBACK & ALERTS'),
                  const SizedBox(height: 12),
                  _feedbackSection(context),
                  const SizedBox(height: 30),
                  _sectionTitle(context, 'AVATARS & BADGES'),
                  const SizedBox(height: 12),
                  _avatarsBadgesSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _heroSection(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.outlineVariant.withValues(alpha: 0.8),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: Color(0xFF3F5CFF),
                ),
                const SizedBox(width: 6),
                Text(
                  'Altech UI 2.0',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            'Modern & Seamless',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              'Enterprise-ready components beautifully crafted for a frictionless, modern user experience. Minimalist, clean, and focus-driven.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navigationSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 920;
        final sidebar = SizedBox(
          width: stacked ? double.infinity : 245,
          child: AltechSidebarNavigation(
            title: 'Altech UI',
            userName: 'Jane Doe',
            userEmail: 'jane@altech.com',
            selectedIndex: _sidebarIndex,
            onChanged: (index) {
              setState(() {
                _sidebarIndex = index;
              });
            },
            items: const [
              AltechSidebarNavItem(
                label: 'Dashboard',
                icon: Icons.home_outlined,
              ),
              AltechSidebarNavItem(
                label: 'Analytics',
                icon: Icons.insert_chart_outlined,
              ),
              AltechSidebarNavItem(
                label: 'Customers',
                icon: Icons.person_outline,
                badge: '12',
              ),
              AltechSidebarNavItem(
                label: 'Settings',
                icon: Icons.settings_outlined,
              ),
            ],
          ),
        );

        final content = Expanded(
          child: _navigationContent(context, stacked: false),
        );

        if (stacked) {
          return Column(
            children: [
              sidebar,
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: _navigationContent(context, stacked: true),
              ),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [sidebar, const SizedBox(width: 12), content],
        );
      },
    );
  }

  Widget _navigationContent(BuildContext context, {required bool stacked}) {
    return Column(
      children: [
        AltechTopSearchBar(
          onPrimaryAction: () {
            AltechToast.show(context, message: 'Create new clicked');
          },
        ),
        const SizedBox(height: 12),
        AltechCard(
          padding: EdgeInsets.zero,
          child: Container(
            height: 264,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'MAIN CONTENT VIEW',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant.withValues(alpha: 0.42),
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(stacked ? 0.5 : 0.42, 0.82),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: stacked ? 360 : 560),
                    child: AltechNavigationBar(
                      floating: true,
                      height: 102,
                      selectedIndex: _floatingNavIndex,
                      onDestinationSelected: (value) {
                        setState(() {
                          _floatingNavIndex = value;
                        });
                      },
                      destinations: const [
                        AltechNavigationDestination(
                          icon: Icon(Icons.home_outlined),
                          label: 'Home',
                        ),
                        AltechNavigationDestination(
                          icon: Icon(Icons.search_rounded),
                          label: 'Search',
                        ),
                        AltechNavigationDestination(
                          icon: Icon(Icons.notifications_none_rounded),
                          label: 'Alerts',
                          showBadgeDot: true,
                        ),
                        AltechNavigationDestination(
                          icon: Icon(Icons.radio_button_unchecked),
                          label: 'More',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _cardsSection() {
    return AltechSplitView(
      left: AltechMetricCard(
        title: 'Server Performance',
        subtitle:
            'Monitor your server health and active connections in real time.',
        value: '98.4%',
        trend: '+1.2%',
        icon: Icons.bolt_rounded,
        tag: 'Active',
      ),
      right: AltechMetricCard(
        title: 'Current Balance',
        value: '\$12,050.00',
        subtitle: 'Available across all accounts',
        variant: MetricCardVariant.dark,
        primaryActionLabel: 'Transfer',
        secondaryActionLabel: 'Details',
        onPrimaryAction: () {},
        onSecondaryAction: () {},
      ),
    );
  }

  Widget _buttonSection() {
    return AltechCard(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          SizedBox(
            width: 136,
            child: AltechButton(text: 'Primary Action', onPressed: () {}),
          ),
          SizedBox(
            width: 122,
            child: AltechButton(
              text: 'Secondary',
              variant: ButtonVariant.secondary,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 102,
            child: AltechButton(
              text: 'Tonal',
              variant: ButtonVariant.tonal,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 106,
            child: AltechButton(
              text: 'Text',
              isExpanded: false,
              variant: ButtonVariant.text,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 126,
            child: AltechButton(
              text: 'Destructive',
              variant: ButtonVariant.destructive,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 108,
            child: AltechButton(
              text: 'Disabled',
              variant: ButtonVariant.secondary,
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputsSection() {
    return AltechCard(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final stacked = constraints.maxWidth < 860;

          final first = const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InputLabel('Email Address'),
              SizedBox(height: 8),
              AltechTextField(
                hintText: 'alex@altech.design',
                leadingIcon: Icons.email_outlined,
                trailingIcon: Icons.check_circle_outline_rounded,
              ),
            ],
          );
          final second = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _InputLabel('Workspace'),
              const SizedBox(height: 8),
              AltechDropdownField<String>(
                value: _workspace,
                prefixIcon: Icons.workspaces_outline,
                items: const [
                  DropdownMenuItem(
                    value: 'design-system',
                    child: Text('Design System'),
                  ),
                  DropdownMenuItem(
                    value: 'mobile-app',
                    child: Text('Mobile App'),
                  ),
                  DropdownMenuItem(value: 'website', child: Text('Website')),
                ],
                onChanged: (value) {
                  setState(() {
                    _workspace = value;
                  });
                },
              ),
            ],
          );
          const third = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InputLabel('Error State'),
              SizedBox(height: 8),
              AltechTextField(
                hintText: 'user@invalid',
                errorText: 'Please enter a valid email.',
                leadingIcon: Icons.warning_amber_rounded,
                trailingIcon: Icons.error_outline_rounded,
              ),
            ],
          );

          final checks = Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              SizedBox(
                width: stacked ? double.infinity : 260,
                child: AltechCheckboxField(
                  value: true,
                  compact: true,
                  label: 'Remember me',
                  onChanged: (_) {},
                ),
              ),
              SizedBox(
                width: stacked ? double.infinity : 300,
                child: AltechCheckboxField(
                  value: false,
                  compact: true,
                  label: 'Subscribe to newsletter',
                  onChanged: (_) {},
                ),
              ),
            ],
          );

          if (stacked) {
            return Column(
              children: [
                first,
                const SizedBox(height: 12),
                second,
                const SizedBox(height: 12),
                third,
                const SizedBox(height: 12),
                checks,
              ],
            );
          }

          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: first),
                  const SizedBox(width: 12),
                  Expanded(child: second),
                  const SizedBox(width: 12),
                  const Expanded(child: third),
                ],
              ),
              const SizedBox(height: 12),
              Align(alignment: Alignment.centerLeft, child: checks),
            ],
          );
        },
      ),
    );
  }

  Widget _dialogsSheetsSection() {
    return AltechSplitView(
      left: _PreviewFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFFFF5A5A),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Delete Workspace?',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              'Are you sure? This action cannot be undone and will permanently delete all data.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AltechButton(
                    text: 'Cancel',
                    variant: ButtonVariant.secondary,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AltechButton(
                    text: 'Delete',
                    variant: ButtonVariant.destructive,
                    onPressed: () {
                      AltechConfirmationDialog.show(
                        context,
                        title: 'Delete Workspace?',
                        message: 'This action cannot be undone.',
                        confirmText: 'Delete',
                        destructive: true,
                        showCloseButton: true,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      right: _PreviewFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 46,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Share Document',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AltechSheetActionItem(
                  icon: Icons.link_rounded,
                  label: 'Copy Link',
                ),
                AltechSheetActionItem(
                  icon: Icons.mail_outline_rounded,
                  label: 'Email',
                  selected: true,
                ),
                AltechSheetActionItem(
                  icon: Icons.more_horiz_rounded,
                  label: 'More',
                ),
              ],
            ),
            const SizedBox(height: 16),
            AltechButton(
              text: 'Show Bottom Sheet',
              variant: ButtonVariant.text,
              onPressed: () {
                AltechBottomSheet.show(
                  context,
                  title: 'Share Document',
                  maxHeightFactor: 0.82,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AltechSheetActionItem(
                        icon: Icons.link_rounded,
                        label: 'Copy Link',
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      AltechSheetActionItem(
                        icon: Icons.mail_outline_rounded,
                        label: 'Email',
                        selected: true,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      AltechSheetActionItem(
                        icon: Icons.more_horiz_rounded,
                        label: 'More',
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _statesLoaderSection() {
    return AltechSplitView(
      left: AltechEmptyState(
        title: 'No Projects Found',
        message:
            'Get started by creating your first project workspace to collaborate with your team.',
        action: AltechButton(
          text: 'Create Project',
          isExpanded: false,
          onPressed: () {},
        ),
      ),
      right: AltechCard(
        child: Column(
          children: [
            const Row(
              children: [
                AltechSkeleton(width: 36, height: 36, radius: 18),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      AltechShimmer(height: 12),
                      SizedBox(height: 8),
                      AltechShimmer(width: 170, height: 12),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const AltechShimmer(height: 96),
            const SizedBox(height: 14),
            const Row(
              children: [
                AltechSkeleton(width: 64, height: 24, radius: 14),
                SizedBox(width: 8),
                AltechSkeleton(width: 64, height: 24, radius: 14),
              ],
            ),
            const SizedBox(height: 16),
            AltechErrorState(
              title: 'Failed to fetch workspace',
              message: 'Please check your network and try again.',
              onRetry: () {
                AltechToast.show(
                  context,
                  message: 'Retrying...',
                  type: AlertType.warning,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _feedbackSection(BuildContext context) {
    return AltechSplitView(
      left: AltechFeedbackBanner(
        title: 'Sync Complete',
        message:
            'Your workspace has been successfully synced with the cloud database.',
        type: AlertType.success,
      ),
      right: AltechCard(
        backgroundColor: const Color(0xFF12151D),
        borderColor: const Color(0xFF202738),
        shadow: const [
          BoxShadow(
            color: Color(0x260A101D),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
        child: Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xFF232A37),
              child: Icon(Icons.check, size: 14, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Changes Saved',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Just now',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: const Color(0xFF8A92A7),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 84,
              child: AltechButton(
                text: 'Undo',
                variant: ButtonVariant.secondary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                onPressed: () {
                  AltechSnackbar.show(
                    context,
                    title: 'Reverted',
                    message: 'The last change has been restored.',
                    type: AlertType.info,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatarsBadgesSection() {
    return AltechCard(
      child: Wrap(
        spacing: 14,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const AltechAvatarGroup(initials: ['JS', 'MK', 'FR', 'AL']),
          Container(
            width: 1,
            height: 24,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          const AltechBadge(
            label: 'Draft',
            variant: AltechBadgeVariant.neutral,
          ),
          const AltechBadge(
            label: 'In Progress',
            variant: AltechBadgeVariant.info,
          ),
          const AltechBadge(
            label: 'Completed',
            variant: AltechBadgeVariant.success,
            dot: Color(0xFF16945A),
          ),
          const AltechChip(label: 'Filters'),
          const AltechChip(
            label: 'Active',
            selected: true,
            trailing: Icon(Icons.close_rounded, size: 14),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _InputLabel extends StatelessWidget {
  const _InputLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.labelLarge);
  }
}

class _PreviewFrame extends StatelessWidget {
  const _PreviewFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F7),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: child,
      ),
    );
  }
}
