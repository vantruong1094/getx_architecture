import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/movie_controller.dart';
import 'package:getx_demo/models/movie.dart';
import 'package:getx_demo/utils/constants.dart';

import '../base/base_state_layout.dart';

class MoviePage extends GetWidget<MovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Page"),
      ),
      body: Obx(
        () => BaseStateLayout(
          stateLayout: controller.stateLayout.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                controller.showNowPlayingMovie
                    ? _buildGroupMoviceTop(MovieSection.NOW_PLAYING, controller.nowPlayingMovies)
                    : SizedBox.shrink(),
                controller.showPopularMovie
                    ? _buildGroupMoviceTop(MovieSection.POPULAR, controller.popularMovies)
                    : SizedBox.shrink(),
                controller.showTopRatedgMovie
                    ? _buildGroupMoviceTop(MovieSection.TOP_RATED, controller.topRatedMovies)
                    : SizedBox.shrink(),
                controller.showUpCommingMovie
                    ? _buildGroupMoviceTop(MovieSection.UPCOMMING, controller.upcommingMovies)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGroupMoviceTop(MovieSection section, List<Movie> datas) {
    final heightItem = 120 * 16 / 9;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              section.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            height: heightItem,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 12),
              scrollDirection: Axis.horizontal,
              itemCount: datas.length,
              itemBuilder: (ctx, index) {
                final String imageUrl = Constants.posterImageUrl + datas[index].posterPath;
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 12.0, top: 10, bottom: 10),
                  child: Container(
                    width: 120,
                    height: heightItem,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                              offset: Offset(0, 0))
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: InkWell(
                        onTap: () {},
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
