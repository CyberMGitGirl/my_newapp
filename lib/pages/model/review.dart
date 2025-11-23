import 'package:my_newapp/pages/model/user_detail.dart';

class Review {
  final String message;
  final UserDetail user;
  final DateTime date;

  Review({required this.message, required this.user, required this.date});
}