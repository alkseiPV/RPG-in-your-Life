import 'package:flutter/material.dart';

import 'package:mmorpg_life/common/colors_app.dart';

import 'package:mmorpg_life/presentation/pages/goals_screen.dart';

import 'package:mmorpg_life/presentation/widgets/drawer_widget.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "mmoRPG in you life",
          style: TextStyle(color: AppColors.textColorBlack),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_rounded,
              color: Colors.white70,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: AppColors.mainAppBarColor,
      ),
      backgroundColor: AppColors.mainBackgroundColor,
      drawer: myDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: AppColors.textColorBlack,
                          borderRadius: BorderRadius.circular(360)),
                      child: Image(
                        image: AssetImage('assets/images/avatarka.png'),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "YOUR NAME ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          //MainGoal(),
            IconButton(icon: Icon(Icons.dangerous), onPressed: (){
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => GoalsScreen()));
            },)
          ],
        ),
      ),
    );
  }
}
