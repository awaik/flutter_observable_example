import 'package:flutter/material.dart';
import 'package:bloc_example/src/blocs/counter_bloc/counter_bloc.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
            stream: counterBloc.merge,
            builder: (context, snapshot) {
              return Text(
                'Flutter Observable - ${snapshot.data.toString()}',
              );
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Data from 3 streams:',
            ),
            StreamBuilder<String>(
                stream: counterBloc.merge,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data.toString()}',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            counterBloc.add1.add(Random().nextInt(10));
            counterBloc.add2.add(Random().nextInt(10));
            counterBloc.add3.add(Random().nextInt(10));
          },
          tooltip: 'Increment',
          child: Text(
            "stream1,2,3",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
