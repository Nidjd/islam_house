import 'package:equatable/equatable.dart';

class SiteContent extends Equatable {
  final String? blockName;
  final String? type;
  final int? itemsCount;
  final String? apiUrl;

  const SiteContent({
    this.blockName,
    this.type,
    this.itemsCount,
    this.apiUrl,
  });

  factory SiteContent.fromJson(Map<String, dynamic> json) => SiteContent(
        blockName: json['block_name'] as String?,
        type: json['type'] as String?,
        itemsCount: json['items_count'] as int?,
        apiUrl: json['api_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'block_name': blockName,
        'type': type,
        'items_count': itemsCount,
        'api_url': apiUrl,
      };

  @override
  List<Object?> get props => [blockName, type, itemsCount, apiUrl];
}
