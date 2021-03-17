import 'package:flutter/services.dart' show rootBundle;
import 'package:paris_app_web/src/Models/bookModel.dart';

class BookService {
  Future<List<BooksModel>> cargarData() async {
    String data = await rootBundle.loadString('Assets/Data/books.json');
    List<BooksModel> listBook = booksModelFromJson(data);
    return listBook;
  }
}
