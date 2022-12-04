
import 'dart:async';

class Counter{
  int _initial = 60;
  int _count = 0;
  StreamController<int> _counter = StreamController<int>.broadcast();

  Timer tiempo = Timer(const Duration(seconds: 1), () { });

  Stream<int> get stream => _counter.stream.asBroadcastStream();

  Counter(int secs){
    _initial = secs;
    restart();
  }

  void initiate(){
    _count = _initial;
    tiempo.cancel();
    tiempo = Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter.sink.add(_count);
      _count--;
      if(_count < 0) {
        timer.cancel();
      }
    });

  }

  void restart(){
    initiate();
    _counter.sink.add(_count--);
  }

  void stop(){
    tiempo.cancel();
  }



}