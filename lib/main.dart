import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharefair/view/body.dart';
import 'package:sharefair/view_model/bloc/navbarcubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBarCubit()),
      ],
      child: MaterialApp(
        title: 'File Integrity Checker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  iconColor: MaterialStatePropertyAll(Colors.deepPurple))),
          scaffoldBackgroundColor: Color(0xFFF4FBF6),
          navigationBarTheme: NavigationBarThemeData(
              iconTheme: MaterialStatePropertyAll(
                  IconThemeData(color: Colors.deepPurple))),
          appBarTheme: AppBarTheme(
            color: Color(0xFFCCE5E7),
          ),
        ),
        home: MainPage(),
      ),
    );
  }
}
