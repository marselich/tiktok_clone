part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial({
    required UserModel user,
  }) = _Initial;
  const factory AuthState.loaded({
    required UserModel user,
  }) = _Loaded;
  const factory AuthState.loading({
    required bool isLoading,
  }) = _Loading;
  const factory AuthState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
  const factory AuthState.imageLoaded({
    File? image,
  }) = _ImageLoaded;
}
