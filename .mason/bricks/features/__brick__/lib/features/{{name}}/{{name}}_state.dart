import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name}}_state.freezed.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State.initial() = {{name.pascalCase()}}Initial;
  const factory {{name.pascalCase()}}State.loading() = {{name.pascalCase()}}Loading;
  const factory {{name.pascalCase()}}State.success() = {{name.pascalCase()}}Success;
  const factory {{name.pascalCase()}}State.failure(String error) = {{name.pascalCase()}}Failure;
}
