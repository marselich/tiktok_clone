part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loaded({
    required UserModel user,
  }) = _Loaded;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loadingFailure() = _LoadingFailure;
}
