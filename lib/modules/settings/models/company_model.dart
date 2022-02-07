import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class Campany {
  final String name;

  Campany({
    required this.name,
  });

  factory Campany.fromJson(Map<String, dynamic> json) =>
      _$CampanyFromJson(json);

  Map<String, dynamic> toJson() => _$CampanyToJson(this);
}
