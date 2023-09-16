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
    'Highest review'
  ];

  List<String> sortByGenderData = ['Man', 'Women', 'Unisex'];

  int sortByIndex = 0;
  int brandIndex = 0;
  int sortByGenderIndex = 0;
  int colorIndex = 0;
  SfRangeValues _values = const SfRangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child:
                    customText(text: 'RESET(4)', fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: customText(
                    text: 'APPLY',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  customText(text: 'Filter', fontWeight: FontWeight.bold),
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
                    itemCount: brandsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return _brandItem(
                          index == brandIndex ? true : false,
                          index,
                          brandsList[index].name,
                          brandsList[index].icon);
                    })),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _filterTitle('Price Range'),
            _rangeSlider(),
            const SizedBox(
              height: 20,
            ),
            _filterTitle('Sort By'),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: kPadding),
                child: ListView.builder(
                    itemCount: ProductSortOption.values.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _selectionItem(
                          sortByData[index], sortByIndex == index, () {
                        setState(() {
                          sortByIndex = index;
                        });
                      });
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
                          sortByGenderData[index], sortByGenderIndex == index,
                          () {
                        setState(() {
                          sortByGenderIndex = index;
                        });
                      });
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
                    itemCount: colorsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _colorSelectionItem(colorsList[index].name,
                          index == colorIndex, colorsList[index].color, () {
                        setState(() {
                          colorIndex = index;
                        });
                      });
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

  Widget _brandItem(bool isSelected, int index, String brandName, String icon) {
    return InkWell(
      onTap: () {
        setState(() {
          brandIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: kPadding),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(180),
                      color: Colors.grey.withOpacity(0.2)),
                  width: 40,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      icon,
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
      ),
    );
  }

  Widget _selectionItem(String text, bool isSelected, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
        activeLabelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        inactiveLabelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      child: Center(
        child: SfRangeSlider(
          min: 0,
          max: 2000,
          interval: 500,
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

  Widget _colorSelectionItem(
      String text, bool isSelected, Color color, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
