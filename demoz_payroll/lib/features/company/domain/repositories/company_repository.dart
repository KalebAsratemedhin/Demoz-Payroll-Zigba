import 'package:dartz/dartz.dart';
import '../entities/company.dart';

abstract class CompanyRepository {
  Future<Either<String, Company>> createCompany(String name, String ownerId);
  Future<Either<String, Company>> updateCompany(Company company);
  Future<Either<String, Company?>> getCompanyById(String id);
  Future<Either<String, Company?>> getCompanyByOwnerId(String ownerId);
  Future<Either<String, List<Company>>> getAllCompanies();
  Future<Either<String, void>> deleteCompany(String id);
}
