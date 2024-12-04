import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/company.dart';
import '../../domain/repositories/company_repository.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object?> get props => [];
}

class CreateCompanyEvent extends CompanyEvent {
  final String name;
  final String ownerId;

  const CreateCompanyEvent({
    required this.name,
    required this.ownerId,
  });

  @override
  List<Object?> get props => [name, ownerId];
}

class UpdateCompanyEvent extends CompanyEvent {
  final Company company;

  const UpdateCompanyEvent(this.company);

  @override
  List<Object?> get props => [company];
}

class GetCompanyByOwnerEvent extends CompanyEvent {
  final String ownerId;

  const GetCompanyByOwnerEvent(this.ownerId);

  @override
  List<Object?> get props => [ownerId];
}

class DeleteCompanyEvent extends CompanyEvent {
  final String companyId;

  const DeleteCompanyEvent(this.companyId);

  @override
  List<Object?> get props => [companyId];
}

// States
abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object?> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final Company company;

  const CompanyLoaded(this.company);

  @override
  List<Object?> get props => [company];
}

class CompanyError extends CompanyState {
  final String message;

  const CompanyError(this.message);

  @override
  List<Object?> get props => [message];
}

class CompanyDeleted extends CompanyState {}

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository _companyRepository;

  CompanyBloc(this._companyRepository) : super(CompanyInitial()) {
    on<CreateCompanyEvent>(_onCreateCompany);
    on<UpdateCompanyEvent>(_onUpdateCompany);
    on<GetCompanyByOwnerEvent>(_onGetCompanyByOwner);
    on<DeleteCompanyEvent>(_onDeleteCompany);
  }

  Future<void> _onCreateCompany(
    CreateCompanyEvent event,
    Emitter<CompanyState> emit,
  ) async {
    emit(CompanyLoading());
    final result = await _companyRepository.createCompany(
      event.name,
      event.ownerId,
    );
    result.fold(
      (error) => emit(CompanyError(error)),
      (company) => emit(CompanyLoaded(company)),
    );
  }

  Future<void> _onUpdateCompany(
    UpdateCompanyEvent event,
    Emitter<CompanyState> emit,
  ) async {
    emit(CompanyLoading());
    final result = await _companyRepository.updateCompany(event.company);
    result.fold(
      (error) => emit(CompanyError(error)),
      (company) => emit(CompanyLoaded(company)),
    );
  }

  Future<void> _onGetCompanyByOwner(
    GetCompanyByOwnerEvent event,
    Emitter<CompanyState> emit,
  ) async {
    emit(CompanyLoading());
    final result = await _companyRepository.getCompanyByOwnerId(event.ownerId);
    result.fold(
      (error) => emit(CompanyError(error)),
      (company) => emit(
        company != null ? CompanyLoaded(company) : CompanyInitial(),
      ),
    );
  }

  Future<void> _onDeleteCompany(
    DeleteCompanyEvent event,
    Emitter<CompanyState> emit,
  ) async {
    emit(CompanyLoading());
    final result = await _companyRepository.deleteCompany(event.companyId);
    result.fold(
      (error) => emit(CompanyError(error)),
      (_) => emit(CompanyDeleted()),
    );
  }
}
