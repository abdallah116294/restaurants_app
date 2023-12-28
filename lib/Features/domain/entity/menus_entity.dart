import 'package:equatable/equatable.dart';

class MenusEntity extends Equatable {
final  List<Foods> foods;
final  List<Drinks> drinks;
  const MenusEntity({
    required this.foods,
    required this.drinks,
  });
  @override
  List<Object?> get props => [
        foods,
        drinks,
      ];
}

class Foods extends Equatable {
 final String name;
  const Foods({required this.name});
  @override
  List<Object?> get props => [
    name
  ];
}
class Drinks extends Equatable {
 final String name;
  const Drinks({required this.name});
  @override
  List<Object?> get props => [
    name
  ];
}
