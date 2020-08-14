import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void loadUser(id) async {
    emit(LoadUserState(id));
    User user = await UserServices.getUser(id);
    emit(UserLoadedState(user));
  }

  void signOut() async {
    emit(SignOutState());
  }

  void updateData({name, profileImage}) async {
    User userUpdate = (state as UserLoadedState)
        .user
        .copyWith(name: name, profilePicture: profileImage);

    await UserServices.updateUser(userUpdate);

    emit(UserLoadedState(userUpdate));
  }

  void topUp(userUpdate, amount) async {
    User updatedUser = (state as UserLoadedState)
        .user
        .copyWith(balance: (state as UserLoadedState).user.balance + amount);

    await UserServices.updateUser(updatedUser);

    emit(UserLoadedState(userUpdate));
  }

  void purchase(amount) async {
    User updatedUser = (state as UserLoadedState)
        .user
        .copyWith(balance: (state as UserLoadedState).user.balance - amount);

    await UserServices.updateUser(updatedUser);

    emit(UserLoadedState(updatedUser));
  }
}
