import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  static final _stream1 = BehaviorSubject<int>.seeded(1);
  static final _stream2 = BehaviorSubject<int>.seeded(1);
  static final _stream3 = BehaviorSubject<int>.seeded(1);

  Stream get pressed1 => _stream1.stream;
  Sink get add1 => _stream1.sink;

  Stream get pressed2 => _stream2.stream;
  Sink get add2 => _stream2.sink;

  Stream get pressed3 => _stream3.stream;
  Sink get add3 => _stream3.sink;

  Observable<String> get merge => Observable.zip3(
      _stream1,
      _stream2,
      _stream3,
      (one, two, three) =>
          (one.toString() + two.toString() + three.toString()));

  void dispose() {
    _stream1.close();
    _stream2.close();
    _stream3.close();
  }
}
