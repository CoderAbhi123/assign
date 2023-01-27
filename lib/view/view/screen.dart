import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

Color clr1 = const Color.fromARGB(255, 83, 132, 128);
Color clr2 = Colors.white;
Color clr3 = Colors.white;
Color clr4 = Colors.white;
Color clrTxt1=Colors.white;
Color clrTxt2=Colors.grey;
Color clrTxt3=Colors.grey;
Color clrTxt4=Colors.grey;
const trending = '          Top Spending                                 ';

class screen_view extends StatefulWidget {
  const screen_view({Key? key}) : super(key: key);

  @override
  State<screen_view> createState() => _screen_viewState();
}

class _screen_viewState extends State<screen_view> {
  late List<MonthSales> _chartData;
  late List<DropdownMenuItem> _menuItems;

  @override
  void initState() {
    _menuItems = [
      const DropdownMenuItem(
        value: 'expenses',
        child: Text('Expenses'),
      ),
      const DropdownMenuItem(
        value: 'savings',
        child: Text('Savings'),
      ),
    ];
    _chartData = getCharData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.install_desktop_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            height: 57,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: clr1,
                    ),
                    onPressed: () {
                      clr2 = Colors.white;
                      clr3 = Colors.white;
                      clr4 = Colors.white;
                      clrTxt2=Colors.grey;
                      clrTxt3=Colors.grey;
                      clrTxt4=Colors.grey;
                      setState(() {
                        if (clr1 == Colors.white) {
                          clr1 = const Color.fromARGB(255, 83, 132, 128);
                          clrTxt1=Colors.white;
                        }
                      });
                    },
                    child:  Text(
                      'Day',
                      style: TextStyle(color: clrTxt1, fontSize: 15),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: clr2,
                    ),
                    onPressed: () {
                      clr1 = Colors.white;
                      clr3 = Colors.white;
                      clr4 = Colors.white;
                      clrTxt1=Colors.grey;
                      clrTxt3=Colors.grey;
                      clrTxt4=Colors.grey;
                      setState(() {
                        if (clr2 == Colors.white) {
                          clr2 = const Color.fromARGB(255, 83, 132, 128);
                          clrTxt2=Colors.white;
                        }
                      });
                    },
                    child:  Text(
                      'Week',
                      style: TextStyle(color: clrTxt2, fontSize: 15),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: clr3,
                    ),
                    onPressed: () {
                      clr1 = Colors.white;
                      clr2 = Colors.white;
                      clr4 = Colors.white;
                      clrTxt1=Colors.grey;
                      clrTxt2=Colors.grey;
                      clrTxt4=Colors.grey;
                      setState(() {
                        if (clr3 == Colors.white) {
                          clr3 = const Color.fromARGB(255, 83, 132, 128);
                          clrTxt3=Colors.white;
                        }
                      });
                    },
                    child:  Text(
                      'Month',
                      style: TextStyle(color: clrTxt3, fontSize: 15),
                    )),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: clr4,
                  ),
                  onPressed: () {
                    clr1 = Colors.white;
                    clr2 = Colors.white;
                    clr3 = Colors.white;
                    clrTxt1=Colors.grey;
                    clrTxt2=Colors.grey;
                    clrTxt3=Colors.grey;
                    setState(() {
                      if (clr4 == Colors.white) {
                        clr4 = const Color.fromARGB(255, 83, 132, 128);
                        clrTxt4=Colors.white;
                      }
                    });
                  },
                  child:  Text(
                    'Year',
                    style: TextStyle(color: clrTxt4, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton(
                  underline: null,
                  elevation: 0,
                  isExpanded: false,
                  items: _menuItems,
                  onChanged: (value) {},
                  value: 'expenses',
                ),
              ),
            ],
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(
              minorGridLines: const MinorGridLines(width: 0),
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(
                maximum: 2400,
                minimum: 0,
                isVisible: false,
                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<MonthSales, String>>[
              SplineAreaSeries(
                  name: 'Sales',
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 83, 132, 128),
                    const Color.fromARGB(255, 83, 132, 128).withAlpha(0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  dataSource: _chartData,
                  xValueMapper: (MonthSales sale, _) => sale.month,
                  yValueMapper: (MonthSales sale, _) => sale.sales),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  trending,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Icon(Icons.arrow_downward),
              Icon(Icons.arrow_upward)
            ],
          ),
          SizedBox(
            height: 220,
            width: 100,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('StarBucks'),
                    subtitle: Text('Jan 12,2022'),
                    trailing: Text(
                      '-\$150.00',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    leading: Icon(Icons.account_circle_outlined),
                  ),
                  Card(color: Color.fromARGB(255, 83, 132, 128),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    elevation: 10,
                    child: ListTile(
                      title: Text('Transfer'),
                      subtitle: Text('Yesterday'),
                      leading: Icon(Icons.account_circle_outlined),
                      trailing: Text('-\$85.00'),
                      selected: true,
                      selectedColor: Colors.white,
                    ),
                  ),
                  ListTile(
                    title: Text('Youtube'),
                    subtitle: Text('Jan 16,2022'),
                    trailing: Text(
                      '-\$11.99',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    leading: Icon(Icons.account_circle_outlined),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        child: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 83, 132, 128),
          unselectedItemColor: Colors.grey,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }

  List<MonthSales> getCharData() {
    final List<MonthSales> charData = [
      MonthSales('Mar', 900),
      MonthSales('Apr', 700),
      MonthSales('May', 1230),
      MonthSales('Jun', 1600),
      MonthSales('Jul', 1400),
      MonthSales('Aug', 800),
      MonthSales('Sep', 1300)
    ];
    return charData;
  }
}

class MonthSales {
  final String month;
  final double sales;

  MonthSales(this.month, this.sales);
}
