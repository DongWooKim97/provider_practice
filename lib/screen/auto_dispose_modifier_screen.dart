import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
      title: 'AutoDisposeModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: (err, stack) =>Text(err.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}


// 일반적인 FutureProvider는 캐싱이 된다. 이전 데이터들을 기억함.
// but, autoDisposeModifier는 단어 뜻 그대로 자동으로 캐싱을 삭제한다는 뜻이다. 필요할 때 생성하고 , 필요없으면 삭제하고, 다시 필요하면 다시 생성