part of 'player_profile.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  // ── Tab state ──────────────────────────────────────────────────────────────
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  void setTab(int index) {
    if (_selectedTab == index) return;
    _selectedTab = index;
    notifyListeners();
  }
}
