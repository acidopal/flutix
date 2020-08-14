import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:equatable/equatable.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitial());

  void goToLoginPage() async {
    emit(LoginState());
  }

  void goToSplashPage() async {
    emit(SplashState());
  }

  void goToMainPage({bottomNavBarIndex, isExpired}) async {
    emit(MainState(bottomNavBarIndex: bottomNavBarIndex, isExpired: isExpired));
  }

  void goToRegistrationPage(registrationData) async {
    emit(RegistrationState(registrationData));
  }

  void goToPreferencePage(registrationData) async {
    emit(PreferenceState(registrationData));
  }

  void goToAccountConfirmationPage(registrationData) async {
    emit(AccountConfirmationState(registrationData));
  }

  void goToMovieDetail(movie) async {
    emit(MovieDetailState(movie));
  }

  void goToSelectSchedulePage(movieDetail) async {
    emit(SelectScheduleState(movieDetail));
  }

  void goToSelectSeatPage(ticket) async {
    emit(SelectSeatState(ticket));
  }

  void goToCheckoutPage(ticket) async {
    emit(CheckoutState(ticket));
  }

  void goToSuccesPage(ticket, transaction) async {
    emit(OnSuccessState(ticket, transaction));
  }

  void goToTicketDetailPage(ticket) async {
    emit(OnTicketDetailState(ticket));
  }
}
