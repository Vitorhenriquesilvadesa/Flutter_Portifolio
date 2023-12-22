import 'package:flutter/material.dart';
import 'package:saturn_navigator/pages/app_themes.dart';
import 'package:saturn_navigator/pages/home_page/widgets/search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  bool searchFieldExpand = false;
  final ExpandableWidgetController _expandedController =
      ExpandableWidgetController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedController.expanded.value = false;
        });
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.getColor(Palette.main),
          boxShadow: [
            BoxShadow(
              color: AppColors.getColor(Palette.secondary).withAlpha(255),
              offset: const Offset(0, 10),
              blurRadius: 31,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                _expandedController.expanded.value = true;
              },
              child: SearchField(
                controller: _expandedController,
              ),
            ),
            Row(
              children: [
                HoverIconButton(
                  icon: Icons.widgets_outlined,
                  onHoverColor: AppColors.getColor(Palette.expanded),
                  offHoverColor: AppColors.getColor(
                    Palette.offHover,
                  ),
                  iconOffHoverColor: AppColors.getColor(Palette.expanded),
                  iconOnHoverColor: AppColors.getColor(Palette.glow),
                  animationDuration: const Duration(milliseconds: 250),
                ),
                Container(color: Colors.transparent, width: 8),
                HoverIconButton(
                  icon: Icons.email_outlined,
                  onHoverColor: AppColors.getColor(Palette.expanded),
                  offHoverColor: AppColors.getColor(
                    Palette.offHover,
                  ),
                  iconOffHoverColor: AppColors.getColor(Palette.expanded),
                  iconOnHoverColor: AppColors.getColor(Palette.glow),
                  animationDuration: const Duration(milliseconds: 250),
                ),
                Container(color: Colors.transparent, width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HoverIconButton extends StatefulWidget {
  HoverIconButton({
    required this.animationDuration,
    required this.iconOnHoverColor,
    required this.iconOffHoverColor,
    required this.onHoverColor,
    required this.offHoverColor,
    required this.icon,
    super.key,
  });

  IconData icon;
  Duration animationDuration;
  Color onHoverColor;
  Color offHoverColor;
  Color iconOnHoverColor;
  Color iconOffHoverColor;

  @override
  State<HoverIconButton> createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration: widget.animationDuration,
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isHover ? widget.onHoverColor : widget.offHoverColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(widget.icon,
            color: isHover ? widget.iconOnHoverColor : widget.iconOffHoverColor,
            size: 24),
      ),
    );
  }
}
