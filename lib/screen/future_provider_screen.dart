import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          state.when(
            data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            }, // -> 로딩이 끝나가지고  데이터가 있을 떄 그때 실행되는 함수.
            error: (err, stack) => Text(err.toString()), // -> 에러가 났을 때 실행되는 함수.
            loading: () => Center(child: CircularProgressIndicator()), // -> 로딩중일 때 실행되는 함수들.
          ),
        ],
      ),
    );
  }
}

// FutureProvider전에는 Future값을 한번도 받아본 적이 없다.
// 즉, 여태까지 다 동기 통신 및 답 (synchoronous)로 진행함.
// FutureBuilder처럼 캐싱이 된다. 해당 페이지를 나갔다 들어와도 이미 캐싱처리가 되어있어 대기시간(delayed.Duration(~)이 없다)