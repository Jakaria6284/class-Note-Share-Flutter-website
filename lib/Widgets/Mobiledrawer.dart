import 'package:flutter/material.dart';

import '../constant/naveTiles.dart';
class MobileDrawerr extends StatelessWidget {
  const MobileDrawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF03031F),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.close))),
          ),
          for(int i=0;i<navTiles.length;i++)
            ListTile(
              leading: Icon(navIcon[i]),
              title: Text(navTiles[i]),
            )
        ],
      ),
    );
  }
}
