import 'dart:io';
import 'package:dio/dio.dart';

/// Função para criar um objeto MultipartFile a partir de um arquivo
Future<MultipartFile> createMultipartFile(File file) async {
  final fileName = file.path.split('/').last;
  return MultipartFile.fromFile(
    file.path,
    filename: fileName,
  );
}
