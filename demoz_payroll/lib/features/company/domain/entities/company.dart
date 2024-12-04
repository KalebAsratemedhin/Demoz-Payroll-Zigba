import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String id;
  final String name;
  final String? address;
  final String? phone;
  final String? email;
  final String ownerId;
  final List<String> employeeIds;

  const Company({
    required this.id,
    required this.name,
    this.address,
    this.phone,
    this.email,
    required this.ownerId,
    this.employeeIds = const [],
  });

  Company copyWith({
    String? name,
    String? address,
    String? phone,
    String? email,
    List<String>? employeeIds,
  }) {
    return Company(
      id: id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      ownerId: ownerId,
      employeeIds: employeeIds ?? this.employeeIds,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phone,
        email,
        ownerId,
        employeeIds,
      ];
}
