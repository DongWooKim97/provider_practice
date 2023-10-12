import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider를 사용할지 결정할 고민 할 필요 없도록
// Provider, FutureProvider, StreamProvider , etc..
// StateNotifierProvider -> 명시적으로 제네레이션 가능.

final _testProvider = Provider<String>((ref) => 'Hello Code Generation!');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation!';
}

// 2) Parameter -> Family 파라미터를 일반 함수처럼 사용할 수 있도록
// ----------------------------
// 이러한 문제를 해결하도록 riverpod에 추가가됨.
