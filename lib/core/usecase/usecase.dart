import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:returants_app/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
class NoParmas extends Equatable{
  @override
  List<Object?> get props => [];

}