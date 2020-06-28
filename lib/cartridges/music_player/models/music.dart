import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Music extends Equatable {
  final String name;
  final String path;

  const Music({
    @required this.name,
    @required this.path,
  });

  @override
  List<Object> get props => [name, path];
}
