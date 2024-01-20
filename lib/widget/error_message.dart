import 'package:flutter/cupertino.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key, required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return const Text('oops there was an error, try later');
  }
}
