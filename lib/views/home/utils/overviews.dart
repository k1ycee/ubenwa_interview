import 'package:ubenwa_thankgod/assets/assets.gen.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';

import 'overview_model.dart';

List<OverviewModel> overviews = [
  OverviewModel(
      header: 'Number of Cry Episode',
      image: UbenwaAssets.images.svg.icCryCount.svg(),
      count: '45',
      imageBackgroundColor: lavendarBlue100,
      commentaryColor: green,
      commentary: '20% better than yesterday'),
  OverviewModel(
      header: 'Longest Cry Duration',
      image: UbenwaAssets.images.svg.icCryDuration.svg(),
      count: '30mins',
      imageBackgroundColor: yellow200,
      commentaryColor: red,
      commentary: '20% worst than yesterday'),
  OverviewModel(
      header: 'Cumulative Cry Duration',
      image: UbenwaAssets.images.svg.icCummulative.svg(),
      count: '4hours',
      imageBackgroundColor: purple200,
      commentaryColor: green,
      commentary: '20% better than yesterday'),
];
