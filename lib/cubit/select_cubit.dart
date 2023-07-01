// import 'package:basketball_counter_app/cubit/select_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SelectCubit extends Cubit<SelectState>{
//   SelectCubit():super(SelectAState());
//   int teamA=-1,teamB=-1,selected=0;
//   void selectTeam(int teamIndex) {
//     if (teamA == -1) {
//       teamA = teamIndex;
//       emit(SelectAState());
//     } else if (teamB == -1 && teamA != teamIndex) {
//       teamB = teamIndex;
//       emit(SelectBState());
//     } else if (teamB == teamIndex) {
//       teamB = -1;
//       emit(UnSelectBState());
//     } else if (teamA == teamIndex) {
//       teamA = -1;
//       emit(UnSelectAState());
//     }
//   }
// }