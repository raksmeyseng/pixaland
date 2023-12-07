import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:pixaland/config/routes/app_route.dart';
import 'package:pixaland/core/animation/my_animated_switcher.dart';
import 'package:pixaland/core/enum/base_status_enum.dart';
import 'package:pixaland/core/modules/homefeed/bloc/homefeed_bloc.dart';
import 'package:pixaland/widgets/load_data_failed.dart';
import 'package:pixaland/widgets/text_widget.dart';

class HomeFeedView extends StatelessWidget {
  const HomeFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeedBloc, HomeFeedState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MyAnimatedSwitcher(
          child: _buildChild(state.status),
        );
      },
    );
  }

  Widget _buildChild(BaseStatusEnum status) {
    switch (status) {
      case BaseStatusEnum.success:
        return const _SuccessView();
      case BaseStatusEnum.failure:
        return const _FailureView();
      default:
        return const _LoadingView();
    }
  }
}

// ======================
// Success View
// ======================
class _SuccessView extends StatelessWidget {
  const _SuccessView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeedBloc, HomeFeedState>(
      buildWhen: (previous, current) => current.images != previous.images,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              const TextWidget('All'),
              const _Indicator(),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    pattern: [
                      const WovenGridTile(1),
                      const WovenGridTile(
                        5 / 7,
                        crossAxisRatio: 0.9,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: state.images.length,
                    (context, i) => Hero(
                      tag: state.images[i].id,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: GestureDetector(
                              onTap: () {
                                context.goNamed(
                                  AppRoute.imageDetails,
                                  params: {'id': state.images[i].id},
                                  extra: {
                                    'imageUrl': state.images[i].downloadUrl
                                  },
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl: state.images[i].downloadUrl,
                                fit: BoxFit.cover,
                                width: state.images[i].width,
                                height: state.images[i].height,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextWidget(
                              state.images[i].author,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ======================
// Failure View
// ======================
class _FailureView extends StatelessWidget {
  const _FailureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadDataFailed());
  }
}

// ======================
// Loading View
// ======================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 30,
      margin: const EdgeInsets.only(top: 5),
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
