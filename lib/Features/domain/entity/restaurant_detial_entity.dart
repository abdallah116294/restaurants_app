import 'package:equatable/equatable.dart';
import 'package:returants_app/Features/domain/entity/restaurant_entity.dart';

class RestaurnatDetailEntity extends Equatable {
 final bool error;
 final String message;
final  Restaurant restaurant;
  const RestaurnatDetailEntity({
    required this.error,
    required this.message,
    required this.restaurant,
  });
  @override
  List<Object?> get props => [
    error,
    message,
    restaurant
  ];
}
