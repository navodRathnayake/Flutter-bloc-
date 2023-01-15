import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_b_event.dart';
part 'bloc_b_state.dart';

class BlocBBloc extends Bloc<BlocBEvent, BlocBState> {
  BlocBBloc() : super(BlocBInitial()) {
    on<BlocBEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
