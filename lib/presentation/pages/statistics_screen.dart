import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mmorpg_life/common/colors_app.dart';
import 'package:mmorpg_life/domain/bloc/bloc_local_storage/local_storage_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_local_storage/local_storage_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_local_storage/local_storage_state.dart';
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
  var storageBloc;
  var userBloc;

  @override
  void initState() {
    storageBloc = context.read<LocalStorageBloc>();
    userBloc = context.read<LvlBloc>();
    storageBloc.add(GetInfoEvent('name'));
    userBloc.add(IncLvlEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    Column(
                      children: [
                        Row(
                          children: [
                            BlocBuilder<LocalStorageBloc, LocalStorageState>(
                                builder: (context, state) {
                              if (state is LoadingLocalStorage) {
                                return CircularProgressIndicator();
                              }
                              if (state is LoadedLocalStorage) {
                                return Text(
                                  state.value,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                );
                              }
                              return SizedBox.shrink();
                            }),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        changeNameWidget(context),
                                  );
                                },
                                icon: Icon(Icons.change_circle))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        LvlProgress()
                      ],
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

  Widget changeNameWidget(
    BuildContext context,
  ) {
    String nick = '';
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(
            'Изменить свой ник',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            onChanged: (val) {
              nick = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: Size(250, 50),
                  backgroundColor: Colors.blueAccent),
              onPressed: () {
                context
                    .read<LocalStorageBloc>()
                    .add(PutInfoEvent('name', nick));
                Navigator.pop(context);
              },
              child: Text(
                'Изменить',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ))
        ]),
      ),
    );
  }
}
