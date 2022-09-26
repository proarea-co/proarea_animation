import 'package:flutter/material.dart';

import '../../../bloc/users/users_cubit.dart';
import '../../views/base_builders/app_consumer.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConsumer<UsersCubit, UsersState>(
      builder: (state) {
        return Scaffold(
          appBar: AppBar(),
          body: Text(state.users.join()),
        );
      },
    );
  }
}
