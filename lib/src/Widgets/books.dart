import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paris_app_web/src/Models/bookModel.dart';
import 'package:paris_app_web/src/Utils/book_service.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    var bookService = new BookService();
    return FutureBuilder(
      future: bookService.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        return _createBooks(snapshot.data);
      },
    );
  }

  Widget _createBooks(List<BooksModel> books) {
    var book = books[_index];
    return Column(
      children: [
        _coverBook(book.urlImage),
        _bookDescription(book),
      ],
    );
  }

  Widget _coverBook(String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.all(12.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                if (_index == 0)
                  _index = 3;
                else
                  _index--;
              });
            },
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.5),
          child: Container(
            height: 300,
            child: Image.network(image),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              setState(() {
                if (_index == 3)
                  _index = 0;
                else
                  _index++;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _bookDescription(BooksModel book) {
    return Column(
      children: [
        _start(book.stars),
        _titleAndReview(book),
      ],
    );
  }

  Widget _start(int startCount) {
    var listwidget = new List<Widget>();
    int counter = 0;
    while (counter < 5) {
      if (startCount > counter) {
        listwidget.add(Icon(Icons.star, color: Color(0XFFD4AF37)));
      } else {
        listwidget.add(Icon(Icons.star_border, color: Color(0XFFD4AF37)));
      }
      listwidget.add(
        SizedBox(width: 10),
      );
      counter++;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listwidget,
      ),
    );
  }

  Widget _titleAndReview(BooksModel book) {
    var opColor = Color(0XFF848484);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.0),
          child: Text(
            book.bookTitle,
            style: GoogleFonts.secularOne(
              color: opColor,
              fontSize: 22.0,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          book.writerName,
          style: GoogleFonts.roboto(
            color: opColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text(book.bookDescription,
              style: GoogleFonts.rokkitt(color: opColor),
              textAlign: TextAlign.center),
        ),
        _iconsDetails(book.isFavorite),
      ],
    );
  }

  Widget _iconsDetails(bool isFavorite) {
    IconData iconHeart = (isFavorite) ? Icons.favorite : Icons.favorite_border;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconHeart),
        SizedBox(width: 10),
        Icon(Icons.menu_book_outlined),
        SizedBox(width: 10),
        Icon(Icons.download_outlined),
      ],
    );
  }
}
