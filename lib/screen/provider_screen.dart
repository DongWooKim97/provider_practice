import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/provider.dart';

import '../riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);

    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton<FilterState>(
          itemBuilder: (_) => FilterState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
        ),
      ],
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                value: e.hasBought,
                onChanged: (value) {
                  ref.read(shoppingListProvider.notifier).toggleHasBought(
                      name: e.name); // 위에서는 filtered를 받아서 watch하는데, 여기는 shopping으로 해도 된다?
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

// ★우리가 watch하고 있는건 filter인데, shoppingListProvider와 값을 공유하고있다.
// ref.watch를 하고서 어떤 provider값을 여기다 넣으면 반환되는 값이 이 쇼핑리스트 프로바이더의  state인데,
// arrow function을 썼기 때문에 반환된 값(state)가 또 한번 더 반환된다.그 반환되는 값이 변경이 될 때 마다
// 해당 프로바이더의 값이 변경이 된다고 인식한다. 그래서 빌드가 재실행된다. ★
