import 'package:flutter/material.dart';
import 'package:ict7b/Utils/projectUtils.dart';
import 'package:ict7b/Widgets/Mobiledrawer.dart';
import 'package:ict7b/Widgets/SiteLogo.dart';
import 'package:ict7b/Widgets/header_Dekstop.dart';
import 'package:ict7b/Widgets/header_Mobile.dart';
import 'package:ict7b/Widgets/intro.dart';
import 'package:ict7b/Widgets/projectCardWidget.dart';
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
                Intro(),


                //Semester 6---------------------------------------------------------------
                SizedBox(height: 40),
                Center(
                  child: Text(
                    "Semester (6)",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      for (int i = 0; i < list.length; i++)
                        projectCardWidget(project: list[i]),
                    ],
                  ),
                ),
                SizedBox(height: 20),



                //Semester 7------------------------------------------------------------------------------
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Semester (7)",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      for (int i = 0; i < sem7.length; i++)
                        projectCardWidget(project: sem7[i]),
                    ],
                  ),
                ),




                SizedBox(height: 20),



                //Semester 8------------------------------------------------------------------------------
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Semester (8)",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      for (int i = 0; i < sem8.length; i++)
                        projectCardWidget(project: sem8[i]),
                    ],
                  ),
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        );
      },
    );
  }
}
