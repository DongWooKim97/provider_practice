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
@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}

// 아래에 있는 코드와 위에 있는 코드는 동일한 방식이다.
// 기존의 방식처럼 family를 사용하던 방식에서, 그냥 함수에 파라미터를 넘겨주는 것 만으로도 family형식의 provider를 사용할 수 있다.

/*
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, Parameter) => Parameter.number1 * Parameter.number2,
);
 */

// _$ 하고 클래스 이름을 붙이면 된다.
@riverpod
class GStateNotifier extends _$GStateNotifier {
  //초기상태지정
  // return 0 ? -> 기본 상태값이 0으로 시작한다는 것을 의미. 기억이 안나면 StateNotifierProvider 보고 올것!
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
