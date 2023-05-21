import 'package:booking_ps_figma/data/model/Newes_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.data}) : super(key: key);

  final Article data;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        FancyShimmerImage(
          imageUrl: data.urlToImage ?? "https://qc.yaschools.com/img/anonymous.jpg",
          width: screenSize.width / 3,
          height: 120,
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                data.title ??"",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                data.description??"",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                data.publishedAt??"",
                style: const TextStyle(fontSize: 15, color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
