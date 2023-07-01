import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit():super(CounterAState());
  int teamAPoints = 0, teamBPoints = 0;
  int teamA=-1,teamB=-1;
  void Reset(){
    teamBPoints=0;
    teamAPoints=0;
    emit(RestState());
  }

  void TeamIncrement({required String team,required int value}){
    if(team=='A'){
      teamAPoints+=value;
      emit(CounterAState());
    }
    else {
      teamBPoints+=value;
      emit(CounterBState());
    }
  }

  void selectTeam(int teamIndex) {
    if (teamA == -1&& teamB != teamIndex) {
      teamA = teamIndex;
      print("select teamA");
      emit(SelectAState());
    }
    else if (teamB == -1 && teamA != teamIndex) {
      teamB = teamIndex;
      print("select teamB");
      emit(SelectBState());
    }
    else if (teamB == teamIndex) {
      teamB = -1;
      print("UnSelect teamB");
      emit(UnSelectBState());
    }
    else if (teamA == teamIndex) {
      teamA = -1;
      print("UnSelect teamA");
      emit(UnSelectAState());
    }

  }
}