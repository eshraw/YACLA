class RackState with _$RackState {
  const factory RackState({
    @Default([]) List<Shoe> shoes,
    @Default([]) List<Harness> harnesses,
    @Default(true) bool isLoading,
    String? error,
  }) = _RackState;
} 