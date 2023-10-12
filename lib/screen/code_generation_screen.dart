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
    // state notifier

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
          Consumer(
            // 1.context = buildContext, ref = ref,
            // 2. child는 새로 렌더링을 하는 요소가 부분적이고, 단 한번만 렌더링 시키고 변경사항이 딱히 필요가 없는 그런 위젯들(고정적인 값)을 child파라미터에 넘겨준다.
            builder: (context, ref, child) {
              print('builder build!');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [Text('state5 : $state5'), child!],
              );
            },
            child: Text('hello'),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).increment();
                  },
                  child: Text('incre')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).decrement();
                  },
                  child: Text('decre')),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: Text('Invalidate')),
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('State5 : $state5');
  }
}
