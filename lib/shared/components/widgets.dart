import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/web_view/web_view.dart';
import 'package:news/shared/components/componentes.dart';

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    itemCount: list.length,
    separatorBuilder: (context, index) => myDivider(),
  ),
  fallback: (context) => isSearch
      ? Container()
      : const Center(child: CircularProgressIndicator(),),
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: () {
    navigateTo(
      context,
      WebViewScreen(article['url']),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: '${article['urlToImage']}',
            fit: BoxFit.fill,
            height: 200,
            width: double.infinity,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(child: CircularProgressIndicator(),),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.grey,
              size: 60,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);