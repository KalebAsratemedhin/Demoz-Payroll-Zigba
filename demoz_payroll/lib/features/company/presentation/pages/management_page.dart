import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
// import '../../../employee/presentation/pages/employee_list_page.dart';
import '../bloc/company_bloc.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is Authenticated) {
          return BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, companyState) {
              if (companyState is CompanyLoaded) {
                // return EmployeeListPage(companyId: companyState.company.id);
              }

              if (companyState is CompanyLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (companyState is CompanyError) {
                return Center(child: Text(companyState.message));
              }

              return const Center(
                child: Text('Please create a company first'),
              );
            },
          );
        }

        return const Center(
          child: Text('Please sign in to access this page'),
        );
      },
    );
  }
}
