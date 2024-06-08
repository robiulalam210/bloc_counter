import 'package:bloc_counter/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter/bloc/counter/counter_event.dart';
import 'package:bloc_counter/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("all build");
    return Scaffold(

      appBar: AppBar(),

      body: Container(child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
            print("all bloc");

            return  Text(state.counter.toString(),style: TextStyle(fontSize: 30),);
          }),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
          ElevatedButton(onPressed: (){

            context.read<CounterBloc>().add(IncrementCounter());

          }, child: const Text("Increment")),
          ElevatedButton(onPressed: (){
            context.read<CounterBloc>().add(DecrementCounter());

          }, child: const Text("Decrement")),
        ],)


      ],),),
    );
  }
}
