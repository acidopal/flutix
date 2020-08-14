import 'package:bwa_flutix/cubit/cubits.dart';
import 'package:bwa_flutix/cubit/theme_cubit.dart';
import 'package:bwa_flutix/cubit/ticket_cubit.dart';
import 'package:bwa_flutix/cubit/user_cubit.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:bwa_flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.userStream,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PageCubit(),
            ),
            BlocProvider(
              create: (context) => UserCubit(),
            ),
            BlocProvider(
              create: (context) => ThemeCubit(),
            ),
            BlocProvider(
              create: (context) => MovieCubit()..fetchMovie(),
            ),
            BlocProvider(
              create: (context) => TicketCubit(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: (state is ChangeThemeState) ? state.themeData : null,
                debugShowCheckedModeBanner: false,
                home: Wrapper(),
              );
            },
          ),
        ));
  }
}
