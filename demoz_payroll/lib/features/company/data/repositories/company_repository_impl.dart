import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/company.dart';
import '../../domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  static const String _companyBoxName = 'companies';

  Future<Box> _getCompanyBox() async {
    return await Hive.openBox(_companyBoxName);
  }

  @override
  Future<Either<String, Company>> createCompany(
    String name,
    String ownerId,
  ) async {
    try {
      final box = await _getCompanyBox();
      
      final company = Company(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        ownerId: ownerId,
      );

      await box.put(company.id, {
        'id': company.id,
        'name': company.name,
        'ownerId': company.ownerId,
        'address': company.address,
        'phone': company.phone,
        'email': company.email,
        'employeeIds': company.employeeIds,
      });

      return Right(company);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Company>> updateCompany(Company company) async {
    try {
      final box = await _getCompanyBox();
      
      await box.put(company.id, {
        'id': company.id,
        'name': company.name,
        'ownerId': company.ownerId,
        'address': company.address,
        'phone': company.phone,
        'email': company.email,
        'employeeIds': company.employeeIds,
      });

      return Right(company);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Company?>> getCompanyById(String id) async {
    try {
      final box = await _getCompanyBox();
      final companyData = box.get(id);

      if (companyData == null) {
        return const Right(null);
      }

      return Right(Company(
        id: companyData['id'],
        name: companyData['name'],
        ownerId: companyData['ownerId'],
        address: companyData['address'],
        phone: companyData['phone'],
        email: companyData['email'],
        employeeIds: List<String>.from(companyData['employeeIds'] ?? []),
      ));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Company?>> getCompanyByOwnerId(String ownerId) async {
    try {
      final box = await _getCompanyBox();
      final companies = box.values.toList();
      
      final companyData = companies.firstWhere(
        (company) => company['ownerId'] == ownerId,
        orElse: () => null,
      );

      if (companyData == null) {
        return const Right(null);
      }

      return Right(Company(
        id: companyData['id'],
        name: companyData['name'],
        ownerId: companyData['ownerId'],
        address: companyData['address'],
        phone: companyData['phone'],
        email: companyData['email'],
        employeeIds: List<String>.from(companyData['employeeIds'] ?? []),
      ));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Company>>> getAllCompanies() async {
    try {
      final box = await _getCompanyBox();
      final companies = box.values.map((companyData) => Company(
        id: companyData['id'],
        name: companyData['name'],
        ownerId: companyData['ownerId'],
        address: companyData['address'],
        phone: companyData['phone'],
        email: companyData['email'],
        employeeIds: List<String>.from(companyData['employeeIds'] ?? []),
      )).toList();

      return Right(companies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteCompany(String id) async {
    try {
      final box = await _getCompanyBox();
      await box.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
