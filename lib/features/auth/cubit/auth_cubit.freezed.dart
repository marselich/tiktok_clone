// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) initial,
    required TResult Function(UserModel user) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(File? image) imageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? initial,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(File? image)? imageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? initial,
    TResult Function(UserModel user)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(File? image)? imageLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingFailure value) loadingFailure,
    required TResult Function(_ImageLoaded value) imageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_ImageLoaded value)? imageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_ImageLoaded value)? imageLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$InitialImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.initial'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) initial,
    required TResult Function(UserModel user) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(File? image) imageLoaded,
  }) {
    return initial(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? initial,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(File? image)? imageLoaded,
  }) {
    return initial?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? initial,
    TResult Function(UserModel user)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(File? image)? imageLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingFailure value) loadingFailure,
    required TResult Function(_ImageLoaded value) imageLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_ImageLoaded value)? imageLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_ImageLoaded value)? imageLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial({required final UserModel user}) = _$InitialImpl;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoadedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loaded(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loaded'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) initial,
    required TResult Function(UserModel user) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(File? image) imageLoaded,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? initial,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(File? image)? imageLoaded,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? initial,
    TResult Function(UserModel user)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(File? image)? imageLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingFailure value) loadingFailure,
    required TResult Function(_ImageLoaded value) imageLoaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_ImageLoaded value)? imageLoaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_ImageLoaded value)? imageLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthState {
  const factory _Loaded({required final UserModel user}) = _$LoadedImpl;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$LoadingImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loading(isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loading'))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) initial,
    required TResult Function(UserModel user) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(File? image) imageLoaded,
  }) {
    return loading(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? initial,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(File? image)? imageLoaded,
  }) {
    return loading?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? initial,
    TResult Function(UserModel user)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(File? image)? imageLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingFailure value) loadingFailure,
    required TResult Function(_ImageLoaded value) imageLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_ImageLoaded value)? imageLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_ImageLoaded value)? imageLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading({required final bool isLoading}) = _$LoadingImpl;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingFailureImplCopyWith<$Res> {
  factory _$$LoadingFailureImplCopyWith(_$LoadingFailureImpl value,
          $Res Function(_$LoadingFailureImpl) then) =
      __$$LoadingFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$LoadingFailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingFailureImpl>
    implements _$$LoadingFailureImplCopyWith<$Res> {
  __$$LoadingFailureImplCopyWithImpl(
      _$LoadingFailureImpl _value, $Res Function(_$LoadingFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$LoadingFailureImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadingFailureImpl
    with DiagnosticableTreeMixin
    implements _LoadingFailure {
  const _$LoadingFailureImpl(this.error);

  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loadingFailure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loadingFailure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingFailureImplCopyWith<_$LoadingFailureImpl> get copyWith =>
      __$$LoadingFailureImplCopyWithImpl<_$LoadingFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) initial,
    required TResult Function(UserModel user) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(File? image) imageLoaded,
  }) {
    return loadingFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? initial,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(File? image)? imageLoaded,
  }) {
    return loadingFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? initial,
    TResult Function(UserModel user)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(File? image)? imageLoaded,
    required TResult orElse(),
  }) {
    if (loadingFailure != null) {
      return loadingFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingFailure value) loadingFailure,
    required TResult Function(_ImageLoaded value) imageLoaded,
  }) {
    return loadingFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_ImageLoaded value)? imageLoaded,
  }) {
    return loadingFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_ImageLoaded value)? imageLoaded,
    required TResult orElse(),
  }) {
    if (loadingFailure != null) {
      return loadingFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadingFailure implements AuthState {
  const factory _LoadingFailure(final String? error) = _$LoadingFailureImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$LoadingFailureImplCopyWith<_$LoadingFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageLoadedImplCopyWith<$Res> {
  factory _$$ImageLoadedImplCopyWith(
          _$ImageLoadedImpl value, $Res Function(_$ImageLoadedImpl) then) =
      __$$ImageLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File? image});
}

/// @nodoc
class __$$ImageLoadedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ImageLoadedImpl>
    implements _$$ImageLoadedImplCopyWith<$Res> {
  __$$ImageLoadedImplCopyWithImpl(
      _$ImageLoadedImpl _value, $Res Function(_$ImageLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_$ImageLoadedImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$ImageLoadedImpl with DiagnosticableTreeMixin implements _ImageLoaded {
  const _$ImageLoadedImpl({this.image});

  @override
  final File? image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.imageLoaded(image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.imageLoaded'))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageLoadedImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageLoadedImplCopyWith<_$ImageLoadedImpl> get copyWith =>
      __$$ImageLoadedImplCopyWithImpl<_$ImageLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) initial,
    required TResult Function(UserModel user) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(File? image) imageLoaded,
  }) {
    return imageLoaded(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? initial,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(File? image)? imageLoaded,
  }) {
    return imageLoaded?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? initial,
    TResult Function(UserModel user)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(File? image)? imageLoaded,
    required TResult orElse(),
  }) {
    if (imageLoaded != null) {
      return imageLoaded(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingFailure value) loadingFailure,
    required TResult Function(_ImageLoaded value) imageLoaded,
  }) {
    return imageLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_ImageLoaded value)? imageLoaded,
  }) {
    return imageLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_ImageLoaded value)? imageLoaded,
    required TResult orElse(),
  }) {
    if (imageLoaded != null) {
      return imageLoaded(this);
    }
    return orElse();
  }
}

abstract class _ImageLoaded implements AuthState {
  const factory _ImageLoaded({final File? image}) = _$ImageLoadedImpl;

  File? get image;
  @JsonKey(ignore: true)
  _$$ImageLoadedImplCopyWith<_$ImageLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
