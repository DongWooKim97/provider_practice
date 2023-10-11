import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));

    yield List.generate(10, (index) => index * i);
    // list의 길이가 10이고, 이 길이는 0부터 10까지이고 index대로 자리를 세움. 그 다음 1초마다 i가 1씩 오르니까 0~9 가 1초마다 올라간값을 곱해서 렌더링됨.
  }
});
