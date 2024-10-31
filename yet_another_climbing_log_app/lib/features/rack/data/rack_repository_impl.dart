import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/harnesses_model.dart';
import '../domain/shoes_model.dart';

import 'rack_repository.dart';

@Riverpod(keepAlive: true)
class RackRepositoryImpl extends _$RackRepositoryImpl implements RackRepository {
  @override
  FutureOr<void> build() {}

  @override
  Future<List<Shoe>> getShoes() async {
    final datasource = ref.read(rackLocalDatasourceProvider.notifier);
    final shoesData = await datasource.getShoes();
    return shoesData.map((json) => Shoe.fromJson(json)).toList();
  }

  @override
  Future<List<Harness>> getHarnesses() async {
    final datasource = ref.read(rackLocalDatasourceProvider.notifier);
    final harnessesData = await datasource.getHarnesses();
    return harnessesData.map((json) => Harness.fromJson(json)).toList();
  }

  @override
  Future<void> addShoe(Shoe shoe) async {
    final datasource = ref.read(rackLocalDatasourceProvider.notifier);
    await datasource.addShoe({
      'shoes_brand': shoe.brand,
      'shoes_model': shoe.model, 
      'shoes_size': shoe.size,
    });
  }

  @override
  Future<void> updateShoe(Shoe shoe) async {
    final datasource = ref.read(rackLocalDatasourceProvider.notifier);
    await datasource.updateShoe(shoe.id, {
      'shoes_brand': shoe.brand,
      'shoes_model': shoe.model,
      'shoes_size': shoe.size,
    });
  }

  @override
  Future<void> addHarness(Harness harness) async {
    final datasource = ref.read(rackLocalDatasourceProvider.notifier);
    await datasource.addHarness({
      'harness_brand': harness.brand,
      'harness_model': harness.model,
    });
  }

  @override
  Future<void> updateHarness(Harness harness) async {
    final datasource = ref.read(rackLocalDatasourceProvider.notifier);
    await datasource.updateHarness(harness.id, {
      'harness_brand': harness.brand,
      'harness_model': harness.model,
    });
  }
}