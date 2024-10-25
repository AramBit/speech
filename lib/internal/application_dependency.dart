import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_live_project/domain/recoverPasswordCubit/recover_password_cubit.dart';

import '../domain/homeCubit/home_cubit.dart';
import '../domain/registrationVerificationCubit/registration_verification_cubit.dart';
import '../domain/resgistrationCubit/registration_cubit.dart';
import '../domain/signInCubit/sig_in_cubit.dart';
import '../domain/streamCubit/stream_cubit.dart';
import '../presentation/routing.dart';
import '../presentation/uiConstants/ui_colors.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StreamCubit>(
          create: (BuildContext context) => StreamCubit(),
        ),
        BlocProvider<RegistrationCubit>(
          create: (BuildContext context) => RegistrationCubit(),
        ),
        BlocProvider<RegistrationVerificationCubit>(
          create: (BuildContext context) => RegistrationVerificationCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (BuildContext context) => SignInCubit(),
        ),
        BlocProvider<RecoverPasswordCubit>(
          create: (BuildContext context) => RecoverPasswordCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
      ],
      child: SafeArea(
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: UiColors.uiBlack,
          ),
          debugShowCheckedModeBanner: false,
          routes: AppRouting().routes,
        ),
      ),
    );
  }
}
