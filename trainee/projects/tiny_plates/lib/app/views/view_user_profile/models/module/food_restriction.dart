enum FoodRestrictionType { neverGive, allergen }

class FoodRestriction {
  const FoodRestriction({
    required this.name,
    required this.type,
    this.ageRestriction,
    this.isAutoSubstitutable = false,
  });

  final String name;
  final FoodRestrictionType type;
  final int? ageRestriction;
  final bool isAutoSubstitutable;

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type.name,
        'ageRestriction': ageRestriction,
        'isAutoSubstitutable': isAutoSubstitutable,
      };

  factory FoodRestriction.fromJson(Map<String, dynamic> json) =>
      FoodRestriction(
        name: json['name'] as String,
        type: FoodRestrictionType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => FoodRestrictionType.allergen,
        ),
        ageRestriction: json['ageRestriction'] as int?,
        isAutoSubstitutable: (json['isAutoSubstitutable'] as bool?) ?? false,
      );
}
