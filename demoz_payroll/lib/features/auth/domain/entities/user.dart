import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? companyId;

  const User({
    required this.id,
    required this.email,
    this.name,
    this.companyId,
  });

  User copyWith({
    String? name,
    String? companyId,
  }) {
    return User(
      id: id,
      email: email,
      name: name ?? this.name,
      companyId: companyId ?? this.companyId,
    );
  }

  @override
  List<Object?> get props => [id, email, name, companyId];
}
