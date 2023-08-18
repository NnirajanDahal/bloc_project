import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_request/auth/login_screen.dart';
import 'package:get_request/bloc/product_bloc.dart';
import 'package:get_request/main_page/main_page.dart';
// import 'package:get_request/main_page/main_page.dart';
// import 'package:get_request/bloc/product_bloc.dart';

import 'auth/auth_bloc/auth_bloc.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(useMaterial3: true),
//       title: 'Product Fetching Demo',
//       home: BlocProvider(
//         create: (context) => ProductBloc(),
//         child: const LoginScreen(),
//       ),
//     );
//   }
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => ProductBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: LoginScreen(),
        ));
  }
}
