
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.title,required this.colors}) : super(key: key);

  final String title;
  final Color colors;

  @override
  State<ThirdScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ThirdScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if(state.wasIncremented){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Was Incremented")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Was Decremented")));
        }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).incrementState();
                    },
                    tooltip: "increment",
                    child: const Icon(
                      Icons.add,
                    )),
                FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrementState();
                    },
                    tooltip: "decrement",
                    child: const Icon(
                      Icons.mail,
                    )),
              ],
            ),
            const SizedBox(height: 20,),
            MaterialButton(onPressed: (){}, color: widget.colors, child: const Text("Go to second screen"),)
          ],
        ),
      ),
    );
  }
}
