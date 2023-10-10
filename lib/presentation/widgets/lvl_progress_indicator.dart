import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl_state.dart';
import 'package:mmorpg_life/domain/entities/lvl_entity.dart';

class LvlProgress extends StatelessWidget {
  const LvlProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LvlBloc, LvlState>(builder: (context, state) {
      List<LvlEntity> listlvl = [];

      if (state is LoadingLvlState) {
        return  SizedBox(
          width: 150,
          child: LinearProgressIndicator(
            backgroundColor: Colors.cyan[100],
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        );
      } else if (state is LoadedLvlState) {
        listlvl = state.loadedExp;
      }
      return SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "your lvl is: ${listlvl[1].lvls}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            LinearProgressIndicator(
              value: listlvl[1].exp,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: Colors.black12,
            ),
          ],
        ),
      );
    });
  }
}
