import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider Logging
class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print('[Provider Update] provider : $provider / pv : $previousValue / nv : $newValue');
  }

  @override // 프로바이더 추가했을 때 호출
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    print('[Provider Added] provider : $provider / value : $value ');
  }

  //autoDispose 특성상 화면에서 필요없어지면 삭제돼서 화면에서 벗어나면 삭제됨.
  //family는 특성상 화면에서 필요없어져도 갖고있기에 벗어나도 삭제안됨.
  @override // 프로바이더가 삭제됐을 때
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    print('[Provider Dispose] provider : $provider');
  }
}

// observer에 클래스를 넣으면,ProviderScope 안에 있는 모든 프로바이더들의 값이 변경될 때 마다 didUpdateProvider함수가 무조건 실행된다.
// 어떠한 프로바이더가 업데이트되어도 저희는 이 프린트를 받아볼 수가 있습니다.
