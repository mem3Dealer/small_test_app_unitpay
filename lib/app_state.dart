import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:small_test_task_unitpay/models/good.dart';

class AppState {
  int? version;
  List<Goodie>? totalList = [];
  List<Goodie>? displayableList = [];
  bool? loadReq;

  AppState(
    this.version,
    this.totalList,
    this.displayableList,
    this.loadReq,
  );

  AppState copyWith({
    int? version,
    List<Goodie>? totalList,
    List<Goodie>? displayableList,
    bool? loadReq,
  }) {
    return AppState(
      version ?? this.version,
      totalList ?? this.totalList,
      displayableList ?? this.displayableList,
      loadReq ?? this.loadReq,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'totalList': totalList?.map((x) => x.toMap()).toList(),
      'displayableList': displayableList?.map((x) => x.toMap()).toList(),
      'loadReq': loadReq,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      map['version'],
      List<Goodie>.from(map['totalList']?.map((x) => Goodie.fromMap(x))),
      List<Goodie>.from(map['displayableList']?.map((x) => Goodie.fromMap(x))),
      map['loadReq'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppState(version: $version, totalList: $totalList, displayableList: $displayableList, loadReq: $loadReq)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.version == version &&
        listEquals(other.totalList, totalList) &&
        listEquals(other.displayableList, displayableList) &&
        other.loadReq == loadReq;
  }

  @override
  int get hashCode {
    return version.hashCode ^
        totalList.hashCode ^
        displayableList.hashCode ^
        loadReq.hashCode;
  }
}
