import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/model/shopping_item_model.dart';


//위젯처럼 , 위젯에서 사용하기 위해서는 provider로 만들어줘야한다.
// StateNotifierProvider는 StateNotifier를 관리할 수 있는 프로바이더를 만듦. 이 안에서 ShoppingListNotifier를 생성했다.
// 이 프로젝트 어디에서는 shoppingListProvider를 불러오게 되면은 똑같은 인스턴스가 반환된다.
final shoppingListProvider = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

// 단순히 상태를 관리하는 클래스에 불과함. 실제로 위젯에서, 위젯처럼 사용하기 위해서는 위에있는 코드를 작성.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 10,
              hasBought: true,
              isSpicy: true,
            ),
          ],
        ); // 어떤 상태로 초기화할지 알려줘야함.

  void toggleHasBought({required String name}) {
    // 상태를 또 다른 상태로 저장하는법.
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought, // toggle.
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  } // 새로운 리스트를 반환하고 있다는 사실.
// 값을 바꾸고 다시 상태값에 넣는 것.
}

// 원래는 바로 변수에다가 저장했었다.
// 그러나, StateNotifierProvider를 쓸 때는 클래스를 선언한다. + StateNotifier를 상속받는 모든 클래스들은 반드시 State를 정의해줘야함.
// 또한 StateNotifierProvider를 사용하기 위해서는 StateNotifier를 반드시 상속 받아야한다.
// 또한 상태 관리할 타입이 어떠한 타입인지 명시해줘야함.
// 또한 생성자를 '반드시' 선언해줘야함. 생성자에 super 안에 넣은 값들을 초기값으로 사용하여 시작할 수 있다.
// 또한 클래스로 사용하는 Provider이기 때문에 StateProvider처럼 쉽게 값을 바꾸는게 아니라 메서드를 통해서 값을 바꿔야한다.
