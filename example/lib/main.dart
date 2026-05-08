import 'package:altech_ui_flutter/altech_ui_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Altech UI Example',
      theme: AltechTheme.light(),
      darkTheme: AltechTheme.dark(),
      themeMode: ThemeMode.system,
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
  bool _loading = false;
  int _navIndex = 0;
  bool _checked = false;
  String? _role;

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AltechLoadingOverlay(
      isLoading: _loading,
      message: 'Loading...',
      child: Scaffold(
        appBar: const AltechAppBar(title: 'altech_ui_flutter'),
        bottomNavigationBar: AltechNavigationBar(
          selectedIndex: _navIndex,
          onDestinationSelected: (value) {
            setState(() {
              _navIndex = value;
            });
          },
          destinations: const [
            AltechNavigationDestination(
              icon: Icon(Icons.widgets_outlined),
              label: 'Components',
            ),
            AltechNavigationDestination(
              icon: Icon(Icons.grid_view_outlined),
              label: 'States',
            ),
          ],
        ),
        body: SafeArea(
          child: AltechResponsiveLayout(
            mobile: _buildContent(),
            tablet: Center(child: SizedBox(width: 680, child: _buildContent())),
            desktop: Center(
              child: SizedBox(width: 760, child: _buildContent()),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_navIndex == 1) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const AltechEmptyState(
            title: 'Belum ada item',
            message: 'Tambahkan item pertama untuk mulai.',
          ),
          const SizedBox(height: 20),
          AltechErrorState(
            title: 'Gagal memuat data',
            message: 'Periksa jaringan Anda lalu coba lagi.',
            onRetry: () {
              AltechSnackbar.show(
                context,
                message: 'Retry requested',
                type: AlertType.info,
              );
            },
          ),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AltechCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Buttons & Feedback'),
              const SizedBox(height: 12),
              AltechButton(
                text: 'Show Success Alert',
                onPressed: () {
                  AltechAlert.show(
                    context,
                    title: 'Success',
                    message: 'Data berhasil disimpan',
                    type: AlertType.success,
                  );
                },
              ),
              const SizedBox(height: 8),
              AltechButton(
                text: 'Show Confirm Dialog',
                variant: ButtonVariant.secondary,
                onPressed: () {
                  AltechDialog.show(
                    context,
                    title: 'Delete Item?',
                    message: 'Action ini tidak bisa dibatalkan.',
                    confirmText: 'Delete',
                    onConfirm: () {
                      AltechSnackbar.show(
                        context,
                        message: 'Item deleted',
                        type: AlertType.warning,
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
              AltechButton(
                text: 'Show Bottom Sheet',
                variant: ButtonVariant.outline,
                onPressed: () {
                  AltechBottomSheet.show(
                    context,
                    title: 'Actions',
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.edit_outlined),
                          title: const Text('Edit'),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.delete_outline),
                          title: const Text('Delete'),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              AltechButton(
                text: 'Show Toast',
                variant: ButtonVariant.text,
                isExpanded: false,
                onPressed: () => AltechToast.show(context, message: 'Saved'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AltechCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Form Components'),
              const SizedBox(height: 12),
              AltechTextField(
                controller: _emailController,
                hintText: 'Masukkan email',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 8),
              AltechDropdownField<String>(
                value: _role,
                hintText: 'Pilih role',
                items: const [
                  DropdownMenuItem(value: 'admin', child: Text('Admin')),
                  DropdownMenuItem(value: 'user', child: Text('User')),
                ],
                onChanged: (value) {
                  setState(() {
                    _role = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              AltechCheckboxField(
                value: _checked,
                label: 'Saya setuju syarat & ketentuan',
                onChanged: (value) {
                  setState(() {
                    _checked = value ?? false;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AltechCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Display Components'),
              SizedBox(height: 12),
              Row(
                children: [
                  AltechAvatar(initials: 'A'),
                  SizedBox(width: 8),
                  AltechBadge(label: 'PRO'),
                  SizedBox(width: 8),
                  AltechChip(label: 'Modern UI'),
                ],
              ),
              SizedBox(height: 12),
              AltechSkeleton(width: 220, height: 14),
              SizedBox(height: 8),
              AltechShimmer(width: 220, height: 14),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AltechButton(
          text: 'Simulate Loading 2s',
          onPressed: () async {
            setState(() {
              _loading = true;
            });

            await Future<void>.delayed(const Duration(seconds: 2));

            if (!mounted) {
              return;
            }

            setState(() {
              _loading = false;
            });
          },
        ),
      ],
    );
  }
}
