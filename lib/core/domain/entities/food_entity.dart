// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Food extends Equatable {
  int id;
  String name;
  Food({
    required this.id,
    required this.name,
  });

  factory Food.empty() => Food(
        id: -1,
        name: "",
      );

  Food copyWith({
    int? id,
    String? name,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [id, name];
}
