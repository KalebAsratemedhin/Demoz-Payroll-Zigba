import 'package:dartz/dartz.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<String, User>> signUp(String email, String password);
  Future<Either<String, User>> signIn(String email, String password);
  Future<Either<String, void>> signOut();
  Future<Either<String, User?>> getCurrentUser();
}
