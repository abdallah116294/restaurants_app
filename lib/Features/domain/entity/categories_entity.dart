import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  String? name;
  CategoriesEntity({required this.name});
  @override
  List<Object?> get props => [
    name
  ];
}
