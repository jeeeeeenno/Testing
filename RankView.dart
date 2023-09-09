
import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RankController.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';
// import 'package:sorted_list/sorted_list.dart';
import 'package:categorized_dropdown/categorized_dropdown.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


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
            const SizedBox(
              height : 80,),

            //로고
             HeaderWidget(), 

            //카테고리 (sorted list)
            RankCategory(),

            
           //랭킹 그래프 (가로)
            RankGraph(),
            ElevatedButton(
              onPressed: () {
                Get.find<RankController>().goToMain();
              },
              child: Text('goToMain'),
              
            ),
            
            // ElevatedButton(
            //   onPressed: () {
            //     controller.work("test성공");
            //   },
            //   child: Obx(
            //     () => Text('${controller.mainDB.value.detailTest}'),
            //   ),
            // ),
           
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
        Image.asset('assets/images/logo-image.png'),
      ],
    );
  }
}

//상단바 ranking category
class RankCategory extends StatefulWidget {
  const RankCategory({Key? key}) : super(key: key);

  @override
  _RankCategoryState createState() => _RankCategoryState();
}

class _RankCategoryState extends State<RankCategory> {
  final List<CategorizedDropdownItem<String>>? items = [
    CategorizedDropdownItem(text: 'Ranking', subItems: [
      SubCategorizedDropdownItem(text: '전체', value: '전체'),
      SubCategorizedDropdownItem(text: '커피', value: '커피'),
      SubCategorizedDropdownItem(text: '20대', value: '20대'),
      SubCategorizedDropdownItem(text: '여성', value: '여성'),
    
    ]),
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categorised Dropdown Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('나의 토끼 순위 보기')),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            CategorizedDropdown(
              items: items,
              value: value,
              hint: const Text('분류 별 랭킹'),
              onChanged: (v) {
                setState(() {
                  value = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


//랭킹 그래프

class RankGraph extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RankGraph({Key? key}) : super(key: key);

  @override
  RankGraphState createState() => RankGraphState();
}

class RankGraphState extends State<RankGraph> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('~5%', 30),
      _ChartData('~10%', 15),
      _ChartData('~20%', 12),
      _ChartData('~40%', 6.4)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              BarSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Gold',
                  color: Color.fromRGBO(8, 142, 255, 1))
            ]));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}