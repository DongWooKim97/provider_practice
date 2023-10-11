// 어떤 프로바이더든 상관없다.
import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});

// modifier는 provider라는 글자 옆에다가 우리가 점 하고서 무언가 추가를 할 수 있다. => family / autoDispose
// 1) family -> family를 사용하는 순간 두번째 파라미터를 받게 된다. 제너릭은 데이터가 어떤 타입으로 받게될건지에 대한 타입을 정의해줘야함.