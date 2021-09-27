import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:small_test_task_unitpay/app_cubit.dart';
import 'package:small_test_task_unitpay/app_state.dart';
import 'package:small_test_task_unitpay/models/grid_tile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_test_task_unitpay/repository.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final appCubit = GetIt.I.get<AppCubit>();
  final rnd = GetIt.I.get<Random>();
  final rep = GetIt.I.get<Repository>();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // appCubit.generateGoods();
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('menu'),
        actions: [
          IconButton(
              onPressed: () {
                appCubit.addNewGoodie();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<AppCubit, AppState>(
          bloc: appCubit,
          builder: (context, state) {
            return LazyLoadScrollView(
              scrollOffset: 200,
              onEndOfPage: () =>
                  // print('uploads now'),
                  appCubit.upload(),
              child: GridView.builder(
                  controller: _controller,
                  itemCount: state.displayableList?.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      // childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return MyGridItem(goodie: state.displayableList![index]);
                  }),
            );
          }),
    );
  }
}
