import 'package:flutter/material.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> sortByData = [
    'Most recent',
    'Lowest price',
    'Highest price',
    'High rating'
  ];

  List<String> sortByGenderData = ['Man', 'Women', 'Unisex'];

  List<String> colorData = ['Black', 'Red', 'White'];

  List<Color> colorColor = [Colors.black, Colors.red, Colors.white];

  int sortByIndex = 0;

  int sortByGenderIndex = 0;
  SfRangeValues _values = const SfRangeValues(20, 80);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back),
                  customText(text: 'Filter'),
                  const SizedBox()
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            _filterTitle('Brands'),
            Padding(
              padding: const EdgeInsets.only(left: kPadding),
              child: SizedBox(
                height: 90,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return _brandItem(index == 0 ? true : false, 'NIKE');
                    })),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _filterTitle('Price Range'),
            _rangeSlider(),
            const SizedBox(height: 20,),
            _filterTitle('Sort By'),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: kPadding),
                child: ListView.builder(
                    itemCount: sortByData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _selectionItem(
                          sortByData[index], sortByIndex == index);
                    }),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            _filterTitle('Gender'),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: kPadding),
                child: ListView.builder(
                    itemCount: sortByGenderData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _selectionItem(
                          sortByGenderData[index], sortByGenderIndex == index);
                    }),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            _filterTitle('Color'),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: kPadding),
                child: ListView.builder(
                    itemCount: colorData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _colorSelectionItem(
                          colorData[index], index == 0, colorColor[index]);
                    }),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _filterTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding, bottom: 15.0),
      child: customText(text: title, fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  Widget _brandItem(bool isSelected, String brandName) {
    return Padding(
      padding: const EdgeInsets.only(right: kPadding),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: Colors.grey),
                width: 40,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/f/fe/Logo_Adidas.png',
                  ),
                ),
              ),
              isSelected
                  ? const Positioned(
                      bottom: 2,
                      right: 2,
                      child: SizedBox(
                          width: 12,
                          height: 12,
                          child: Icon(Icons.check_circle_rounded)))
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          customText(
              text: brandName, fontSize: 12, fontWeight: FontWeight.bold),
          const SizedBox(
            height: 5,
          ),
          customText(
              text: '1000 Shoes',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey)
        ],
      ),
    );
  }

  Widget _selectionItem(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 0.4, color: Colors.grey),
            color: isSelected ? Colors.black : Colors.white),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: customText(
                text: text,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _rangeSlider() {
    return SfRangeSliderTheme(
            data: SfRangeSliderThemeData(
              thumbColor: Colors.white,
              thumbRadius: 13,
              thumbStrokeWidth: 7,
              thumbStrokeColor: Colors.black,
              activeTrackColor: Colors.black,
              inactiveTrackColor: Colors.grey,
              activeLabelStyle: const TextStyle( fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  inactiveLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
              
            ),
            child: Center(
              child: SfRangeSlider(
                min: 0,
                max: 100,
                interval: 20,
                showLabels: true,
                enableTooltip: true,
                values: _values,
                numberFormat: NumberFormat('\$'),
                inactiveColor: Colors.grey,
                onChanged: (dynamic newValue) {
                  setState(() {
                    _values = newValue;
                  });
                },
              ),
            ),
          );
  }

  Widget _colorSelectionItem(String text, bool isSelected, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              width: isSelected ? 1.5 : 0.4,
              color: isSelected ? Colors.black : Colors.grey),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    border: Border.all(width: 0.4, color: Colors.grey),
                    color: color,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                customText(
                    text: text,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
