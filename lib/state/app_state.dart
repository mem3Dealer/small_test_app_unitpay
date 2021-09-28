import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:small_test_task_unitpay/models/good.dart';

///State of App, using by cubit as default... Well state of app.
///it has [version] for working capacity of code - cubit requires sometimes such flags for rendering.
///both lists are quite obvious - [totalList] holds all generated Goodies.
///[displayableList] contains those, which rendered and ready to be displayed.

class AppState {
  int? version;
  List<Goodie>? totalList = [];
  List<Goodie>? displayableList = [];

  AppState(
    this.version,
    this.totalList,
    this.displayableList,
  );

  AppState copyWith({
    int? version,
    List<Goodie>? totalList,
    List<Goodie>? displayableList,
  }) {
    return AppState(
      version ?? this.version,
      totalList ?? this.totalList,
      displayableList ?? this.displayableList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'totalList': totalList?.map((x) => x.toMap()).toList(),
      'displayableList': displayableList?.map((x) => x.toMap()).toList(),
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      map['version'],
      List<Goodie>.from(map['totalList']?.map((x) => Goodie.fromMap(x))),
      List<Goodie>.from(map['displayableList']?.map((x) => Goodie.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppState(version: $version, totalList: $totalList, displayableList: $displayableList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.version == version &&
        listEquals(other.totalList, totalList) &&
        listEquals(other.displayableList, displayableList);
  }

  @override
  int get hashCode =>
      version.hashCode ^ totalList.hashCode ^ displayableList.hashCode;
}
