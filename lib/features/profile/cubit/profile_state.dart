part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loaded({
    UserModel? userModel,
  }) = _Loaded;
  const factory ProfileState.loading({
    required bool isLoading,
  }) = _Loading;
  const factory ProfileState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
}
