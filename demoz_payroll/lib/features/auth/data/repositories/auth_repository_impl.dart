import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const String _userBoxName = 'users';
  static const String _currentUserKey = 'current_user';

  Future<Box> _getUserBox() async {
    return await Hive.openBox(_userBoxName);
  }

  @override
  Future<Either<String, User>> signUp(String email, String password) async {
    try {
      final box = await _getUserBox();
      
      
      final existingUser = box.values.cast<Map>().firstWhere(
            (user) => user['email'] == email,
            orElse: () => <String, dynamic>{},
          );

      if (existingUser.isNotEmpty) {
        return const Left('User already exists');
      }

      
      final newUser = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'email': email,
        'password': password, 
      };

      await box.put(newUser['id'], newUser);

      final user = User(
        id: newUser['id']!,
        email: newUser['email']!,
      );

      await box.put(_currentUserKey, newUser['id']);

      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> signIn(String email, String password) async {
    try {
      final box = await _getUserBox();
      
      final userData = box.values.cast<Map>().firstWhere(
            (user) => user['email'] == email && user['password'] == password,
            orElse: () => <String, dynamic>{},
          );

      if (userData.isEmpty) {
        return const Left('Invalid email or password');
      }

      final user = User(
        id: userData['id']!,
        email: userData['email']!,
      );

      await box.put(_currentUserKey, userData['id']);

      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> signOut() async {
    try {
      final box = await _getUserBox();
      await box.delete(_currentUserKey);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User?>> getCurrentUser() async {
    try {
      final box = await _getUserBox();
      final currentUserId = box.get(_currentUserKey);

      if (currentUserId == null) {
        return const Right(null);
      }

      final userData = box.get(currentUserId) as Map?;
      
      if (userData == null) {
        return const Right(null);
      }

      return Right(User(
        id: userData['id']!,
        email: userData['email']!,
      ));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
