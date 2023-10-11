import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/model/shopping_item_model.dart';
import 'package:provider_project/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                value: e.hasBought, // 체크가 되어있는지 아닌지 확인. 이미 샀다면(bool == true) 체크가 되어있을 것이다.
                onChanged: (value) {
                  // 누를 때 마다 각각의 값들이 불리게됨.함수에서 레퍼런스를 가져올때 (= 프로바이더를 가져올때) 우리가 ref.read를 한다했음.
                  ref.read(shoppingListProvider.notifier).toggleHasBought(
                        name: e.name,
                      );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

// state.toList를 했을 때 super 생성자에 넣은 값들을 그대로 받아올 수 있다.
// ref.watch에다 provider를 그냥 넣으면 state가 그대로 넘어가는데,
// ref.read에다 .notifier를 해서 가져오게 되면 read든 watch든 클래스가 넘어온다.여기서는 ShoppingListNotifier란 클래스 자체가 넘어온다.