import 'package:bwa_flutix/cubit/cubits.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:bwa_flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          CubitProvider(
            create: (context) => PageCubit(),
          ),
          CubitProvider(
            create: (context) => UserCubit(),
          ),
          CubitProvider(
            create: (context) => ThemeCubit(),
          ),
           CubitProvider(
            create: (context) => MovieCubit()..fetchMovie(),
          ),
           CubitProvider(
            create: (context) => TicketCubit(),
          ),
        ],
        child: CubitBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
             return MaterialApp(
                theme: (state is ChangeThemeState) ? state.themeData : null,
                debugShowCheckedModeBanner: false,
                home: Wrapper(),
              );
          },
        ),
      ),
    );
  }
}
