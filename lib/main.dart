import 'package:bloctest/viewmodel/bloc/cubit/posts/PostCubit.dart';
import 'package:bloctest/viewmodel/database/network/dio-helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/Screens/postScreen.dart';
import 'viewmodel/bloc/MyBlocObserver.dart';
import 'viewmodel/database/local/shared_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize DioHelper and CashHelper to Run.
  await SharedHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PostCubit()),


      ],
      child: MaterialApp(
        title: 'posts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostScreen(),
      ),
    );
  }
}