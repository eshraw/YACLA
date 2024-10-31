import '../domain/harnesses_model.dart';
import '../domain/shoes_model.dart';

abstract class RackRepository {
  Future<List<Shoe>> getShoes();
  Future<List<Harness>> getHarnesses();
  Future<void> addShoe(Shoe shoe);
  Future<void> addHarness(Harness harness);
  Future<void> updateShoe(Shoe shoe);
  Future<void> updateHarness(Harness harness);
}