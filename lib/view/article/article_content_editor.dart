import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tech_blog/view/article/article-list.dart';

import '../../controller/article/manage_article.dart';

class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});
final HtmlEditorController controller=HtmlEditorController();
var manageArticleController=Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: () => controller.clearFocus(),
child: Scaffold(
  
  appBar: appBar('ویرایش مقاله'),
  body: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

HtmlEditor(controller: controller,
htmlEditorOptions: HtmlEditorOptions(
  
  hint: 'میتونی مقاله اینجا بنویسی....',
  shouldEnsureVisible: true,
  initialText: manageArticleController.articleInfoModel.value.content!,




),
callbacks: Callbacks(
  onChangeContent: (p0) {

    manageArticleController.articleInfoModel.update((val) { 

      val!.content=p0;
    });
  } ,
),



)

    ],),
  ),),








    );
  }
}

