import 'package:flutter/material.dart';
import 'package:ict7b/Utils/projectUtils.dart';
import 'dart:js' as js;

class projectCardWidget extends StatefulWidget {
  final projectUtils project;

  const projectCardWidget({super.key, required this.project});

  @override
  _projectCardWidgetState createState() => _projectCardWidgetState();
}

class _projectCardWidgetState extends State<projectCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: InkWell(
        onTap: () {
          js.context.callMethod("open", [widget.project.link]);
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 280,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF060633),
          ),
          child: Column(
            children: [
              Image.asset(
                widget.project.image,
                height: 230,
                width: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                widget.project.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
