class Harness with _$Harness {
  const factory Harness({
    required int id,
    required String brand,
    required String model,
  }) = _Harness;

  factory Harness.fromJson(Map<String, dynamic> json) => _$HarnessFromJson({
    'id': json['harness_id'],
    'brand': json['harness_brand'],
    'model': json['harness_model'],
  });
}