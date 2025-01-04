import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'rack_state.dart';
import '../data/rack_repository_impl.dart';
import '../domain/shoes_model.dart';
import '../domain/harnesses_model.dart';

part 'rack_controller.g.dart';

@riverpod
class RackController extends AutoDisposeAsyncNotifier<RackState> {
  @override
  FutureOr<RackState> build() async {
    return await _loadRackItems();
  }

  Future<RackState> _loadRackItems() async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(() async {
      final repository = ref.read(rackRepositoryImplProvider.notifier);
      final shoes = await repository.getShoes();
      final harnesses = await repository.getHarnesses();
      
      return RackState(
        shoes: shoes,
        harnesses: harnesses,
        isLoading: false,
      );
    });
    return value.value!;
  }

  Future<void> addShoe(Shoe shoe) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(rackRepositoryImplProvider.notifier);
      await repository.addShoe(shoe);
      return _loadRackItems();
    });
  }

  Future<void> updateShoe(Shoe shoe) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(rackRepositoryImplProvider.notifier);
      await repository.updateShoe(shoe);
      return _loadRackItems();
    });
  }

  Future<void> addHarness(Harness harness) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(rackRepositoryImplProvider.notifier);
      await repository.addHarness(harness);
      return _loadRackItems();
    });
  }

  Future<void> updateHarness(Harness harness) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(rackRepositoryImplProvider.notifier);
      await repository.updateHarness(harness);
      return _loadRackItems();
    });
  }
}