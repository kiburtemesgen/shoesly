import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/common_button.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/filter_product_request.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/blocs/filter_products_bloc/filter_products_bloc.dart';
import 'package:prior_soft/presentation/blocs/filter_products_bloc/filter_products_event.dart';
import 'package:prior_soft/presentation/blocs/filter_products_bloc/filter_products_state.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_bloc.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_event.dart';
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

  List<String> genderData = ['Male', 'Female', 'Unisex'];

  late int sortByIndex;
  late int brandIndex = -1;
  late int genderIndex = -1;
  late int colorIndex = -1;
  late SfRangeValues _rangeValues = const SfRangeValues(100, 500);
  late SfRangeValues _rangeValuesInitial = const SfRangeValues(100, 500);

  void _initializeFilter() {
    sortByIndex = -1;
    brandIndex = -1;
    genderIndex = -1;
    colorIndex = -1;
    _rangeValues = const SfRangeValues(100, 500);
    _rangeValuesInitial = const SfRangeValues(100, 500);
  }

  @override
  void initState() {
    super.initState();

    _initializeFilter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterProductsBloc, FilterProductsState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonButton(
                      text: 'RESET(${state.filterCount})',
                      onTap: () {
                        setState(() {
                          _initializeFilter(); //Reset UI state
                        });
                        sl<FilterProductsBloc>().add(FilterProductsReset());
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.black),
                  const SizedBox(
                    width: 10,
                  ),
                  commonButton(
                      text: 'APPLY',
                      onTap: () {
                        sl<GetProductsBloc>().add(GetFilteredProducts(
                            filterProductRequest: state.filterProductRequest));
                        Navigator.of(context).pop();
                        sl<FilterProductsBloc>().add(FilterProductsReset());
                      },
                      backgroundColor: Colors.black,
                      textColor: Colors.white),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back)),
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
                            //To check which value(start/end) has been changed
                            setState(() {
                              sortByIndex = index;
                            });
                            sl<FilterProductsBloc>().add(FilterBySortOption(
                                option: ProductSortOption.values[index]));
                            print(
                                'the current state of filter products state: ${state.filterProductRequest.toMap()}');
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
                        itemCount: genderData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _selectionItem(
                              genderData[index], genderIndex == index, () {
                            setState(() {
                              genderIndex = index;
                            });
                            sl<FilterProductsBloc>()
                                .add(FilterByGender(gender: genderData[index]));
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
                            sl<FilterProductsBloc>().add(
                                FilterByColor(color: colorsList[index].name));
                          });
                        }),
                  ),
                ),
              ],
            ),
          )),
        );
      },
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
        sl<FilterProductsBloc>()
            .add(FilterByBrand(brand: brandsList[index].name));
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
          values: _rangeValues,
          numberFormat: NumberFormat('\$'),
          inactiveColor: Colors.grey,
          onChanged: (values) {
            setState(() {
              _rangeValues = values;
            });
          },
          onChangeEnd: (values) {
            if (_rangeValues.start != _rangeValuesInitial.start) {
              // To determine which value is changed
              sl<FilterProductsBloc>()
                  .add(FilterByPriceMin(priceMin: values.start));
            } else {
              sl<FilterProductsBloc>()
                  .add(FilterByPriceMax(priceMax: values.end));
            }
            _rangeValuesInitial = _rangeValues;
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
