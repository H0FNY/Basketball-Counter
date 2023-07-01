import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter_cubit.dart';
import '../cubit/counter_state.dart';
import '../shared/shared.dart';
import 'counter_screen.dart';

class Home extends StatelessWidget {
  // void selectTeam(int teamIndex) {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return BlocConsumer<CounterCubit, CounterState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xff1D428A),
            body: Column(
              children: [
                SizedBox(
                  height: screenheight / 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                      mainAxisSpacing: screenheight / 55,
                      crossAxisSpacing: screenWidth / 35,
                      crossAxisCount: 3,
                      children: [
                        for (int i = 0; i < teams.length; i++)
                          Card(
                            screenWidth: screenWidth,
                            screenheight: screenheight,
                            image: teams[i]["img"],
                            fname: teams[i]["fname"],
                            sname: teams[i]["sname"],
                            onTap: () => BlocProvider.of<CounterCubit>(context).selectTeam(i),
                            selected: i == BlocProvider.of<CounterCubit>(context).teamA || i == BlocProvider.of<CounterCubit>(context).teamB,
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      backgroundColor: Colors.white,
                      minimumSize: Size(150, 30),
                    ),
                    onPressed: () {
                      if (BlocProvider.of<CounterCubit>(context).teamA != -1 && BlocProvider.of<CounterCubit>(context).teamB != -1) {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context) => CounterScreen()), (route) => false);
                      }
                    },
                    child: Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenWidth / 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight / 22,
                ),
              ],
            ),
          );
        },
        listener: (context, state) {

        });
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.screenWidth,
    required this.screenheight,
    required this.image,
    required this.fname,
    required this.sname,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final bool selected;
  final String image;
  final String fname;
  final String sname;
  final double screenWidth;
  final double screenheight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: screenWidth / 3.2,
        height: screenheight / 6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            SizedBox(
              width: screenWidth / 3.2,
              height: screenheight / 6,
              child: Image.asset(
                image,
                scale: screenWidth / 17,
              ),
            ),
            Visibility(
              visible: selected,
              child: Container(
                width: screenWidth / 3.2,
                height: screenheight / 6,
                color: Colors.white.withOpacity(.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fname,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenWidth / 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sname,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenWidth / 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
