import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixaland/config/themes/app_color.dart';
import 'package:pixaland/core/modules/image_details/bloc/image_details_bloc.dart';
import 'package:pixaland/core/modules/image_details/repositories/image_details_repository.dart';
import 'package:pixaland/core/modules/image_details/view/image_details_view.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({
    super.key,
    required this.imageId,
    required this.imageUrl,
  });

  final int imageId;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageDetailsBloc(
        repository: ImageDetailsRepository(),
        imageId: imageId,
      )..add(const ImageDetailsStarted()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: imageId.toString(),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const ImageDetailsView()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: SafeArea(
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColor.black.withOpacity(0.4),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: AppColor.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
