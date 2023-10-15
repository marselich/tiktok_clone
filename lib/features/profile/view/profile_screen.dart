import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/profile/cubit/profile_cubit.dart';

import 'package:tiktok_clone/features/profile/widgets/widgets.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';
import 'package:tiktok_clone/ui/utils/dialog_utils.dart';
import 'package:tiktok_clone/ui/utils/firebase_utils.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _cubit = ProfileCubit(GetIt.I.get<IAuthRepository>());

  @override
  void didChangeDependencies() async {
    _cubit.checkLogin(await _cubit.getUserInfo());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          bloc: _cubit,
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (userModel) => FirebaseUtils.checkLoginAccount()
                  ? AuthProfile(userModel: userModel)
                  : const NotAuthProfile(),
              orElse: () => const NotAuthProfile(),
            );
          },
        ));
  }
}
