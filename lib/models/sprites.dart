import 'package:json_annotation/json_annotation.dart';

part 'sprites.g.dart';

@JsonSerializable(explicitToJson: true)
class Sprites {
  const Sprites(
    this.frontDefault,
    this.backDefault,
  );

  @JsonKey(name: 'front_default')
  final String frontDefault;

  @JsonKey(name: 'back_default')
  final String backDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
