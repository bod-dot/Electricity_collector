import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/main.dart';



class CustomDrawer extends StatefulWidget {
  final Function(int) onItemSelected;

  const CustomDrawer({super.key, required this.onItemSelected});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _selectedIndex = -1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleItemTap(int index) async {
    if (_isLoading) return;

    setState(() {
      _selectedIndex = index;
      _isLoading = true;
    });

    await _animationController.reverse();
    widget.onItemSelected(index);
    await _animationController.forward();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(-100 * (1 - _animationController.value), 0),
          child: Opacity(
            opacity: _animationController.value,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color: KColorPrimer,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(10, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _buildItem(0, Icons.lock_outline, "تغيير كلمة المرور"),
                        _buildDivider(),
                        _buildItem(1, Icons.info_outline, "عن التطبيق"),
                        _buildDivider(),
                        _buildItem(2, Icons.exit_to_app, "تسجيل الخروج"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: KColorSecond,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      accountName: Text(
        "منطقة الشمال",
        style: GoogleFonts.cairo(
          fontSize: 18,
          color: Colors.white.withOpacity(0.9),
        ),
      ),
      accountEmail: Text(
        "مستخدم: أحمد محمد",
        style: GoogleFonts.cairo(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: KColorThreed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Icon(Icons.person, color: Colors.white, size: 40),
        ),
      ),
    );
  }

  Widget _buildItem(int index, IconData icon, String title) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200 + index * 100),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(
        _animationController.isAnimating ? 50 * (1 - _animationController.value) : 0,
        0,
        0,
      ),
      child: ListTile(
        leading: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isLoading && _selectedIndex == index
              ?  const CircularProgressIndicator(
                  color: KColorThreed,
                  strokeWidth: 2,
                )
              : Icon(icon, color: Colors.white, size: 28),
        ),
        title: Text(
          title,
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () => _handleItemTap(index),
        tileColor: _selectedIndex == index
            ? Colors.white.withOpacity(0.1)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.white.withOpacity(0.2),
      height: 1,
      indent: 30,
      endIndent: 30,
    );
  }
}