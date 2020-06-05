import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/actions/counter_actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(//1 ฉีด CounterBolc เข้าไปใน MyHomePage เพื่อที่จะเรียก CounterBolc ได้ทั้งหน้า
        create: (_) => CounterBolc(),
        child: MyHomePage(title: 'Flutter Bloc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  BlocBuilder<CounterBolc, int>(
                      builder: (_, count) {//2. count คือ state ที่อยู่ใน CounterBolc
                        return Text(
                          '$count',
                          style: Theme.of(context).textTheme.headline4,
                        );
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){
                      //3.add event
                      context.bloc<CounterBolc>().add(CounterEvent.Increment);
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      context.bloc<CounterBolc>().add(CounterEvent.Decrement);
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // Th
      // is trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
