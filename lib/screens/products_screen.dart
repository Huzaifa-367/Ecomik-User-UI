import 'dart:ui';

import 'package:ecomik/models/fake_data.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/product_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsScreen extends StatefulWidget {
  /// The productCategoryName parameter required data type of String for show
  /// product category name.
  final Object? productCategoryName;
  const ProductsScreen({Key? key, this.productCategoryName}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  /// Current product category name from parameter
  String _currentProductCategoryName = '';

  /// This Global key of scaffold state use for drawer showing
  final GlobalKey<ScaffoldState> _currentProductScaffoldKey =
      GlobalKey<ScaffoldState>();
  /* <-------- Select current category product name initially --------> */
  void _setCurrentProductCategoryName(Object? argument) {
    if (argument != null) {
      if (argument is String) {
        _currentProductCategoryName = argument;
      }
    }
  }

  /// Current filter availability value
  int _currentFilterAvailability = 0;

  /// Current filter interface value
  int _currentFilterInterface = 0;

  /// Current filter brand value
  int _currentFilterBrand = 0;

  RangeValues _rangeValues = const RangeValues(0, 60);

  /// Drawer widget with filter menus
  Widget _drawerWidget(BuildContext widgetContext) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppGaps.screenPaddingValue),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap20,
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Filter',
                    style: Theme.of(widgetContext)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  /* <---- Close button ----> */
                  CustomIconButtonWidget(
                      onTap: () {
                        // Tap here to close the drawer
                        Navigator.pop(widgetContext);
                      },
                      backgroundColor: Colors.white.withOpacity(0.1),
                      child: SvgPicture.asset(
                        AppAssetImages.closeSVGLogoLine,
                        color: Colors.white,
                      )),
                ],
              ),
              AppGaps.hGap20,
              AppGaps.hGap32,
              Expanded(
                child: ListView(
                  children: [
                    /* <---- 'Price range' category ----> */
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Price range',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          AppGaps.wGap15,
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                        ]),
                    AppGaps.hGap5,
                    /* <---- Price range slider ----> */
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Theme(
                        data: Theme.of(widgetContext).copyWith(
                            sliderTheme: const SliderThemeData(
                          showValueIndicator: ShowValueIndicator.always,
                          activeTrackColor: Colors.white,
                          trackHeight: 2,
                          valueIndicatorColor: Colors.transparent,
                          valueIndicatorTextStyle:
                              TextStyle(color: Colors.white),
                          overlappingShapeStrokeColor: Colors.transparent,
                          rangeValueIndicatorShape:
                              CustomPaddleRangeSliderValueIndicatorShape(),
                          rangeThumbShape: CustomRoundRangeSliderThumbShape(
                              enabledThumbRadius: 10),
                        )),
                        child: RangeSlider(
                          min: 0,
                          max: 100,
                          values: _rangeValues,
                          labels: RangeLabels(
                              '\$${_rangeValues.start.toInt() + 5}',
                              '\$${_rangeValues.end.toInt() + 35}'),
                          inactiveColor: Colors.white.withOpacity(0.20),
                          onChanged: (value) {
                            setState(() {
                              _rangeValues = value;
                            });
                          },
                        ),
                      ),
                    ),
                    AppGaps.hGap24,
                    /* <---- 'Availability' category ----> */
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Availability',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          AppGaps.wGap15,
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                        ]),
                    AppGaps.hGap16,
                    /* <---- 'In stock' of availability category drawer radio 
                             menu widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'In stock',
                      onTap: () {
                        setState(() {
                          _currentFilterAvailability = 0;
                        });
                      },
                      radioValue: 0,
                      radioGroupValue: _currentFilterAvailability,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterAvailability = value ?? 0;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'Pre order' of availability category drawer radio 
                             menu widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Pre order',
                      onTap: () {
                        setState(() {
                          _currentFilterAvailability = 1;
                        });
                      },
                      radioValue: 1,
                      radioGroupValue: _currentFilterAvailability,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterAvailability = value ?? 1;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'New arrival' of availability category drawer radio 
                             menu widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'New arrival',
                      onTap: () {
                        setState(() {
                          _currentFilterAvailability = 2;
                        });
                      },
                      radioValue: 2,
                      radioGroupValue: _currentFilterAvailability,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterAvailability = value ?? 2;
                        });
                      },
                    ),
                    AppGaps.hGap24,
                    /* <---- 'Interface' category ----> */
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Interface',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          AppGaps.wGap15,
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                        ]),
                    AppGaps.hGap16,
                    /* <---- 'Wireless' of interface category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Wireless',
                      onTap: () {
                        setState(() {
                          _currentFilterInterface = 0;
                        });
                      },
                      radioValue: 0,
                      radioGroupValue: _currentFilterInterface,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterInterface = value ?? 0;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'Wired' of interface category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Wired',
                      onTap: () {
                        setState(() {
                          _currentFilterInterface = 1;
                        });
                      },
                      radioValue: 1,
                      radioGroupValue: _currentFilterInterface,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterInterface = value ?? 1;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'Bluetooth' of interface category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Bluetooth',
                      onTap: () {
                        setState(() {
                          _currentFilterInterface = 2;
                        });
                      },
                      radioValue: 2,
                      radioGroupValue: _currentFilterInterface,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterInterface = value ?? 2;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'USB' of interface category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'USB',
                      onTap: () {
                        setState(() {
                          _currentFilterInterface = 3;
                        });
                      },
                      radioValue: 3,
                      radioGroupValue: _currentFilterInterface,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterInterface = value ?? 3;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'Type-C' of interface category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Type-C',
                      onTap: () {
                        setState(() {
                          _currentFilterInterface = 4;
                        });
                      },
                      radioValue: 4,
                      radioGroupValue: _currentFilterInterface,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterInterface = value ?? 4;
                        });
                      },
                    ),
                    AppGaps.hGap24,
                    /* <---- 'Brand' category ----> */
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Brand',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          AppGaps.wGap15,
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                        ]),
                    AppGaps.hGap16,
                    /* <---- 'Beats' of brand category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Beats',
                      onTap: () {
                        setState(() {
                          _currentFilterBrand = 0;
                        });
                      },
                      radioValue: 0,
                      radioGroupValue: _currentFilterBrand,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterBrand = value ?? 0;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'Apple' of brand category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Apple',
                      onTap: () {
                        setState(() {
                          _currentFilterBrand = 1;
                        });
                      },
                      radioValue: 1,
                      radioGroupValue: _currentFilterBrand,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterBrand = value ?? 1;
                        });
                      },
                    ),
                    AppGaps.hGap16,
                    /* <---- 'Samsung' of brand category drawer radio menu 
                             widget ----> */
                    DrawerRadioMenuWidget(
                      text: 'Samsung',
                      onTap: () {
                        setState(() {
                          _currentFilterBrand = 2;
                        });
                      },
                      radioValue: 2,
                      radioGroupValue: _currentFilterBrand,
                      onRadioChange: (value) {
                        setState(() {
                          _currentFilterBrand = value ?? 2;
                        });
                      },
                    ),
                    // Bottom extra spaces before 'Apply filter' button
                    AppGaps.hGap16,
                  ],
                ),
              ),
              /* <---- 'Apply filter' text button ----> */
              CustomTightTextButtonWidget(
                  onTap: () {},
                  child: const Text('Apply filter',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline))),
              // Bottom extra spaces
              AppGaps.hGap50,
            ],
          ),
        ),
      ),
    );
  }

  /* <-------- Initial state --------> */
  @override
  void initState() {
    _setCurrentProductCategoryName(widget.productCategoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _currentProductScaffoldKey,
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          titleWidget: Text(_currentProductCategoryName)),
      /* <-------- Drawer --------> */
      drawer: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.05,
              sigmaY: 3.05,
            ),
            child: const SizedBox.expand(),
          ),
          _drawerWidget(context)
        ],
      ),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
          /* <---- Cart item list ----> */
          child: Column(
        children: [
          /* <---- Top extra spaces ----> */
          AppGaps.hGap10,
          /* <---- Search product name filter button row ----> */
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  /* <---- Search product name text field ----> */
                  child: CustomTextFormField(
                      hasShadow: true,
                      hintText: 'Search product name',
                      prefixIcon: SvgPicture.asset(
                          AppAssetImages.searchSVGLogoLine,
                          color: AppColors.primaryColor))),
              AppGaps.wGap8,
              /* <---- Filter icon button ----> */
              CustomIconButtonWidget(
                fixedSize: const Size(60, 60),
                hasShadow: true,
                backgroundColor: AppColors.primaryColor,
                child: SvgPicture.asset(AppAssetImages.filterSVGLogoLine,
                    color: Colors.white),
                onTap: () {
                  if (_currentProductScaffoldKey.currentState != null &&
                      !_currentProductScaffoldKey.currentState!.isDrawerOpen) {
                    _currentProductScaffoldKey.currentState?.openDrawer();
                  }
                },
              ),
            ],
          ),
          AppGaps.hGap24,
          /* <---- Product grid list under a category ----> */
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: AppGaps.screenPaddingValue,
                  mainAxisSpacing: AppGaps.screenPaddingValue,
                  mainAxisExtent: 235,
                  crossAxisCount: 2,
                  childAspectRatio: 1),
              itemCount: FakeData.products.length,
              itemBuilder: (context, index) {
                /// Per product data
                final product = FakeData.products[index];
                /* <---- Wishlist item widget ----> */
                return CustomGridSingleItemWidget(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppPageNames.productDetailsScreen,
                        arguments: product);
                  },
                  backgroundColor: Colors.white,
                  child: ProductGridSingleItemWidget(
                    title: product.name,
                    shortDescription: product.shortDescription,
                    price: product.price,
                    productImageProvider: product.productImage,
                    isAddedToCart: product.isAddedToCart,
                    isWishlisted: product.isWishlisted,
                    onAddTap: () {
                      setState(() {
                        product.isAddedToCart = !product.isAddedToCart;
                      });
                    },
                    onWishlistTap: () {
                      setState(() {
                        product.isWishlisted = !product.isWishlisted;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
