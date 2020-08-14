part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final User user;

  UserLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

class LoadUserState extends UserState {
  final String id;

  LoadUserState(this.id);

  @override
  List<Object> get props => [id];
}

class SignOutState extends UserState {
  @override
  List<Object> get props => [];
}

class UpdateDataState extends UserState {
  final User userUpdate;

  UpdateDataState(this.userUpdate);

  @override
  List<Object> get props => [userUpdate];
}

class TopupState extends UserState {
  final int amount;

  TopupState(this.amount);

  @override
  List<Object> get props => [amount];
}

class PurchaseState extends UserState {
  final int amount;

  PurchaseState(this.amount);

  @override
  List<Object> get props => [amount];
}
