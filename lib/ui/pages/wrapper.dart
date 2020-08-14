part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevPageState is SplashState)) {
        prevPageState = SplashState();
        context.bloc<PageCubit>().goToSplashPage();
      }
    } else {
      if (!(prevPageState is MainState)) {
        context.bloc<UserCubit>().loadUser(firebaseUser.uid);
        context.bloc<TicketCubit>().getTicket(firebaseUser.uid);

        prevPageState = MainState();
        context.bloc<PageCubit>().goToMainPage();
      }
    }

    return BlocBuilder<PageCubit, PageState>(builder: (context, state) {
      if (state is SplashState) {
        return SplashPage();
      } else if (state is LoginState) {
        return SignInPage();
      } else if (state is RegistrationState) {
        return SignUpPage(state.registrationData);
      } else if (state is PreferenceState) {
        return PreferencePage(state.registrationData);
      } else if (state is AccountConfirmationState) {
        return AccountConfirmationPage(state.registrationData);
      } else if (state is MovieDetailState) {
        return MovieDetailPage(state.movie);
      } else if (state is SelectScheduleState) {
        return SelectSchedulePage(state.movieDetail);
      } else if (state is SelectSeatState) {
        return SelectSeatPage(state.ticket);
      } else if (state is CheckoutState) {
        return CheckoutPage(state.ticket);
      } else if (state is OnSuccessState) {
        return SuccessPage(state.ticket, state.transaction);
      } else if (state is OnTicketDetailState) {
        return TicketDetailPage(state.ticket);
      } else if (state is MainState) {
        return MainPage(
            bottomNavBarIndex: state.bottomNavBarIndex,
            isExpired: state.isExpired);
      } else {
        return Container();
      }
    });
  }
}
