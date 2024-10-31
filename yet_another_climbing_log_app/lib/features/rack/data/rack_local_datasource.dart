import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yet_another_climbing_log_app/shared/database_helper.dart';

part 'rack_local_datasource.g.dart';

@riverpod
class RackLocalDatasource extends _$RackLocalDatasource {
  @override
  FutureOr<void> build() {}

  Future<List<Map<String, dynamic>>> getShoes() async {
    return await DatabaseHelper.instance.getAllShoes();
  }

  Future<List<Map<String, dynamic>>> getHarnesses() async {
    return await DatabaseHelper.instance.getAllHarnesses();
  }

  Future<void> addShoe(Map<String, dynamic> shoe) async {
    await DatabaseHelper.instance.insertShoes(shoe);
  }

  Future<void> addHarness(Map<String, dynamic> harness) async {
    await DatabaseHelper.instance.insertHarness(harness);
  }

  Future<void> updateShoe(int id, Map<String, dynamic> shoe) async {
    await DatabaseHelper.instance.updateShoes(id, shoe);
  }

  Future<void> updateHarness(int id, Map<String, dynamic> harness) async {
    await DatabaseHelper.instance.updateHarness(id, harness);
  }
}