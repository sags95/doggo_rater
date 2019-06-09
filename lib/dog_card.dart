import 'package:flutter/material.dart';
import 'dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard>{
  Dog dog;
  String renderUrl;

  void initState(){
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async{
    await dog.getImageUrl();

     if (mounted){
    setState(() {
      renderUrl = dog.imageUrl;
      });
    }
  }

 
  _DogCardState(this.dog);

  Widget get dogImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Text(widget.dog.name);
  }
}

