import 'package:flutter/material.dart';
import 'package:ict7b/Widgets/SiteLogo.dart';

import '../constant/naveTiles.dart';
class HeaderDekstop extends StatelessWidget {
  const HeaderDekstop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
      width: double.maxFinite,
      decoration:BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent,Color(0xFF252734)]
          ),
          borderRadius: BorderRadius.circular(100)

      ) ,
      child: Row(
        children: [
          SiteLogo(onTap: (){},),
          Spacer(),

            for(int i=0;i<navTiles.length;i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 10,right: 10,top: 20),
                child: TextButton(onPressed: (){},
                    child:Text(navTiles[i],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )

                ),
              )
        ],
      ),
    );
  }
}
