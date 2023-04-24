import 'package:flutter/material.dart';
import 'package:farmmobile/app/core/values/colors.dart';
import 'package:farmmobile/app/core/values/icons.dart';

List<Icon> getIcons() {
  return const [
    // Icon(Icons.home),
    // Icon(Icons.local_pizza),
    // Icon(Icons.logo_dev),
    // Icon(Icons.looks)        
    Icon(IconData(personIcon, fontFamily: 'MaterialIcons'), color: purple),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons'), color: pink),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcons'), color: green),
    Icon(IconData(sportIcon, fontFamily: 'MaterialIcons'), color: yellow),
    Icon(IconData(laptopIcon, fontFamily: 'MaterialIcons'), color: charcoal),
    Icon(IconData(travelIcon, fontFamily: 'MaterialIcons'), color: deepPink),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcons'), color: blue),
    Icon(IconData(bookIcon, fontFamily: 'MaterialIcons'), color: bookColor),
    Icon(IconData(editNoteIcon, fontFamily: 'MaterialIcons'),
        color: editNoteColor),
    Icon(IconData(gamepadIcon, fontFamily: 'MaterialIcons'),
        color: gamePadColor),
  ];
}
