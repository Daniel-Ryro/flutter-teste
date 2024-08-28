import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/features/home/presentation/home_screen.dart';
import 'package:guarda_digital_flutter/features/vault/presentation/vault_screen.dart';

import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../after.life/presentation/after_life_screen.dart';
import '../../daily.routine/presentation/daily_routine_screen.dart';
import '../../memories/presentation/memories_screen.dart';
import '../../pets/presentation/pets_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const DailyRoutineScreen(),
    const MemoriesScreen(),
    const AfterLifeScreen(),
    const PetsScreen(),
    const VaultScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
