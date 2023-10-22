// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoPlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VideoModel model) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(int currentPage, bool isOnPageTurning)
        pageScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VideoModel model)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(int currentPage, bool isOnPageTurning)? pageScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VideoModel model)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(int currentPage, bool isOnPageTurning)? pageScrolled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingFailure value) loadingFailure,
    required TResult Function(_PageScrolled value) pageScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_PageScrolled value)? pageScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_PageScrolled value)? pageScrolled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPlayerStateCopyWith<$Res> {
  factory $VideoPlayerStateCopyWith(
          VideoPlayerState value, $Res Function(VideoPlayerState) then) =
      _$VideoPlayerStateCopyWithImpl<$Res, VideoPlayerState>;
}

/// @nodoc
class _$VideoPlayerStateCopyWithImpl<$Res, $Val extends VideoPlayerState>
    implements $VideoPlayerStateCopyWith<$Res> {
  _$VideoPlayerStateCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VideoPlayerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VideoModel model) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(int currentPage, bool isOnPageTurning)
        pageScrolled,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VideoModel model)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(int currentPage, bool isOnPageTurning)? pageScrolled,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VideoModel model)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(int currentPage, bool isOnPageTurning)? pageScrolled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
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
    required TResult Function(_PageScrolled value) pageScrolled,
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
    TResult? Function(_PageScrolled value)? pageScrolled,
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
    TResult Function(_PageScrolled value)? pageScrolled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VideoPlayerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VideoModel model});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$LoadedImpl(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VideoModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.model});

  @override
  final VideoModel model;

  @override
  String toString() {
    return 'VideoPlayerState.loaded(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VideoModel model) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(int currentPage, bool isOnPageTurning)
        pageScrolled,
  }) {
    return loaded(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VideoModel model)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(int currentPage, bool isOnPageTurning)? pageScrolled,
  }) {
    return loaded?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VideoModel model)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(int currentPage, bool isOnPageTurning)? pageScrolled,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(model);
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
    required TResult Function(_PageScrolled value) pageScrolled,
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
    TResult? Function(_PageScrolled value)? pageScrolled,
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
    TResult Function(_PageScrolled value)? pageScrolled,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements VideoPlayerState {
  const factory _Loaded({required final VideoModel model}) = _$LoadedImpl;

  VideoModel get model;
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
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$LoadingImpl>
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

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'VideoPlayerState.loading(isLoading: $isLoading)';
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
    required TResult Function() initial,
    required TResult Function(VideoModel model) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(int currentPage, bool isOnPageTurning)
        pageScrolled,
  }) {
    return loading(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VideoModel model)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(int currentPage, bool isOnPageTurning)? pageScrolled,
  }) {
    return loading?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VideoModel model)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(int currentPage, bool isOnPageTurning)? pageScrolled,
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
    required TResult Function(_PageScrolled value) pageScrolled,
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
    TResult? Function(_PageScrolled value)? pageScrolled,
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
    TResult Function(_PageScrolled value)? pageScrolled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VideoPlayerState {
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
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$LoadingFailureImpl>
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

class _$LoadingFailureImpl implements _LoadingFailure {
  const _$LoadingFailureImpl(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'VideoPlayerState.loadingFailure(error: $error)';
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
    required TResult Function() initial,
    required TResult Function(VideoModel model) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(int currentPage, bool isOnPageTurning)
        pageScrolled,
  }) {
    return loadingFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VideoModel model)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(int currentPage, bool isOnPageTurning)? pageScrolled,
  }) {
    return loadingFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VideoModel model)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(int currentPage, bool isOnPageTurning)? pageScrolled,
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
    required TResult Function(_PageScrolled value) pageScrolled,
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
    TResult? Function(_PageScrolled value)? pageScrolled,
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
    TResult Function(_PageScrolled value)? pageScrolled,
    required TResult orElse(),
  }) {
    if (loadingFailure != null) {
      return loadingFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadingFailure implements VideoPlayerState {
  const factory _LoadingFailure(final String? error) = _$LoadingFailureImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$LoadingFailureImplCopyWith<_$LoadingFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PageScrolledImplCopyWith<$Res> {
  factory _$$PageScrolledImplCopyWith(
          _$PageScrolledImpl value, $Res Function(_$PageScrolledImpl) then) =
      __$$PageScrolledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int currentPage, bool isOnPageTurning});
}

/// @nodoc
class __$$PageScrolledImplCopyWithImpl<$Res>
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$PageScrolledImpl>
    implements _$$PageScrolledImplCopyWith<$Res> {
  __$$PageScrolledImplCopyWithImpl(
      _$PageScrolledImpl _value, $Res Function(_$PageScrolledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? isOnPageTurning = null,
  }) {
    return _then(_$PageScrolledImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isOnPageTurning: null == isOnPageTurning
          ? _value.isOnPageTurning
          : isOnPageTurning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PageScrolledImpl implements _PageScrolled {
  const _$PageScrolledImpl(
      {this.currentPage = 0, this.isOnPageTurning = false});

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isOnPageTurning;

  @override
  String toString() {
    return 'VideoPlayerState.pageScrolled(currentPage: $currentPage, isOnPageTurning: $isOnPageTurning)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageScrolledImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isOnPageTurning, isOnPageTurning) ||
                other.isOnPageTurning == isOnPageTurning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage, isOnPageTurning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageScrolledImplCopyWith<_$PageScrolledImpl> get copyWith =>
      __$$PageScrolledImplCopyWithImpl<_$PageScrolledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VideoModel model) loaded,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String? error) loadingFailure,
    required TResult Function(int currentPage, bool isOnPageTurning)
        pageScrolled,
  }) {
    return pageScrolled(currentPage, isOnPageTurning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VideoModel model)? loaded,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String? error)? loadingFailure,
    TResult? Function(int currentPage, bool isOnPageTurning)? pageScrolled,
  }) {
    return pageScrolled?.call(currentPage, isOnPageTurning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VideoModel model)? loaded,
    TResult Function(bool isLoading)? loading,
    TResult Function(String? error)? loadingFailure,
    TResult Function(int currentPage, bool isOnPageTurning)? pageScrolled,
    required TResult orElse(),
  }) {
    if (pageScrolled != null) {
      return pageScrolled(currentPage, isOnPageTurning);
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
    required TResult Function(_PageScrolled value) pageScrolled,
  }) {
    return pageScrolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingFailure value)? loadingFailure,
    TResult? Function(_PageScrolled value)? pageScrolled,
  }) {
    return pageScrolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingFailure value)? loadingFailure,
    TResult Function(_PageScrolled value)? pageScrolled,
    required TResult orElse(),
  }) {
    if (pageScrolled != null) {
      return pageScrolled(this);
    }
    return orElse();
  }
}

abstract class _PageScrolled implements VideoPlayerState {
  const factory _PageScrolled(
      {final int currentPage, final bool isOnPageTurning}) = _$PageScrolledImpl;

  int get currentPage;
  bool get isOnPageTurning;
  @JsonKey(ignore: true)
  _$$PageScrolledImplCopyWith<_$PageScrolledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
