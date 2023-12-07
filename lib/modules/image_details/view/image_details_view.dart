import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixaland/config/themes/app_color.dart';
import 'package:pixaland/constants/asset_path.dart';
import 'package:pixaland/core/animation/my_animated_switcher.dart';
import 'package:pixaland/core/enum/base_status_enum.dart';
import 'package:pixaland/modules/image_details/bloc/image_details_bloc.dart';
import 'package:pixaland/widgets/caption_widget.dart';
import 'package:pixaland/widgets/flat_card.dart';
import 'package:pixaland/widgets/load_data_failed.dart';
import 'package:pixaland/widgets/my_text_input.dart';
import 'package:pixaland/widgets/text_widget.dart';

class ImageDetailsView extends StatelessWidget {
  const ImageDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageDetailsBloc, ImageDetailsState>(
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
        return const _ContentView();
      case BaseStatusEnum.failure:
        return const Padding(
          padding: EdgeInsets.only(top: 24),
          child: Center(child: LoadDataFailed()),
        );
      default:
        return const Padding(
          padding: EdgeInsets.only(top: 24),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageDetailsBloc, ImageDetailsState>(
      buildWhen: (previous, current) => current.data != current.data,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _UserProfileInfo(),
                  _FollowButton(),
                ],
              ),
              const SizedBox(height: 16),
              TextWidget(
                state.data.author,
                bold: true,
                size: 24,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Row(
                    children: [
                      _ViewButton(),
                      SizedBox(width: 10),
                      _SaveButton(),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      //do something!
                    },
                    icon: const Icon(Icons.share),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 16),
              const _CommentWidget(),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 24),
              const _ExploreMore(),
            ],
          ),
        );
      },
    );
  }
}

class _UserProfileInfo extends StatelessWidget {
  const _UserProfileInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlatCard(
          borderRadius: 40,
          side: BorderSide(
            width: 1.5,
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
          color: AppColor.white,
          child: Image.asset(
            AssetPath.logo,
            width: 24,
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget('Pixaland', size: 16),
            CaptionWidget('500K Followes'),
          ],
        )
      ],
    );
  }
}

class _FollowButton extends StatelessWidget {
  const _FollowButton();

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: () {
        //do something!
      },
      borderRadius: 40,
      color: Theme.of(context).dividerColor.withOpacity(0.1),
      child: const TextWidget('Follow'),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: () {
        //do something!
      },
      borderRadius: 40,
      color: Theme.of(context).primaryColor,
      child: const TextWidget('Save'),
    );
  }
}

class _ViewButton extends StatelessWidget {
  const _ViewButton();

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: () {
        //do something!
      },
      borderRadius: 40,
      color: Theme.of(context).dividerColor.withOpacity(0.1),
      child: const TextWidget('View'),
    );
  }
}

class _CommentWidget extends StatelessWidget {
  const _CommentWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(
              'What do you think?',
              bold: true,
              size: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextWidget('72'),
                IconButton(
                  onPressed: () {
                    //do something!
                  },
                  icon: const Icon(Icons.favorite_border_rounded),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            FlatCard(
              borderRadius: 40,
              side: BorderSide(
                width: 1.5,
                color: Theme.of(context).dividerColor.withOpacity(0.1),
              ),
              color: AppColor.white,
              child: Image.asset(
                AssetPath.logo,
                width: 24,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: MyTextInput(
                hintText: 'Add a comment',
              ),
            )
          ],
        )
      ],
    );
  }
}

class _ExploreMore extends StatelessWidget {
  const _ExploreMore();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageDetailsBloc, ImageDetailsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget('More to explore'),
            MyAnimatedSwitcher(
              child: _buildChild(state.status),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChild(BaseStatusEnum status) {
    switch (status) {
      case BaseStatusEnum.success:
        return const _SuccessView();
      case BaseStatusEnum.failure:
        return const Center(child: LoadDataFailed());
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageDetailsBloc, ImageDetailsState>(
      buildWhen: (previous, current) => previous.listData != current.listData,
      builder: (context, state) {
        return GridView.custom(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
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
            childCount: state.listData.length,
            (context, i) => Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: state.listData[i].downloadUrl,
                    fit: BoxFit.cover,
                    width: state.listData[i].width,
                    height: state.listData[i].height,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextWidget(
                    state.listData[i].author,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
