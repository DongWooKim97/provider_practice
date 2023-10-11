import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async{
  await Future.delayed(Duration(seconds: 2));

  return [1,2,3,4,5,6,7];
});


// autoDispose는 family와 다르게 새로운 값(data)를 받지 않습니다. 알아서 자동 삭제