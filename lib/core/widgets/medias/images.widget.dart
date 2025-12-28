part of 'medias.export.dart';

class NetworkImageStrategy implements MediaStrategy  {
  const NetworkImageStrategy(this.url);

  final String url;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain,
    double? width, double? height,
    Widget? fallback, bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        url,
        fit: fit,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          final totalBytes = loadingProgress?.expectedTotalBytes;
          final bytesLoaded =
              loadingProgress?.cumulativeBytesLoaded;
          if (totalBytes != null && bytesLoaded != null) {
            if(showLoader) {
              return CircularProgressIndicator(
                backgroundColor: Colors.white,
                value: bytesLoaded / totalBytes,
                color: Colors.red.withOpacity(0.5),
                strokeWidth: 5.0,
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return child;
          }
        },
        frameBuilder: (BuildContext context, Widget child,
            int? frame, bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: child,
          );
        },
        errorBuilder: (ctx, err, st) {
          if (errorBuilder != null) return errorBuilder(ctx, err, st);
          return fallback ?? const SizedBox.shrink();
        },
      ),
    );
  }
}

class FileImageStrategy implements MediaStrategy {
  const FileImageStrategy(this.file);

  final File file;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.cover, Widget? fallback,
    double? width, double? height,
    bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return Image.file(file, fit: fit, width: double.infinity,
        errorBuilder: (ctx, err, st) {
      return fallback ?? const SizedBox.shrink();
    }
    );
  }
}

class MemoryImageStrategy implements MediaStrategy {
  const MemoryImageStrategy(this.uInt8list);

  final Uint8List uInt8list;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.cover,
    double? width, double? height,
    Widget? fallback, bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return Image.memory(uInt8list,
      fit: fit,
      width: double.infinity,
        errorBuilder: (ctx, err, st) {
          return fallback ?? const SizedBox.shrink();
        }
    );
  }
}

class FadeFileImageStrategy implements MediaStrategy {
  const FadeFileImageStrategy(this.file);

  final File file;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain,
    double? width, double? height,
    Widget? fallback, bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return FadeIn(
      preferences: const AnimationPreferences(
          offset: zeroDuration,
          duration: fastDuration,
      ),
      child: Image.file(file,
        fit: fit,
        width: double.infinity,
          errorBuilder: (ctx, err, st) {
            return fallback ?? const SizedBox.shrink();
          }
      ),
    );
  }
}

class FadeAssetImageStrategy implements MediaStrategy {
  const FadeAssetImageStrategy(this.asset, {
    this.animationMagnitude,
    this.animationDuration,
    this.animationOffset,
  });

  final String asset;
  final double? animationMagnitude;
  final int? animationDuration;
  final int? animationOffset;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain,
    double? width, double? height,
    Widget? fallback, bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return FadeInUpUi(
      animationOffset: animationOffset ?? 0,
      animationMagnitude: animationMagnitude ?? 0.1,
      animationDuration: animationDuration ?? 500,
      child: Image.asset(asset,
        fit: fit,
        height: height,
        errorBuilder: (ctx, err, st) {
            return fallback ?? const SizedBox.shrink();
        }
      ),
    );
  }
}

class AssetImageStrategy implements MediaStrategy {
  const AssetImageStrategy(this.asset);

  final String asset;

  @override
  Widget build(BuildContext context, {BoxFit fit = BoxFit.contain,
    double? width, double? height,
    Widget? fallback, bool showLoader = true, ErrorWidgetBuilder? errorBuilder}) {
    return Image.asset(asset,
      fit: fit,
      height: height,
      width: width,
        errorBuilder: (ctx, err, st) {
          return fallback ?? const SizedBox.shrink();
        }
    );
  }
}

class CachedLocalNetworkImage extends ConsumerWidget {
  const CachedLocalNetworkImage({super.key,
    required this.url, this.fit = BoxFit.cover, this.width, this.height});

  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFileInfo = ref.watch(imageFileStreamProvider(url));
    return asyncFileInfo.when(
      data: (fi) {
        if (fi != null) {
          // cached file ready
          return Image.file(fi.file, fit: fit, width: width, height: height);
        } else {
          // not cached yet (progress or initial)
          return Image.network(
            url,
            fit: fit,
            width: width,
            height: height,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              final total = progress.expectedTotalBytes;
              final loaded = progress.cumulativeBytesLoaded;
              if (total != null && loaded != 0) {
                return SizedBox.shrink();
                // return Center(child: CircularProgressIndicator(value: loaded / total));
              } else {
                return SizedBox.shrink();
              }
            },
            errorBuilder: (context, error, st) => const SizedBox.shrink(),
          );
        }
      },
      loading: () {
        // the stream provider is still creating the subscription; show placeholder / network image
        // return Image.network(url, fit: fit, width: width, height: height);
        return SizedBox.shrink();
      },
      error: (e, st) {
        return const SizedBox.shrink();
      },
    );
  }
}

