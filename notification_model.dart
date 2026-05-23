import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    _HomeListPage(),
    _ShoppingPage(),
    _StatsPage(),
    _ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Liste'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Alışveriş'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Özet'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add),
              label: const Text('Yeni ihtiyaç'),
            )
          : null,
    );
  }
}

class _HomeListPage extends StatelessWidget {
  const _HomeListPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: AppColors.background,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Merhaba Yusuf 👋',
                  style: AppTextStyles.caption,
                ),
                Text(
                  'Başaran Ailesi',
                  style: AppTextStyles.headingMedium,
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 8),
                _CategoryChips(),
                const SizedBox(height: 16),
                _ItemCard(
                  icon: '🥚',
                  name: 'Yumurta',
                  subtitle: 'Bitti · Hatırlatma bugün',
                  bgColor: const Color(0xFFFCEBEB),
                  textColor: const Color(0xFF501313),
                  subtextColor: const Color(0xFF791F1F),
                  borderColor: const Color(0xFFE24B4A),
                  trailing: Icons.error_outline,
                  trailingColor: const Color(0xFFA32D2D),
                ),
                const SizedBox(height: 8),
                _ItemCard(
                  icon: '🥛',
                  name: 'Süt',
                  subtitle: 'Azaldı · 2 gün sonra',
                  bgColor: const Color(0xFFFAEEDA),
                  textColor: const Color(0xFF412402),
                  subtextColor: const Color(0xFF633806),
                  borderColor: const Color(0xFFBA7517),
                  trailing: Icons.access_time,
                  trailingColor: const Color(0xFF854F0B),
                ),
                const SizedBox(height: 8),
                _ItemCard(
                  icon: '🧴',
                  name: 'Çamaşır Deterjanı',
                  subtitle: 'Var · 14 günde bir',
                  bgColor: AppColors.surface,
                  textColor: AppColors.textPrimary,
                  subtextColor: AppColors.textSecondary,
                  borderColor: AppColors.border,
                  trailing: Icons.check_circle_outline,
                  trailingColor: AppColors.success,
                ),
                const SizedBox(height: 8),
                _ItemCard(
                  icon: '🍞',
                  name: 'Ekmek',
                  subtitle: 'Günlük · yarın',
                  bgColor: AppColors.surface,
                  textColor: AppColors.textPrimary,
                  subtextColor: AppColors.textSecondary,
                  borderColor: AppColors.border,
                  trailing: Icons.check_circle_outline,
                  trailingColor: AppColors.success,
                ),
                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _chip('Tümü 12', selected: true),
          _chip('🍳 Mutfak'),
          _chip('🧽 Temizlik'),
          _chip('🛁 Banyo'),
        ],
      ),
    );
  }

  Widget _chip(String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.textPrimary : AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final String icon;
  final String name;
  final String subtitle;
  final Color bgColor;
  final Color textColor;
  final Color subtextColor;
  final Color borderColor;
  final IconData trailing;
  final Color trailingColor;

  const _ItemCard({
    required this.icon,
    required this.name,
    required this.subtitle,
    required this.bgColor,
    required this.textColor,
    required this.subtextColor,
    required this.borderColor,
    required this.trailing,
    required this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border(left: BorderSide(color: borderColor, width: 3)),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textColor)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 12, color: subtextColor)),
              ],
            ),
          ),
          Icon(trailing, color: trailingColor, size: 22),
        ],
      ),
    );
  }
}

class _ShoppingPage extends StatelessWidget {
  const _ShoppingPage();
  @override
  Widget build(BuildContext context) => Center(child: Text('Alışveriş Listesi\n(Paket 6)', style: AppTextStyles.bodyMedium, textAlign: TextAlign.center));
}

class _StatsPage extends StatelessWidget {
  const _StatsPage();
  @override
  Widget build(BuildContext context) => Center(child: Text('Haftalık Özet\n(Paket 6)', style: AppTextStyles.bodyMedium, textAlign: TextAlign.center));
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();
  @override
  Widget build(BuildContext context) => Center(child: Text('Profil\n(Paket 2-3)', style: AppTextStyles.bodyMedium, textAlign: TextAlign.center));
}
