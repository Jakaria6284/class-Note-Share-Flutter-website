import 'package:flutter/material.dart';
import 'package:ict7b/Widgets/Mobiledrawer.dart';
import 'package:ict7b/Widgets/SiteLogo.dart';
import 'package:ict7b/Widgets/header_Dekstop.dart';
import 'package:ict7b/Widgets/header_Mobile.dart';
import 'package:ict7b/constant/naveTiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: Scaffoldkey,
          endDrawer: constraints.maxWidth >= 600.0 ? null : MobileDrawerr(),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent, // Start color
                  Color(0xFF050A2A), // End color
                ],
              ),
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                if (constraints.maxWidth >= 600.0)
                  const HeaderDekstop()
                else
                  headeMobile(
                    onTap: () {},
                    onMenuTap: () {
                      Scaffoldkey.currentState?.openEndDrawer();
                    },
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Aligns children to the end of the row (right side)
                  children: [
                    Container(
                      width: screenWidth * 0.4,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                        children: [
                          Text(
                            "ICT 7 Section B",
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Together, we find strength in unity and resilience in our bond. Let's stay committed and conquer challenges hand in hand",
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Add your button onPressed logic here
                            },
                            style: ElevatedButton.styleFrom(
                             backgroundColor: Color(0xFFE7E028) // Change the button color here
                            ),

                            child: Text("Get In Touch",style: TextStyle(color: Colors.black),),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 26.0),
                      child: Container(
                        height: screenHeight * 0.9,
                        width: screenWidth * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white, // White background color
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),

                          child: Image.asset(
                            "assets/iv.jpeg",
                            fit: BoxFit.cover, // Adjust the image to fit the container
                          ),
                        ),
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),
        );
      },
    );
  }
}
