import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String? name;
  final String id;
  final String? photo;

  const User({required this.id, this.email, this.name, this.photo});

  @override
  List<Object?> get props => [email, id, name, photo];
}
