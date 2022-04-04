import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridCard extends StatefulWidget {
  final String imageSrc;
  final String title;
  const GridCard({Key? key, required this.imageSrc, required this.title})
      : super(key: key);

  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: GridTile(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SvgPicture.asset(
            widget.imageSrc,
          ),
        ),
        footer: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
