import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagePrecache {
  ImagePrecache._();

  static Future<void> startPrecache(final BuildContext context) async {
    final List<String> assetList = await _getAssetList(context);
    final List<String> imageList = _filterImage(assetList);
    for (final String imagePath in imageList) {
      if (context.mounted) {
        await _precacheAssetImage(imagePath, context);
      }
    }
  }

  static Future<List<String>> _getAssetList(final BuildContext context) async {
    final String manifest =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, void> manifestMap = json.decode(manifest);
    return manifestMap.keys.toList();
  }

  static List<String> _filterImage(final List<String> assetList) {
    final List<String> extensionList = <String>['png', 'jpg', 'svg', 'jpeg'];
    bool isContainList(final String e) =>
        extensionList.contains(e.split('.').last);
    return assetList.where(isContainList).toList();
  }

  static Future<void> _precacheAssetImage(
    final String path,
    final BuildContext context,
  ) async {
    final bool isSvg = path.contains('.svg');
    if (isSvg) {
      await _precacheSvg(path, context);
    } else {
      await _precacheImageWithoutSvg(path, context);
    }
  }

  static Future<void> _precacheSvg(
    final String path,
    final BuildContext context,
  ) async {
    final SvgAssetLoader loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }

  static Future<void> _precacheImageWithoutSvg(
    final String path,
    final BuildContext context,
  ) async {
    await precacheImage(
      AssetImage(path),
      context,
    );
  }
}
