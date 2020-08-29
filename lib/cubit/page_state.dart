part of 'page_cubit.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class PageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class LoginState extends PageState {
  @override
  List<Object> get props => [];
}

class SplashState extends PageState {
  @override
  List<Object> get props => [];
}

class ProfileState extends PageState {
  @override
  List<Object> get props => [];
}

class MainState extends PageState {
  final int bottomNavBarIndex;
  final bool isExpired;

  MainState({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class RegistrationState extends PageState {
  final RegistrationData registrationData;

  RegistrationState(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class PreferenceState extends PageState {
  final RegistrationData registrationData;

  PreferenceState(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class AccountConfirmationState extends PageState {
  final RegistrationData registrationData;

  AccountConfirmationState(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class MovieDetailState extends PageState {
  final Movie movie;

  MovieDetailState(this.movie);

  @override
  List<Object> get props => [movie];
}

class SelectScheduleState extends PageState {
  final MovieDetail movieDetail;

  SelectScheduleState(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class SelectSeatState extends PageState {
  final Ticket ticket;

  SelectSeatState(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class CheckoutState extends PageState {
  final Ticket ticket;

  CheckoutState(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnSuccessState extends PageState {
  final Ticket ticket;
  final FlutixTransaction transaction;

  OnSuccessState(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class OnTicketDetailState extends PageState {
  final Ticket ticket;

  OnTicketDetailState(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class EditProfileState extends PageState {
  final User user;

  EditProfileState(this.user);

  @override
  List<Object> get props => [user];
}

class TopUpState extends PageState {
  final PageState pageState;

  TopUpState(this.pageState);

  @override
  List<Object> get props => [pageState];
}

class WalletState extends PageState {
  final PageState pageState;

  WalletState(this.pageState);

  @override
  List<Object> get props => [pageState];
}
