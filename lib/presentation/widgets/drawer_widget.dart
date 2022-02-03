// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:mmorpg_life/common/colors_app.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';

import 'package:mmorpg_life/presentation/pages/achivments_screen.dart';
import 'package:mmorpg_life/presentation/pages/goals_screen.dart';
import 'package:mmorpg_life/presentation/pages/points_screen.dart';
import 'package:provider/src/provider.dart';


Drawer myDrawer(BuildContext context) {
  final PointBloc userBloc = context.read<PointBloc>();
  return Drawer(
    backgroundColor: Colors.yellow[50],
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.textColorOrange,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text('POINTS'),
          onTap: () async{
            Route route =
                MaterialPageRoute(builder: (context) => PointScreen());
            Navigator.push(context, route);
            userBloc.add(LoadPointEvent());

          },
        ),
        ListTile(
          title: const Text('GOALS'),
          onTap: () {
            Route route =
                MaterialPageRoute(builder: (context) => GoalsScreen());
            Navigator.push(context, route);
          },
        ),
        ListTile(
          title: const Text('ACHIVMENTS'),
          onTap: () {
            Route route =
                MaterialPageRoute(builder: (context) => AchivScreen());
            Navigator.push(context, route);
          },
        ),
      ],
    ),
  );
}
