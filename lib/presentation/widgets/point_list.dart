import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_state.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';
import 'package:mmorpg_life/domain/entities/point_entity.dart';
import 'package:mmorpg_life/presentation/widgets/change_box_point.dart';
import 'package:mmorpg_life/presentation/widgets/shimmer_widget.dart';



class PointList extends StatelessWidget {
  const PointList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PointBloc userBloc = context.read<PointBloc>();

    return BlocBuilder<PointBloc, PointState>(
      builder: (context, state) {
        List<PointEntity> points = [];
        if (state is LoadingPointState) {
          return ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ShimmerWidget.circular(width: 30, height:30, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),),
                  title: ShimmerWidget.rectangular(height: 16, width: 45,),
                  subtitle: ShimmerWidget.rectangular(height: 12, width: 70,),
                );
              });
        } else if (state is LoadedPointState) {
          points = state.loadedPoint;
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key('${points[index]}'),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeBoxPoint(
                            t: points[index].titl!,
                            indx: index,
                            subt: points[index].subtitl!)))
                  },
                  child: ListTile(
                    title: Text('${points[index].titl}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text('${points[index].subtitl}'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                int a = -1;
                                
                               
                                userBloc.add(PointChangeEvent(
                                    indexPoint: index, changePoint: a));
                                userBloc.add(LoadPointEvent());
                              },
                            ),
                            Text('${points[index].point}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                int a = 1;
                                
                                userBloc.add(PointChangeEvent(
                                    indexPoint: index, changePoint: a));
                                userBloc.add(LoadPointEvent());
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                onDismissed: (direction) async {
                  userBloc.add(PointDissmis(a: points.indexOf(points[index])));
                  userBloc.add(LoadPointEvent());
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.yellow[800],
              );
            },
            itemCount: points.length);
      },
    );
  }
}
