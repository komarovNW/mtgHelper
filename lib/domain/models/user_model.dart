import 'package:mtg_helper/data/entities/user/user_entity.dart';

class UserModel {
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      fullName: entity.displayName ?? 'Гость',
      photoUrl: entity.photoUrl,
      isAnonymous: entity.isAnonymous,
    );
  }

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.photoUrl,
    required this.isAnonymous,
  });
  final String id;
  final String email;
  final String fullName;
  final String? photoUrl;
  final bool isAnonymous;

  bool isUserAnonymous() {
    return isAnonymous;
  }

  String getFormattedEmail() {
    return email.toLowerCase();
  }

  String getInitials() {
    if (fullName.isEmpty) {
      return '';
    }

    final List<String> nameParts = fullName.split(' ');

    String initials = '';
    if (nameParts.isNotEmpty) {
      initials += nameParts[0][0];
    }
    if (nameParts.length > 1) {
      initials += nameParts[1][0];
    }
    return initials.toUpperCase();
  }
}
