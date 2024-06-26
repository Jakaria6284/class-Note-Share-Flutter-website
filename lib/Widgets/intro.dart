import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000), // Reduced animation duration to 1000 ms
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0), // Offscreen to the left
      end: Offset.zero, // Onscreen
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Changed curve for smoother motion
      ),
    );
    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SlideTransition(
          position: _slideAnimation,
          child: Container(
            width: screenWidth * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ICT 7 Section B",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Together, we find strength in unity and resilience in our bond. Let's stay committed and conquer challenges hand in hand",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add your button onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE7E028),
                  ),
                  child: Text(
                    "Get In Touch",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0), // Offscreen to the right
            end: Offset.zero, // Onscreen
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut, // Changed curve for smoother motion
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 26.0),
            child: Container(
              height: screenHeight * 0.9 ,
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/iv.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
