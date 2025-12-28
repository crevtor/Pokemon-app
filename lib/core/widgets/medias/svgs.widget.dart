part of 'medias.export.dart';

class NetworkSvgStrategy implements MediaStrategy {
  const NetworkSvgStrategy(this.url, {this.color});

  final String url;
  final Color? color;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain, Widget? fallback,
    double? width, double? height,
    bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return SvgPicture.network(
      url,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return fallback ?? const SizedBox.shrink();
      },
    );
  }
}

class FileSvgStrategy implements MediaStrategy {
  const FileSvgStrategy(this.file, {this.color});

  final File file;
  final Color? color;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain, Widget? fallback,
    double? width, double? height,
    bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return SvgPicture.file(file,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return fallback ?? const SizedBox.shrink();
      },
    );
  }
}

class MemorySvgStrategy implements MediaStrategy {
  const MemorySvgStrategy(this.uInt8list, {this.color});

  final Uint8List uInt8list;
  final Color? color;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain, Widget? fallback,
    double? width, double? height,
    bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return SvgPicture.memory(uInt8list,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return fallback ?? const SizedBox.shrink();
      },
    );
  }
}

class FadeFileSvgStrategy implements MediaStrategy {
  const FadeFileSvgStrategy(this.file, {this.color});

  final File file;
  final Color? color;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain, Widget? fallback,
    double? width, double? height,
    bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return FadeIn(
      preferences: const AnimationPreferences(
          offset: zeroDuration,
          duration: fastDuration,
      ),
      child: SvgPicture.file(file,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return fallback ?? const SizedBox.shrink();
        },
      ),
    );
  }
}

class FadeAssetSvgStrategy implements MediaStrategy {
  const FadeAssetSvgStrategy(this.asset, {
    this.package,
    this.animationMagnitude,
    this.animationDuration,
    this.animationOffset,
    this.color,
  });

  final String asset;
  final String? package;
  final Color? color;
  final double? animationMagnitude;
  final int? animationDuration;
  final int? animationOffset;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain, Widget? fallback,
    double? width, double? height,
    bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return FadeInUpUi(
      animationOffset: animationOffset ?? 0,
      animationMagnitude: animationMagnitude ?? 0.1,
      animationDuration: animationDuration ?? 500,
      child: SvgPicture.asset(asset,
        color: color,
        fit: fit,
        height: height,
        width: width,
        package: package,
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return fallback ?? const SizedBox.shrink();
        },
      ),
    );
  }
}

class AssetSvgStrategy implements MediaStrategy {
  const AssetSvgStrategy(this.asset, {
    this.package,
    this.color,
  });

  final String asset;
  final String? package;
  final Color? color;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain, Widget? fallback,
    double? width, double? height,
    bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return SvgPicture.asset(asset,
      height: height,
      fit: fit,
      width: width,
      color: color,
      package: package,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return fallback ?? const SizedBox.shrink();
      },
    );
  }
}
