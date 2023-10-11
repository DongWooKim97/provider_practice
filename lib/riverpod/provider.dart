import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/model/shopping_item_model.dart';
import 'package:provider_project/riverpod/state_notifier_provider.dart';

// Provider -> shoppingListProvider, 중첩구조
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy)
        .toList();
  },
);

// 필터된 상태값 정의
enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
