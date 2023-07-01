import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:basketball_counter_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/shared.dart';

class CounterScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff1D428A),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) => Home()), (route) => false);
                          BlocProvider.of<CounterCubit>(context).teamA=-1;
                          BlocProvider.of<CounterCubit>(context).teamB=-1;
                        },
                        child: Container(
                          height: screenheight/25,
                          width: screenWidth/10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          "MATCH",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: screenWidth / 2.25,
                        child: Container(
                          width: 50,
                          height: 20,
                          color: Color(0xff1D428A),
                          child: Center(
                            child: Text(
                              "DAY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 17,
                      //   left: 15,
                      //   child: Container(
                      //     height: screenheight/25,
                      //     width: screenWidth/10,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.white,
                      //     ),
                      //     child: Icon(Icons.arrow_back),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            teams[BlocProvider.of<CounterCubit>(context).teamA]["img"],
                          ),
                          height: 100,
                          width: 160,
                        ),
                        Column(
                          children: [
                            Text(
                              teams[BlocProvider.of<CounterCubit>(context).teamA]["fname"],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              teams[BlocProvider.of<CounterCubit>(context).teamA]["sname"],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${BlocProvider.of<CounterCubit>(context).teamAPoints}",
                          style: TextStyle(
                            fontSize: BlocProvider.of<CounterCubit>(context).teamAPoints>=100 || BlocProvider.of<CounterCubit>(context).teamBPoints >=100?70:150,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            backgroundColor: Colors.white,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: "A", value: 1);
                          },
                          child: Text(
                            '1 Point',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1D428A),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: "A", value: 2);
                          },
                          child: Text(
                            '2 Points',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1D428A),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: "A", value: 3);
                          },
                          child: Text(
                            '3 Points',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1D428A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: VerticalDivider(
                      indent: 0,
                      endIndent: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            teams[BlocProvider.of<CounterCubit>(context).teamB]["img"],
                          ),
                          height: 100,
                        ),
                        Column(
                          children: [
                            Text(
                              teams[BlocProvider.of<CounterCubit>(context).teamB]["fname"],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              teams[BlocProvider.of<CounterCubit>(context).teamB]["sname"],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${BlocProvider.of<CounterCubit>(context).teamBPoints}",
                          style: TextStyle(
                            fontSize: BlocProvider.of<CounterCubit>(context).teamAPoints>=100 || BlocProvider.of<CounterCubit>(context).teamBPoints >=100?70:150,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            backgroundColor: Colors.white,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: "B", value: 1);
                          },
                          child: Text(
                            '1 Point',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1D428A),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: "B", value: 2);
                          },
                          child: Text(
                            '2 Points',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1D428A),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: "B", value: 3);
                          },
                          child: Text(
                            '3 Points',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1D428A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  backgroundColor: Colors.white,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).Reset();
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1D428A),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}