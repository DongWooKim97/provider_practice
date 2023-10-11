import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/model/shopping_item_model.dart';

final selectProvider =
    StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpicy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}

// StateNotifierProvider로 만들기 위해서는 클래스로 만들어야한다.
// 실제로 바꾸고 싶은 필드는 되게 작은데, 굉장히 반복적인 일을 많이해야한다 현재상황으로썬
