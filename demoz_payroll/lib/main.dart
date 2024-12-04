import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';
// import 'features/company/data/repositories/company_repository_impl.dart';
// import 'features/company/presentation/bloc/company_bloc.dart';
// import 'features/company/presentation/pages/create_company_page.dart';
// import 'features/company/presentation/pages/management_page.dart';
// import 'features/employee/data/repositories/employee_repository_impl.dart';
// import 'features/employee/presentation/bloc/employee_bloc.dart';
// import 'features/employee/presentation/pages/employee_list_page.dart';
// import 'features/employee/presentation/pages/add_employee_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepositoryImpl>(
          create: (context) => AuthRepositoryImpl(),
        ),
        // RepositoryProvider<CompanyRepositoryImpl>(
        //   create: (context) => CompanyRepositoryImpl(),
        // ),
        // RepositoryProvider<EmployeeRepositoryImpl>(
        //   create: (context) => EmployeeRepositoryImpl(
        //     EmployeeLocalDataSourceImpl(),
        //   ),
        // ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              context.read<AuthRepositoryImpl>(),
            )..add(CheckAuthEvent()),
          ),
          // BlocProvider<CompanyBloc>(
          //   create: (context) => CompanyBloc(
          //     context.read<CompanyRepositoryImpl>(),
          //   ),
          // ),
          // BlocProvider<EmployeeBloc>(
          //   create: (context) => EmployeeBloc(
          //     context.read<EmployeeRepositoryImpl>(),
          //   ),
          // ),
        ],
        child: MaterialApp(
          title: 'Demoz Payroll',
          theme: AppTheme.lightTheme,
          home: const AuthWrapper(),
          routes: {
            '/signup': (context) => const SignUpPage(),
            // '/create_company': (context) => const CreateCompanyPage(),
            // '/add_employee': (context) => const AddEmployeePage(),
          },
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is Authenticated) {
          return const MainPage();
        }

        return const LoginPage();
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    // EmployeeListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Employees',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyBloc, CompanyState>(
      builder: (context, companyState) {
        if (companyState is CompanyLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutEvent());
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    companyState.company.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  if (companyState.company.address != null)
                    Text(companyState.company.address!),
                  if (companyState.company.phone != null)
                    Text(companyState.company.phone!),
                  if (companyState.company.email != null)
                    Text(companyState.company.email!),
                ],
              ),
            ),
          );
        }

        if (companyState is CompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutEvent());
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome to Demoz Payroll'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_company');
                  },
                  child: const Text('Create Company'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutEvent());
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.user.email,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (state.user.name != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      state.user.name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ],
              ),
            ),
          );
        }

        return const Center(
          child: Text('Please sign in to view your profile'),
        );
      },
    );
  }
}
