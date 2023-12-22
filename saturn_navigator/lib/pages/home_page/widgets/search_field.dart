import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saturn_navigator/pages/app_themes.dart';

class ExpandableWidgetController extends GetxController {
  var expanded = false.obs;
}

// ignore: must_be_immutable
class SearchField extends StatefulWidget {
  SearchField({required this.controller, super.key});

  ExpandableWidgetController controller;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField>
    with SingleTickerProviderStateMixin {
  //
  //
  late AnimationController _controller;
  late double minimizedWidth = 48;
  late double expandedWidth = 800;
  int animationDuration = 500;
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    expandedWidth = 800 - minimizedWidth;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              setState(() {
                isHover = true;
                _controller.forward();
              });
            },
            onExit: (event) {
              setState(() {
                isHover = false;
                _controller.reverse();
              });
            },
            child: AnimatedContainer(
              width: widget.controller.expanded.isTrue
                  ? expandedWidth
                  : minimizedWidth,
              height: 48,
              alignment: widget.controller.expanded.isTrue
                  ? Alignment.center
                  : Alignment.centerRight,
              padding: widget.controller.expanded.isTrue
                  ? const EdgeInsets.only(right: 8)
                  : const EdgeInsets.only(right: 8),
              curve: Easing.standardDecelerate,
              duration: Duration(milliseconds: animationDuration),
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: widget.controller.expanded.isTrue
                    ? (isHover
                        ? AppColors.getColor(Palette.expanded)
                        : AppColors.getColor(Palette.expanded))
                    : (isHover
                        ? AppColors.getColor(Palette.onHover)
                        : AppColors.getColor(Palette.offHover)),
                borderRadius: BorderRadius.circular(8),
                boxShadow: isHover
                    ? widget.controller.expanded.isTrue
                        ? const [
                            BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(0, 8),
                                blurRadius: 8,
                                spreadRadius: 0),
                          ]
                        : null
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    alignment: Alignment.center,
                    margin: widget.controller.expanded.isTrue
                        ? const EdgeInsets.only(right: 8, left: 4)
                        : null,
                    padding: widget.controller.expanded.isTrue
                        ? const EdgeInsets.all(2)
                        : null,
                    duration: Duration(
                      milliseconds: widget.controller.expanded.isTrue
                          ? (animationDuration * 1.5).toInt()
                          : (animationDuration * 0.5).toInt(),
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 46, 46, 46),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 38,
                    width: widget.controller.expanded.isTrue
                        ? expandedWidth - 48
                        : 0,
                    curve: Easing.standardDecelerate,
                    child: const TextField(
                      cursorColor: Colors.white,
                      cursorHeight: 20,
                      cursorRadius: Radius.circular(20),
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ScaleTransition(
                    scale: Tween<double>(
                            begin: 1,
                            end: widget.controller.expanded.isTrue ? 1 : 1.4)
                        .animate(
                      CurvedAnimation(
                        curve: Curves.easeIn,
                        parent: _controller,
                      ),
                    ),
                    child: Icon(
                      Icons.search_sharp,
                      color: widget.controller.expanded.isTrue
                          ? AppColors.getColor(Palette.glow)
                          : AppColors.getColor(Palette.expanded),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
