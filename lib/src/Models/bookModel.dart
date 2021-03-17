import 'dart:convert';

List<BooksModel> booksModelFromJson(String str) =>
    List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

String booksModelToJson(List<BooksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BooksModel {
  BooksModel({
    this.urlImage,
    this.stars,
    this.bookTitle,
    this.writerName,
    this.bookDescription,
    this.isFavorite,
  });

  String urlImage;
  int stars;
  String bookTitle;
  String writerName;
  String bookDescription;
  bool isFavorite;

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        urlImage: json["UrlImage"],
        stars: json["Stars"],
        bookTitle: json["BookTitle"],
        writerName: json["WriterName"],
        bookDescription: json["BookDescription"],
        isFavorite: json["IsFavorite"],
      );

  Map<String, dynamic> toJson() => {
        "UrlImage": urlImage,
        "Stars": stars,
        "BookTitle": bookTitle,
        "WriterName": writerName,
        "BookDescription": bookDescription,
        "IsFavorite": isFavorite,
      };
}
