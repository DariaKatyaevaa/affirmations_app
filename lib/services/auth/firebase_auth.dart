import 'package:affirmations_app/providers/services_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  final ProviderRef _ref;

  FirebaseAuthService(this._auth, this._ref);

  User? get currentUser => _auth.currentUser;

  bool get isSignIn => _auth.currentUser != null;

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return authResult.user;
    } catch (exception) {
      rethrow;
    }
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return authResult.user;
    } catch (exception) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _ref.read(storageServiceProvider).clear();
  }
}
