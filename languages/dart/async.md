# Dart — Async Programming

## Future & FutureOr

```dart
// Future — represents a value available later
Future<int> fetchCount() async => 42;

// FutureOr — either a value or a Future of that type
import 'dart:async';
FutureOr<int> maybeAsync(bool sync) {
  if (sync) return 42;           // synchronous value
  return Future.value(42);       // or a Future
}
```

## async/await

```dart
// Mark function async, use await to suspend
Future<void> main() async {
  final user = await fetchUser();
  final posts = await fetchPosts(user.id);
  print(posts.length);
}

// async always returns a Future
Future<String> greet() async => 'hello';

// Error handling with try/catch
Future<void> load() async {
  try {
    final data = await fetchData();
    print(data);
  } on TimeoutException {
    print('Timed out');
  } catch (e) {
    print('Error: $e');
  }
}

// Concurrent futures — don't await sequentially when independent
final results = await Future.wait([
  fetchUser(),
  fetchConfig(),
  fetchPosts(1),
]);
```

## then/catchError/whenComplete

```dart
// Chaining without async/await
fetchUser()
    .then((user) => fetchPosts(user.id))
    .then((posts) => print('Got ${posts.length} posts'))
    .catchError((e) => print('Error: $e'))
    .whenComplete(() => print('Done'));

// then with type transformation
fetchUser()
    .then((user) => user.name)
    .then((name) => name.toUpperCase());

// Timeout
fetchData().timeout(Duration(seconds: 5)).catchError((_) => fallback());
```

## Stream Basics

```dart
// Stream — sequence of async events
Stream<int> countTo(int max) async* {
  for (var i = 1; i <= max; i++) {
    yield i;
    await Future.delayed(Duration(milliseconds: 100));
  }
}

// Listen to a stream
final sub = countTo(5).listen(
  (value) => print(value),
  onError: (e) => print('Error: $e'),
  onDone: () => print('Done'),
);
sub.cancel(); // stop listening

// Stream from iterable
final stream = Stream.fromIterable([1, 2, 3]);

// Single-subscription vs broadcast
final s1 = Stream.fromIterable([1, 2]); // single listener only
final s2 = s1.asBroadcastStream();       // multiple listeners
```

## StreamController

```dart
// Manual stream creation
final controller = StreamController<int>();

// Add events
controller.add(1);
controller.add(2);
controller.addError('oops');
controller.close();

// Listen
controller.stream.listen(
  (v) => print(v),
  onError: (e) => print(e),
);

// Broadcast controller (multiple listeners)
final bc = StreamController<int>.broadcast();
bc.stream.listen((v) => print('A: $v'));
bc.stream.listen((v) => print('B: $v'));
bc.add(42);
```

## Stream Builders & Transformers

```dart
// Transform stream data
stream
    .map((x) => x * 2)
    .where((x) => x > 5)
    .take(3)
    .toList(); // Future<List<int>>

// Distinct — skip consecutive duplicates
stream.distinct();

// Debounce (common in search inputs)
import 'package:rxdart/rxdart.dart'; // external package
searchStream.debounceTime(Duration(milliseconds: 300));

// Stream builder (Flutter)
StreamBuilder<int>(
  stream: countStream(),
  builder: (context, snapshot) {
    if (snapshot.hasData) return Text('${snapshot.data}');
    if (snapshot.hasError) return Text('Error');
    return CircularProgressIndicator();
  },
);
```

## async* and yield

```dart
// async* — generator function returning a Stream
Stream<int> naturals() async* {
  var i = 0;
  while (true) {
    yield i++;
  }
}

// yield* — delegate to another stream
Stream<int> naturalsTo(int n) async* {
  yield* Stream.fromIterable(List.generate(n, (i) => i + 1));
}

// sync* — synchronous generator returning Iterable
Iterable<int> range(int start, int end) sync* {
  for (var i = start; i < end; i++) {
    yield i;
  }
}
```

## Isolates & compute()

```dart
// Isolates — separate threads with message passing
import 'dart:isolate';

// compute() — simple isolate for heavy computation (Flutter)
final result = await compute(heavyParse, jsonString);

// Manual isolate
Future<void> runInBackground() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_worker, receivePort.sendPort);

  final sendPort = await receivePort.first as SendPort;
  final response = ReceivePort();
  sendPort.send([42, response.sendPort]);
  print(await response.first); // result from isolate
}

void _worker(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.listen((message) {
    final List args = message as List;
    final replyPort = args[1] as SendPort;
    replyPort.send(args[0] * 2); // send result back
  });
}
```

## See Also

- [core.md](core.md) — variables, control flow, classes
- [null-safety.md](null-safety.md) — nullable types, null-aware operators
