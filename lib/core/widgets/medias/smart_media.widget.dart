part of 'medias.export.dart';

typedef ErrorWidgetBuilder = Widget Function(BuildContext context, Object error,
    StackTrace? stackTrace);

abstract class MediaStrategy {
  Widget build(BuildContext context, {
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
    Widget? fallback,
    bool showLoader = true,
    ErrorWidgetBuilder? errorBuilder,
  });
}

class SmartMedia extends StatelessWidget {
  final MediaStrategy strategy;
  final BoxFit fit;
  final Widget? fallback;
  final bool showLoader;
  final ErrorWidgetBuilder? errorBuilder;
  final double? width;
  final double? height;

  const SmartMedia.fromStrategy({
    super.key,
    required this.strategy,
    this.fit = BoxFit.contain,
    this.fallback,
    this.showLoader = true,
    this.errorBuilder,
    this.width,
    this.height,
  });

  /// Convenience factory that auto-detects svg vs raster by url extension (simple heuristic)
  factory SmartMedia.fromUrl(
      String url, {
        Key? key,
        BoxFit fit = BoxFit.contain,
        Widget? fallback,
        bool showLoader = true,
        double? width,
        double? height,
        ErrorWidgetBuilder? errorBuilder,
        bool? isSvg, // override detection if needed
        String? package,
        Color? color,
      }) {
    final bool detectedSvg = isSvg ?? _isSvgUrl(url);
    final MediaStrategy strat = detectedSvg ? NetworkSvgStrategy(url, color: color)
        : NetworkImageStrategy(url);
    return SmartMedia.fromStrategy(
      key: key,
      strategy: strat,
      fit: fit,
      fallback: fallback,
      showLoader: showLoader,
      errorBuilder: errorBuilder,
      height: height,
      width: width,
    );
  }

  /// Convenience factories for common sources:
  factory SmartMedia.network(String url, {Key? key, BoxFit fit = BoxFit.contain,
    double? width, double? height,
    Widget? fallback, bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) =>
      SmartMedia.fromUrl(url, key: key, fit: fit, fallback: fallback, showLoader: showLoader, errorBuilder: errorBuilder);

  factory SmartMedia.file(File file, {Key? key, BoxFit fit = BoxFit.cover, Widget? fallback,
    double? width, double? height,
    bool? isSvg,
    Color? color,
    ErrorWidgetBuilder? errorBuilder}) {
    final bool detectedSvg = isSvg ?? _isSvgFile(file);
    final MediaStrategy strat = detectedSvg ? FileSvgStrategy(file, color: color)
        : FileImageStrategy(file);
    return SmartMedia.fromStrategy(
      key: key,
      strategy: strat,
      fit: fit,
      fallback: fallback,
      errorBuilder: errorBuilder,
      height: height,
      width: width,
    );
  }

  factory SmartMedia.fadeFile(File file, {Key? key, BoxFit fit = BoxFit.cover, Widget? fallback,
    double? width, double? height,
    bool? isSvg,
    Color? color,
    ErrorWidgetBuilder? errorBuilder}) {
    final bool detectedSvg = isSvg ?? _isSvgFile(file);
    final MediaStrategy strat = detectedSvg ? FadeFileSvgStrategy(file, color: color)
        : FadeFileImageStrategy(file);
    return SmartMedia.fromStrategy(
      key: key,
      strategy: strat,
      fit: fit,
      fallback: fallback,
      errorBuilder: errorBuilder,
      height: height,
      width: width,
    );
  }

  factory SmartMedia.memory(Uint8List bytes, {Key? key, BoxFit fit = BoxFit.cover,
    double? width, double? height,
    Color? color,
    Widget? fallback, bool? isSvg, ErrorWidgetBuilder? errorBuilder}) {
    final bool detectedSvg = isSvg ?? _isSvgBytes(bytes);
    final MediaStrategy strat = detectedSvg ? MemorySvgStrategy(bytes, color: color)
        : MemoryImageStrategy(bytes);
    return SmartMedia.fromStrategy(
      key: key,
      strategy: strat,
      fit: fit,
      fallback: fallback,
      errorBuilder: errorBuilder,
      height: height,
      width: width,
    );
  }

  factory SmartMedia.assetImage(String asset, {Key? key, BoxFit fit = BoxFit.contain,
    double? width, double? height,
    String? package, Widget? fallback}) =>
      SmartMedia.fromStrategy(key: key, strategy: AssetImageStrategy(asset),
          fit: fit, fallback: fallback, height: height,
        width: width);

  factory SmartMedia.assetSvg(String asset, {Key? key, BoxFit fit = BoxFit.contain,
    double? width, double? height,
    Color? color,
    String? package, Widget? fallback}) =>
      SmartMedia.fromStrategy(key: key, strategy:
      AssetSvgStrategy(asset, package: package, color: color),
          height: height,
          width: width,
          fit: fit, fallback: fallback);

  factory SmartMedia.fadeAssetSvg(String asset, {Key? key, BoxFit? fit,
    double? width, double? height,
    double? animationMagnitude,
    int? animationDuration,
    int? animationOffset,
    Color? color,
    String? package, Widget? fallback}) {
    return SmartMedia.fromStrategy(key: key, strategy: FadeAssetSvgStrategy(
        animationDuration: animationDuration,
        animationMagnitude: animationMagnitude,
        animationOffset: animationOffset,
        color: color,
        asset,
        package: package
    ),
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain, fallback: fallback);
  }

  factory SmartMedia.fadeAssetImage(String asset, {Key? key, BoxFit fit = BoxFit.contain,
    double? width, double? height,
    double? animationMagnitude,
    final int? animationDuration,
    final int? animationOffset,
    String? package, Widget? fallback}) =>
      SmartMedia.fromStrategy(key: key, strategy: FadeAssetImageStrategy(
          animationDuration: animationDuration,
          animationMagnitude: animationMagnitude,
          animationOffset: animationOffset,
          asset),
          height: height,
          width: width,
          fit: fit, fallback: fallback);

  static bool _isSvgUrl(String url) {
    final cleaned = url.split('?').first.toLowerCase();
    return cleaned.endsWith('.svg');
  }

  static bool _isSvgFile(File file) {
    final cleaned = file.path.split('?').first.toLowerCase();
    return cleaned.endsWith('.svg');
  }

  static bool _isSvgBytes(Uint8List bytes) {
    final cleaned = String.fromCharCodes(bytes).toLowerCase();
    return cleaned.endsWith('.svg');
  }

  @override
  Widget build(BuildContext context) {
    return strategy.build(
      context,
      fit: fit,
      fallback: fallback,
      showLoader: showLoader,
      errorBuilder: errorBuilder,
      height: height,
      width: width
    );
  }
}