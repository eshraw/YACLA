import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'rack_state.dart';

@riverpod
class RackController extends _$RackController {
  @override
  FutureOr<RackState> build() async {
    return await _loadRackItems();
  }

  Future<RackState> _loadRackItems() async {
    state = const AsyncValue.loading();
    return await AsyncValue.guard(() async {
      final repository = ref.read(rackRepositoryImplProvider.notifier);
      final shoes = await repository.getShoes();
      final harnesses = await repository.getHarnesses();
      
      return RackState(
        shoes: shoes,
        harnesses: harnesses,
        isLoading: false,
      );
    });
  }

  Future<void> addShoe(Shoe shoe) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(rackRepositoryImplProvider.notifier);
      await repository.addShoe(shoe);
      return _loadRackItems();
    });
  }

  // Implement other controller methods...
}