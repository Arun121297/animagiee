import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkProfileSmall extends StatelessWidget {
  final String image;

  const NetworkProfileSmall({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 2.3.hp,
      backgroundColor: animagiee_CL,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => Icon(Icons.camera),
          fit: BoxFit.cover,
          width: 5.0.hp,
          height: 10.2.hp,
        ),
      ),
    );
  }
}
