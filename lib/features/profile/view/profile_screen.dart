import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/profile/cubit/profile_cubit.dart';

import 'package:tiktok_clone/features/profile/widgets/widgets.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';
import 'package:tiktok_clone/core/features/auth_profile/widgets/auth_profile.dart';
import 'package:tiktok_clone/core/widgets/loading_container.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.userId});

  final String? userId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _cubit = ProfileCubit(
    GetIt.I.get<IAuthRepository>(),
    GetIt.I.get<IProfileRepository>(),
  );

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (widget.userId == null) {
      final tabsRouter = AutoTabsRouter.of(context);
      tabsRouter
          .addListener(() => _cubit.loadingProfile(userId: widget.userId));
    }
    await _cubit.loadingProfile(userId: widget.userId);
  }

  bool _checkIsCurrentUser() {
    if (widget.userId == null) {
      return true;
    } else if (_cubit.getCurrentUserUid() == widget.userId) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (userModel, videoModelList, isFollowing) =>
                  //FirebaseUtils.checkLoginAccount()
                  userModel != null
                      ? AuthProfile(
                          isCurrentUser: _checkIsCurrentUser(),
                          userModel: userModel,
                          videoModelList: videoModelList,
                          isFollowing: isFollowing!,
                        )
                      : const NotAuthProfile(),
              loading: () => const LoadingContainer(),
              orElse: () => Container(),
            );
          },
        ));
  }
}
