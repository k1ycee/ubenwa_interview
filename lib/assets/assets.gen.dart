/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/baby_bottle.png
  AssetGenImage get babyBottle =>
      const AssetGenImage('assets/images/png/baby_bottle.png');

  /// File path: assets/images/png/crying_baby_face.png
  AssetGenImage get cryingBabyFace =>
      const AssetGenImage('assets/images/png/crying_baby_face.png');

  /// File path: assets/images/png/full_size_suckling_baby.png
  AssetGenImage get fullSizeSucklingBaby =>
      const AssetGenImage('assets/images/png/full_size_suckling_baby.png');

  /// File path: assets/images/png/happy_baby.png
  AssetGenImage get happyBaby =>
      const AssetGenImage('assets/images/png/happy_baby.png');

  /// File path: assets/images/png/happy_baby_face.png
  AssetGenImage get happyBabyFace =>
      const AssetGenImage('assets/images/png/happy_baby_face.png');

  /// File path: assets/images/png/new_born_baby.png
  AssetGenImage get newBornBaby =>
      const AssetGenImage('assets/images/png/new_born_baby.png');

  /// File path: assets/images/png/sad_baby.png
  AssetGenImage get sadBaby =>
      const AssetGenImage('assets/images/png/sad_baby.png');

  /// File path: assets/images/png/sleeping_baby.png
  AssetGenImage get sleepingBaby =>
      const AssetGenImage('assets/images/png/sleeping_baby.png');

  /// File path: assets/images/png/smiling_baby_face.png
  AssetGenImage get smilingBabyFace =>
      const AssetGenImage('assets/images/png/smiling_baby_face.png');

  /// File path: assets/images/png/suckling_baby_face.png
  AssetGenImage get sucklingBabyFace =>
      const AssetGenImage('assets/images/png/suckling_baby_face.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        babyBottle,
        cryingBabyFace,
        fullSizeSucklingBaby,
        happyBaby,
        happyBabyFace,
        newBornBaby,
        sadBaby,
        sleepingBaby,
        smilingBabyFace,
        sucklingBabyFace
      ];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/appIcon.svg
  SvgGenImage get appIcon => const SvgGenImage('assets/images/svg/appIcon.svg');

  /// File path: assets/images/svg/ellipse.svg
  SvgGenImage get ellipse => const SvgGenImage('assets/images/svg/ellipse.svg');

  /// File path: assets/images/svg/ic_cry_count.svg
  SvgGenImage get icCryCount =>
      const SvgGenImage('assets/images/svg/ic_cry_count.svg');

  /// File path: assets/images/svg/ic_cry_duration.svg
  SvgGenImage get icCryDuration =>
      const SvgGenImage('assets/images/svg/ic_cry_duration.svg');

  /// File path: assets/images/svg/ic_cummulative.svg
  SvgGenImage get icCummulative =>
      const SvgGenImage('assets/images/svg/ic_cummulative.svg');

  /// File path: assets/images/svg/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/images/svg/notification.svg');

  /// File path: assets/images/svg/star.svg
  SvgGenImage get star => const SvgGenImage('assets/images/svg/star.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appIcon,
        ellipse,
        icCryCount,
        icCryDuration,
        icCummulative,
        notification,
        star
      ];
}

class UbenwaAssets {
  UbenwaAssets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
