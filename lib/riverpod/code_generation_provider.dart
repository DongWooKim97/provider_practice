import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider를 사용할지 결정할 고민 할 필요 없도록
// Provider, FutureProvider, StreamProvider , etc..
// StateNotifierProvider -> 명시적으로 제네레이션 가능.

final _testProvider = Provider<String>((ref) => 'Hello Code Generation!');

//일반 provider
@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation!';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  Future.delayed(Duration(seconds: 3));
  return 10;
}

@Riverpod(
  keepAlive: true, //default : false -> 살려두지마(autoDispose O) , true -> 살려둬(autoDispose X)
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  Future.delayed(Duration(seconds: 3));
  return 10;
}


// async로도 값을 반환할 수 있다.

// 2) Parameter -> Family 파라미터를 일반 함수처럼 사용할 수 있도록
// ----------------------------
// 이러한 문제를 해결하도록 riverpod에 추가가됨. {
