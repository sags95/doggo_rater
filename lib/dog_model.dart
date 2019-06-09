import 'dart:io';
import 'dart:convert';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  //ratings start at 10!
  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    if (imageUrl != null){
      return;
    }

  //http call
  HttpClient http = HttpClient();
  try {
    //Dart uri builder
    var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
    var request =  await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    imageUrl = json.decode(responseBody)['message'];
  } catch (e) {
    print(e);
    }
  }

}