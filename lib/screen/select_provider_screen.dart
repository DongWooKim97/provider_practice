import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state = ref
        .watch(selectProvider.select((value) => value.isSpicy)); // value = selectProvider의 상태값이다/
    ref.listen(
      selectProvider.select((value) => value.hasBought),
      (previous, next) {
        print('next : $next');
      },
    );
    // 기존에는 ShoppingItemModel이였는데, select를 하는 순간, 해당 데이터 필드의 타입으로 바뀜.
    // 여기서는 ShoppingItemModel -> bool

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString()),
            // Text(state.name),
            // Text(state.isSpicy.toString()),
            // Text(state.hasBought.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: Text('spicy toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: Text('Bought toggle'),
            ),
          ],
        ),
      ),
    );
  }
}

// 분명 Bought Toggle도 동작을한다. 그러나 우리는 watch를 isSpicy에만 해놨기때문에 빌드나 렌더링이 되지는 않는다.
