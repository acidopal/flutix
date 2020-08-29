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

  void goToProfilePage() async {
    emit(ProfileState());
  }

  void goToMainPage({int bottomNavBarIndex, bool isExpired}) async {
    emit(MainState(bottomNavBarIndex: bottomNavBarIndex, isExpired: isExpired));
  }

  void goToRegistrationPage(RegistrationData registrationData) async {
    emit(RegistrationState(registrationData));
  }

  void goToPreferencePage(RegistrationData registrationData) async {
    emit(PreferenceState(registrationData));
  }

  void goToAccountConfirmationPage(RegistrationData registrationData) async {
    emit(AccountConfirmationState(registrationData));
  }

  void goToMovieDetail(Movie movie) async {
    emit(MovieDetailState(movie));
  }

  void goToSelectSchedulePage(MovieDetail movieDetail) async {
    emit(SelectScheduleState(movieDetail));
  }

  void goToSelectSeatPage(Ticket ticket) async {
    emit(SelectSeatState(ticket));
  }

  void goToCheckoutPage(Ticket ticket) async {
    emit(CheckoutState(ticket));
  }

  void goToSuccesPage(Ticket ticket, FlutixTransaction transaction) async {
    emit(OnSuccessState(ticket, transaction));
  }

  void goToTicketDetailPage(Ticket ticket) async {
    emit(OnTicketDetailState(ticket));
  }

  void goToEditProfilePage(User user) async {
    emit(EditProfileState(user));
  }

  void goToTopUpPage(PageState pageState) async {
    emit(TopUpState(pageState));
  }

  void goToWalletPage(PageState pageState) async {
    emit(WalletState(pageState));
  }
}
