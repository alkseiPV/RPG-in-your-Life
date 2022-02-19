import 'package:flutter/material.dart';

import 'package:mmorpg_life/common/colors_app.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl_event.dart';

import 'package:mmorpg_life/presentation/widgets/drawer_widget.dart';
import 'package:mmorpg_life/presentation/widgets/lvl_progress_indicator.dart';
import 'package:provider/src/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    LvlBloc userBloc = context.read<LvlBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "mmoRPG in you life",
          style: TextStyle(color: AppColors.textColorBlack),
        ),
        centerTitle: true,
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
                    GestureDetector(
                      onTap: () {
                        userBloc.add(IncLvlEvent());
                      },
                      child: Column(
                        children: [
                          Text(
                            "I'm BATMAN! ",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          LvlProgress()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
