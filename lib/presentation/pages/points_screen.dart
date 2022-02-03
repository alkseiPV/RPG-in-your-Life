import 'package:flutter/material.dart';
import 'package:mmorpg_life/common/colors_app.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_event.dart';

import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';
import 'package:mmorpg_life/presentation/widgets/add_point_widget.dart';
import 'package:mmorpg_life/presentation/widgets/point_list.dart';
import 'package:provider/src/provider.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({Key? key}) : super(key: key);

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppBarColor,
        title: Text(
          "Experience points",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.textColorBlack),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt_outlined),
            onPressed: () {
              final PointBloc userBloc = context.read<PointBloc>();
              userBloc.add(LoadPointEvent());
            },
          )
        ],

      ),
      body: PointList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainAppBarColor,
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPoint()));
        },
        child: Icon(Icons.add ,color:Colors.pink ,),
      ),

  //типо внёс изменения
    );
  }
}
