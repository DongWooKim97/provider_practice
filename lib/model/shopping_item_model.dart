class ShoppingItemModel {
  final String name;
  final int quantity;
  final bool hasBought;
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  // 파라미터에 입력된 값들만 새로운 값들로 변경된다.
  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
