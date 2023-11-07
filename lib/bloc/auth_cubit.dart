import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final auth = FirebaseAuth.instance;

  void register({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(AuthFailed(error: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(AuthFailed(error: "The account already exists for that email."));
      }
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  void login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(AuthFailed(error: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

        emit(AuthFailed(error: "Wrong password provided for that user."));
      }
    }
  }

  void logOut() async {
    try {
      await auth.signOut();
      emit(LogOutSuccess());
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }
}
