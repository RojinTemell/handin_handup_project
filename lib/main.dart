import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handinhandup/features/services/auth_service.dart';
import 'package:handinhandup/features/view/home_sceen.dart';
import 'package:handinhandup/features/view/login_screen.dart';
import 'package:handinhandup/features/view/splash_screen.dart';
import 'package:handinhandup/firebase_options.dart';
import 'package:provider/provider.dart';

import 'features/blocs/bottom_sheet.dart';
import 'features/router/app_router.dart';
import 'features/widget/grid_card.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomSheetBloc(),
      child: MaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
