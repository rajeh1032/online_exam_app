import '../../domain/entities/metadata_entity.dart';
import '../models/metadata_dto.dart';

extension MetadataDtoMapper on MetadataDto {
  MetadataEntity toEntity() {
    return MetadataEntity(
      currentPage: currentPage ?? 1,
      numberOfPages: numberOfPages ?? 1,
      limit: limit ?? 10,
    );
  }
}