import 'package:flutter_test/flutter_test.dart';

import 'counter.dart';


void main(){
  late Counter counter;
  setUp(() {
    counter = Counter();
  });
  
  // group('Counter class -', () {

  test('given counter class when it is instantiated the value of count should be 0', () {
    final val = counter.count;
    expect(val, 0);
  });

  test('given counter class when it is incremented the value of count should be 1', (){
    counter.incrementCounter();
    final val = counter.count;
    expect(val, 1);
  });
  test('given counter class when it is decremented the value of count should be -1',(){
    counter.decrementCounter();
    final val = counter.count;
    expect(val, -1);
  });
  test('given counter class when it is reset the value of count should be 0', () {
    counter.reset();
    final val = counter.count;
    expect(val, 0);
  });
  // });
}