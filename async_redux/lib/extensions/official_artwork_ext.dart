import 'package:pokedex_flutter_async_redux/apis/model/official_artwork.dart';
import 'package:pokedex_flutter_async_redux/model/dto/official_artwork_dto.dart';

extension OfficialArtworkExt on OfficialArtwork {
  OfficialArtworkDto toDto() => OfficialArtworkDto(imageUrl: imageUrl ?? '');
}
