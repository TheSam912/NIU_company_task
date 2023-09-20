import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niu_app/states/storage_state.dart';

class AuthArgs {
  final String email;
  final String password;
  AuthArgs({required this.email, required this.password});
}

class AuthResponse {
  AuthResponse({required this.authArgs, required this.statusCode});
  final AuthArgs authArgs;
  final int statusCode;
}

class AuthenticationHandler {
  late AuthArgs authValues = AuthArgs(email: '', password: '');

  Future login(AuthArgs args) async {
    return AuthResponse(
      authArgs: AuthArgs(email: "Sobhan", password: "123"),
      statusCode: 200,
    );
  }
}

final authenticationHandlerProvider = StateProvider<AuthenticationHandler>(
  (_) => AuthenticationHandler(),
);

final authLoginProvider = FutureProvider.family<bool, AuthArgs>(
  (ref, authArgs) async {
    return Future.delayed(const Duration(seconds: 2), () async {
      final authResponse = await ref.watch(authenticationHandlerProvider).login(
            authArgs,
          );
      final isAuthenticated = authResponse.statusCode == 200;
      if (isAuthenticated) {
        ref.read(setAuthStateProvider.notifier).state = authResponse;
        ref.read(setIsAuthenticatedProvider(isAuthenticated));
        ref.read(setAuthenticatedUserProvider(authResponse.authValues.email));
      } else {
        ref.read(authErrorMessageProvider.notifier).state =
            'Error occurred while login with code: ${authResponse.statusCode}';
      }

      return isAuthenticated;
    });
  },
);

final authErrorMessageProvider = StateProvider<String>(
  (ref) => '',
);
