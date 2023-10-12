import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // normal state
    final state1 = ref.watch(gStateProvider);
    //future state
    final state2 = ref.watch(gStateFutureProvider);
    // future state ( not autoDispose)
    final state3 = ref.watch(gStateFuture2Provider);
    // family state
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));

    return DefaultLayout(
      title: 'Code GenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('state1 : $state1'),
          state2.when(
            data: (data) {
              return Text(
                'state2 : $data',
                textAlign: TextAlign.center,
              );
            }, // -> 로딩이 끝나가지고  데이터가 있을 떄 그때 실행되는 함수.
            error: (err, stack) => Text(err.toString()), // -> 에러가 났을 때 실행되는 함수.
            loading: () => Center(child: CircularProgressIndicator()), // -> 로딩중일 때 실행되는 함수들.
          ),
          state3.when(
            data: (data) {
              return Text(
                'state3 : $data',
                textAlign: TextAlign.center,
              );
            }, // -> 로딩이 끝나가지고  데이터가 있을 떄 그때 실행되는 함수.
            error: (err, stack) => Text(err.toString()), // -> 에러가 났을 때 실행되는 함수.
            loading: () => Center(child: CircularProgressIndicator()), // -> 로딩중일 때 실행되는 함수들.
          ),
          Text('State4 : $state4'),
        ],
      ),
    );
  }
}
