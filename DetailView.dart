import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/DetailController.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailController>();

    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           HeaderWidget(), //Header 로고 
           ProfileWidget(), //Profile 로고
            ElevatedButton(
              onPressed: () {
                Get.find<DetailController>().goToMain();
              },
           //   child: TextList(),
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




//로고 Rehabbit
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailpage'),
      ),
      body: Container(
        child: Image.asset('assets/images/logo-images.png'),
      ),
    );
  }
}




//Profile png
class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: Image.asset('assets/images/profile-images.png'),
      ),
    );
  }
}

//TextList
class TextList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
      children: <Widget>[
        Text(
          'Detail',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          '>절약금액',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          '약 500,000원',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          '추산치',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

