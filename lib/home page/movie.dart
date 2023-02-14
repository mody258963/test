import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

import 'inkwall.dart';
import 'home.dart';

@JsonSerializable()
class Movie {
  Movie({
    this.detals,
    required this.likes,
    required this.image,
    required this.expectedrent,
    required this.expectedprice,
    required this.location,
    required this.id,
  });

  @Id()
  final String id;
  final String image;
  @Min(0)
  final int likes;
  final String location;
  @Min(0)
  final String expectedprice;
  final String expectedrent;
  final List<String>? detals;
}
