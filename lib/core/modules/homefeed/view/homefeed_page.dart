import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixaland/core/modules/homefeed/bloc/homefeed_bloc.dart';
import 'package:pixaland/core/modules/homefeed/repositories/homefeed_repository.dart';
import 'package:pixaland/core/modules/homefeed/view/homefeed_view.dart';

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeFeedBloc(
        repository: HomeFeedRepository(),
      )..add(const HomeFeedStarted()),
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: const HomeFeedView(),
      ),
    );
  }
}
