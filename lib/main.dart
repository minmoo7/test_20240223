import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('カウンター'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'ボタンを押してください:',
              ),
              Builder(builder: (context) {
                // final model = Provider.of<CountModel>(context);
                final model = context.watch<CountModel>();
                return Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Consumer<CountModel>(builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () {
                model.incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
