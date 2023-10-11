import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(10)); //

    return DefaultLayout(
      title: 'FamilyModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: (err, stack) => Text(err.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// 원래는 final state = ref.watch(familyModifierProvider); //  같이 작성하면 되는데, 지금은 에러가 남.
// family modifier를 사용하게 되면 괄호 열고 닫고해서 생성을 해줘야함.
