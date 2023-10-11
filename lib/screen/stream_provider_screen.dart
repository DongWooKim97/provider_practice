import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);

    return DefaultLayout(
      title: 'Stream Provider Screen',
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
// 1초간격으로 숫자가 변하고 리렌더링됨.
// ref.watch를 통해서 멀티플 스트림 프로바이더에서 값이 바뀔때마다 빌드함수를 재실행해줘야된다고 정의해놓음
