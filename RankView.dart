
import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RankController.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

/*
class RankView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RankController>();
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      //      const HeaderWidget(),
            ElevatedButton(
              onPressed: () {
                Get.find<RankController>().goToMain();
              },
              child: Text('goToMain'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.work("test성공");
              },
              child: Obx(
                () => Text('${controller.mainDB.value.detailTest}'),
              ),
            ),
          ]),
    ));
  }
}



// 헤더위젯 및 로고 Rehabbit
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rankingpage'),
      ),
      body: Container(
        child: Image.asset('assets/images/logo-images.png'),
      ),
    );
  }
}
*/



class RankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RankController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Rankingpage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             HeaderWidget(), 
            ElevatedButton(
              onPressed: () {
                Get.find<RankController>().goToMain();
              },
              child: Text('goToMain'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.work("test성공");
              },
              child: Obx(
                () => Text('${controller.mainDB.value.detailTest}'),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}



class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo-image-복사본.png'),
      ],
    );
  }
}