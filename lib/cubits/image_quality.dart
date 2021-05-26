import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ImageQuality { low, medium, high }

class ImageQualityCubit extends HydratedCubit<ImageQuality> {
  static const defaultQuality = ImageQuality.low;

  ImageQualityCubit() : super(defaultQuality);

  @override
  ImageQuality fromJson(Map<String, dynamic> json) {
    return ImageQuality.values[json['value']];
  }

  @override
  Map<String, dynamic> toJson(ImageQuality state) {
    return {'value': state.index};
  }

  ImageQuality get imageQuality => state;

  set imageQuality(ImageQuality imageQuality) => emit(imageQuality);
}
