import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_files/view/pages/comparepage.dart';
import 'package:fair_files/view/pages/historypage.dart';
import 'package:fair_files/view/pages/homepage.dart';
import 'package:fair_files/view_model/bloc/navbarcubit.dart';
import 'package:fair_files/view_model/bloc/navbarstate.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        final model = context.watch<NavBarCubit>();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 10,
            centerTitle: true,
            title: Text('FAIR FILES',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600)),
          ),
          body: [HomePage(), ComparePage(), HistoryPage()][model.navIndex],
          bottomNavigationBar: NavigationBar(
              onDestinationSelected: (value) => model.navBarIndexChange(value),
              elevation: 2,
              backgroundColor: Color(0xFFCCE5E7),
              selectedIndex: model.navIndex,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              indicatorColor: Colors.transparent,
              destinations: [
                Container(
                    margin: EdgeInsets.all(15),
                    decoration: ShapeDecoration(
                        shape: CircleBorder(
                            side: model.navIndex == 0
                                ? BorderSide(
                                    color: Colors.deepPurpleAccent, width: 3)
                                : BorderSide.none)),
                    child: NavigationDestination(
                        icon: Icon(Icons.home, size: 28), label: '')),
                Container(
                    margin: EdgeInsets.all(15),
                    decoration: ShapeDecoration(
                        shape: CircleBorder(
                            side: model.navIndex == 1
                                ? BorderSide(
                                    color: Colors.deepPurpleAccent, width: 3)
                                : BorderSide.none)),
                    child: NavigationDestination(
                        icon: Icon(Icons.compare, size: 28), label: '')),
                Container(
                    margin: EdgeInsets.all(15),
                    decoration: ShapeDecoration(
                        shape: CircleBorder(
                            side: model.navIndex == 2
                                ? BorderSide(
                                    color: Colors.deepPurpleAccent, width: 3)
                                : BorderSide.none)),
                    child: NavigationDestination(
                        icon: Icon(Icons.history_sharp, size: 30), label: '')),
              ]),
        );
      },
    );
  }
}
