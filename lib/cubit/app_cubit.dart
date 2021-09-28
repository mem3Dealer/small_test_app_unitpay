import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:small_test_task_unitpay/models/good.dart';
import 'package:small_test_task_unitpay/repositories/repository.dart';
import 'package:small_test_task_unitpay/state/app_state.dart';

///This is cubit class, which implements work with repository.
///[generateGoods] invokes rep`s generator, taking result as global list of items and takes first hundred to displayable list.
///[upload] Takes following 50 items to, well, upload them to displayable list.
///[addNewGoodie] is obvious method, which takes one random map from repository and inserts it in the beginning.
///[deleteItem] you will never believe what does this method do.

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(0, [], []));
  final rnd = GetIt.I.get<Random>();
  final rep = GetIt.I.get<Repository>();

  void generateGoods() {
    List<Goodie> list = rep.generateList();
    List<Goodie> displayable = list.sublist(0, 100);
    emit(state.copyWith(
        totalList: list,
        displayableList: displayable,
        version: state.version! + 1));
  }

  void upload() {
    List<Goodie>? list = state.totalList;
    int lastIndex = state.displayableList!.last.index;
    List<Goodie>? uploadingList = list?.sublist(lastIndex + 1, lastIndex + 50);
    List<Goodie> that = state.displayableList! + uploadingList!;
    emit(state.copyWith(displayableList: that, version: state.version! + 1));
  }

  void addNewGoodie() {
    List<Goodie>? updated = [];
    Map<String, dynamic> element =
        rep.listofGoodies[rnd.nextInt(rep.listofGoodies.length)];
    element.putIfAbsent('index', () => 0);
    Goodie newItem = Goodie.fromMap(element);
    updated = state.displayableList;
    updated!.insert(0, newItem);
    emit(state.copyWith(totalList: updated, version: state.version! + 1));
  }

  void deleteItem(Goodie goodie) {
    List<Goodie>? updated = [];
    updated = state.displayableList;
    updated?.remove(goodie);
    emit(state.copyWith(totalList: updated, version: state.version! + 1));
  }
}
