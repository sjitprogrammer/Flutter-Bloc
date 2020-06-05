import 'package:bloc/bloc.dart';
import 'package:flutterbloc/actions/counter_actions.dart';

class CounterBolc extends Bloc<CounterEvent,int>{
  @override
  //status เริ่มต้น
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch(event){
      case CounterEvent.Increment:
        yield state +1;
        break;
      case CounterEvent.Decrement:
        yield state -1;
        break;
    }
  }

}