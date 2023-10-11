import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
    });

    return DefaultLayout(
      title: 'ListenProviderSCreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 10 ? 10 : state + 1);
                  },
                  child: Text('다음')),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 10 ? 10 : state - 1);
                  },
                  child: Text('뒤로')),
            ],
          ),
        ),
      ),
    );
  }
}

// 우리가 리슨을 하면 이 프로바이더 값이 변경될 때 마다 이 함수가 실행이 되는데, 함수는 컨트롤러를 이용해서 현재 리슨 프로바이더안에잇는 숫자값을 인덱스로 변경하고 있다.
// 중복으로 절대 listen이 되지 않게 설정되어있음
// initState는 단발성이기 때문에 initState안에는 ref.watch를 쓰면 안된다. (계속 주시하고 있어야하는데, 단발성이면 주시하고 있기 힘드니까)
