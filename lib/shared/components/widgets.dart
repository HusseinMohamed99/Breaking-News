import 'package:breaking_news/shared/components/divider.dart';
import 'package:breaking_news/shared/components/image_shimmer.dart';
import 'package:breaking_news/shared/components/launcher.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget articleBuilder(context, {required dynamic list, isSearch = false}) {
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => BuildArticleItem(article: list[index]),
      itemCount: list.length,
      separatorBuilder: (context, index) => const MyDivider(),
    ),
    fallback: (context) => isSearch
        ? Container()
        : const Center(
            child: CircularProgressIndicator(),
          ),
  );
}

class BuildArticleItem extends StatelessWidget {
  const BuildArticleItem({super.key, this.article});
  final dynamic article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchURL(Uri.parse(article['url'] ?? ''));
      },
      child: Card(
        margin: const EdgeInsets.all(10).r,
        elevation: 5,
        child: Row(
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ).r,
              ),
              child: ImageWithShimmer(
                boxFit: BoxFit.fill,
                imageUrl: '${article['urlToImage']}',
                width: double.infinity,
                height: 200.h,
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: SizedBox(
                height: 80.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
