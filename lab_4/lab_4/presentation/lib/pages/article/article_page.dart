import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_4/pages/article/article_controller.dart';
import 'package:lab_4/pages/home/home_page.dart';
import 'package:lab_4/resources/custom_collors.dart';
import 'package:lab_4/resources/svg_assets.dart';
import 'package:lab_4/resources/text_styles.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _MyArticlePageState();
}

class _MyArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<ArticleController>()) {
      Get.lazyPut(() => ArticleController());
    }
    ArticleController controller = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    ArticleController controller = Get.find();
    return Material(
      color: Colors.white,
      child: ListView(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: TextButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    child: SvgAssets.backSvg,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                  image: NetworkImage(
                      "https://media.cnn.com/api/v1/images/stellar/prod/221016100840-02-joe-biden-1011.jpg?c=16x9&q=h_720,w_1280,c_fill"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16, left: 17, right: 15),
              child: Text(
                  "Biden will wait for Congress to return before taking any major steps on US-Saudi relationship, national security adviser says",
                  style: TextStyles.textStyleSourceSansPro20(
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              margin: EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: CustomColors.bittersweet,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    margin: EdgeInsets.only(left: 17, right: 18.67),
                    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Text("category",
                        style: TextStyles.textStyleSourceSansPro10(
                            color: CustomColors.bittersweet,
                            fontWeight: FontWeight.w600)),
                  ),
                  SvgAssets.eyeSvg,
                  Container(
                    margin: EdgeInsets.only(right: 18.67),
                    child: Text("100"),
                  ),
                  SvgAssets.likeSvg,
                  Container(
                    margin: EdgeInsets.only(right: 18.67),
                    child: Text("100"),
                  ),
                  SvgAssets.commentSvg,
                  Container(
                    child: Text("200"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 17, right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image(
                        height: 32,
                        width: 32,
                        image: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/en/thumb/f/ff/BBC_News.svg/1200px-BBC_News.svg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("bbc",
                              style: TextStyles.textStyleSourceSansPro14(
                                  fontWeight: FontWeight.w600)),
                        ),
                        Spacer(),
                        Container(
                          child: Text("8 days ago",
                              style: TextStyles.textStyleSourceSansPro8(
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 32,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            CustomColors.bittersweet),
                      ),
                      onPressed: () {
                        print("null function");
                      },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children: [
                              Container(
                                width: 8,
                              ),
                              SvgAssets.plusSvg,
                              Container(
                                width: 8,
                              ),
                              Text("Follow",
                                    style: TextStyles.textStyleSourceSansPro14(
                                      color: Colors.white,
                                    )),
                              Container(
                                width: 8,
                              ),
                            ],)
                          ],
                        ),
                    ),
                  ),
                  Container(
                    width: 15,
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 16,left: 17, right: 15),
              child: Text(
                  "Biden will wait for Congress to return before taking any major steps on US-Saudi relationship, national security adviser says\r\nBiden will wait for Congress to return before taking any major steps on US-Saudi relationship, national security adviser says",
                  style: TextStyles.textStyleSourceSansPro12(
                      fontWeight: FontWeight.w400)),
            ),

          ],
        ),
    );
  }
}
