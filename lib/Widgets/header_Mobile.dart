import 'package:flutter/material.dart';

import 'SiteLogo.dart';
class headeMobile extends StatelessWidget {
  const headeMobile({super.key,this.onTap,this.onMenuTap,});
  final VoidCallback ?onTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration:BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent,Color(0xFF252734)]
          ),
          borderRadius: BorderRadius.circular(100)

      ) ,
      child: Row(
        children: [
          SiteLogo(onTap: onTap,),
          Spacer(),
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
          SizedBox(width: 15,)
        ],
      ),
    );
  }
}
