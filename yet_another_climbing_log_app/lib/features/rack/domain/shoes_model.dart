class Shoe with _$Shoe {
  const factory Shoe({
    required int id,
    required String brand,
    required String model,
    required double size,
  }) = _Shoe;

  factory Shoe.fromJson(Map<String, dynamic> json) => _$ShoeFromJson({
    'id': json['shoes_id'],
    'brand': json['shoes_brand'],
    'model': json['shoes_model'],
    'size': json['shoes_size'],
  });
}