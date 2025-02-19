import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/{{name}}/{{name}}_cubit.dart';
import 'package:mtg_helper/features/{{name}}/{{name}}_page.dart';
// import 'package:mtg_helper/data/datasources/{{name}}/{{name}}_remote_data_source.dart';
// import 'package:mtg_helper/data/repositories/{{name}}/{{name}}_repository_impl.dart';
// import 'package:mtg_helper/domain/repositories/{{name}}/{{name}}_repository.dart';
// import 'package:mtg_helper/domain/use_cases/test_use_case.dart';


class {{name.pascalCase()}}Factory {
{{name.pascalCase()}}Factory();


  // {{name.pascalCase()}}RemoteDataSource create{{name.pascalCase()}}DataSource() {
  //   return {{name.pascalCase()}}RemoteDataSource(firebaseAuth: firebaseAuth);
  // }
  //
  // {{name.pascalCase()}}Repository create{{name.pascalCase()}}Repository() {
  //   return {{name.pascalCase()}}RepositoryImpl(remoteDataSource: create{{name.pascalCase()}}DataSource());
  // }

  // TestUseCase createTestUseCase() {
  //   return SignInUseCase({{name}}Repository: create{{name.pascalCase()}}Repository());
  // }

    {{name.pascalCase()}}Cubit create{{name.pascalCase()}}Cubit() {
    return {{name.pascalCase()}}Cubit(
      // signInUseCase: createSignInUseCase(),
    );
  }

  BlocProvider<{{name.pascalCase()}}Cubit> create{{name.pascalCase()}}BlocProvider() {
    return BlocProvider<{{name.pascalCase()}}Cubit>(
      create: (_) => create{{name.pascalCase()}}Cubit(),
      child: const {{name.pascalCase()}}Page(),
    );
  }
}
