import 'package:ecomik/models/fake_data.dart';
import 'package:ecomik/models/fake_models/product_model.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/product_detail_screen_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/product_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  /// The product parameter required data type of FakeProductModel for show
  /// product details from the object.
  final Object? product;
  const ProductDetailsScreen({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  /// The product object from parameter with default demo value
  FakeProductModel _product = FakeProductModel(
      name: 'Sony DR-ZX1AP',
      shortDescription: 'Wireless headphone',
      productImage:
          Image.asset('assets/images/demo_images/product_categories/item1.png')
              .image,
      price: '14.99',
      availableColors: [
        const Color(0xFFEB8169),
        const Color(0xFFC5C0D6),
        const Color(0xFF292B49),
        const Color(0xFF9BC9BE),
      ],
      availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
      description:
          'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
      rating: 4.2);
  final PageController _productImagePageController = PageController();
  bool _isReviewSelected = false;

  /* <-------- Select current product object initially --------> */
  void _setCurrentProductObject(Object? argument) {
    if (argument != null) {
      if (argument is FakeProductModel) {
        _product = argument;
      }
    }
  }

  /* <-------- Initial state --------> */
  @override
  void initState() {
    _setCurrentProductObject(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(screenContext: context),
      /* <-------- Content --------> */
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                /* <---- Product images carousel ----> */
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: screenSize.height < 550 ? 290 : 380,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /* <---- Product images carousel widget ----> */
                          SizedBox(
                            height: screenSize.height < 550 ? 300 : 380,
                            child: PageView.builder(
                              itemCount: 5,
                              controller: _productImagePageController,
                              itemBuilder: (context, index) => Container(
                                alignment: Alignment.center,
                                child: Image(image: _product.productImage),
                              ),
                            ),
                          ),
                          AppGaps.hGap24,
                          /* <---- Products carousel indicator widget ----> */
                          Center(
                            child: SmoothPageIndicator(
                                controller: _productImagePageController,
                                count: 5,
                                effect: ScrollingDotsEffect(
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    spacing: 8,
                                    dotColor:
                                        AppColors.darkColor.withOpacity(0.15),
                                    activeDotColor: AppColors.primaryColor)),
                          ),
                          AppGaps.hGap24,
                        ],
                      ),
                    ))
              ],
          /* <---- Remaining content ----> */
          body: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppGaps.screenPaddingValue),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: CustomScrollView(slivers: [
              // Top extra spaces
              const SliverToBoxAdapter(child: AppGaps.hGap24),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* <---- Product name ----> */
                    Text(_product.name,
                        style: Theme.of(context).textTheme.headline4),
                    AppGaps.hGap8,
                    /* <---- Product name, rating stars, cart count ----> */
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /* <---- Product rating ----> */
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* <---- Product rating stars widget ----> */
                            SizedBox(
                                height: 16,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      AppGaps.wGap2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                      SvgPicture.asset(
                                    AppAssetImages.starSVGLogoSolid,
                                    color: AppColors.secondaryColor,
                                  ),
                                )),
                            AppGaps.wGap4,
                            /* <---- Product rating number text ----> */
                            Text('(${_product.rating.toStringAsFixed(2)})',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      color: AppColors.bodyTextColor,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
                        /* <---- Product cart add or remove buttons with 
                                 counter text ----> */
                        PlusMinusCounterRow(
                            counterText: '${_product.cartCount}',
                            onRemoveTap: () {
                              if (_product.cartCount > 1) {
                                setState(() {
                                  _product.cartCount--;
                                });
                              }
                            },
                            onAddTap: () {
                              setState(() {
                                _product.cartCount++;
                              });
                            }),
                      ],
                    ),
                    AppGaps.hGap24,
                    const Text('Color',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    AppGaps.hGap7,
                    /* <---- Product color selection ----> */
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: _product.availableColors.length,
                                separatorBuilder: (context, index) =>
                                    AppGaps.wGap10,
                                itemBuilder: (context, index) {
                                  final selectedColor =
                                      _product.availableColors[index];
                                  return index == _product.selectedColorIndex
                                      ? Center(
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.bodyTextColor,
                                                    width: 2),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: CustomIconButtonWidget(
                                                onTap: () {},
                                                fixedSize: const Size(32, 32),
                                                borderRadiusRadiusValue:
                                                    const Radius.circular(10),
                                                backgroundColor: selectedColor,
                                                child: const SizedBox()),
                                          ),
                                        )
                                      : Center(
                                          child: CustomIconButtonWidget(
                                              onTap: () {
                                                setState(() {
                                                  _product.selectedColorIndex =
                                                      index;
                                                });
                                              },
                                              fixedSize: const Size(32, 32),
                                              borderRadiusRadiusValue:
                                                  const Radius.circular(10),
                                              backgroundColor: selectedColor,
                                              child: const SizedBox()));
                                }),
                          ),
                        ),
                        AppGaps.wGap10,
                        /* <---- Product price ----> */
                        Text(
                          r'Price: $65.00',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: AppGaps.hGap32),
              /* <---- Product review and description tab button ----> */
              SliverToBoxAdapter(
                child: Container(
                  height: 82,
                  decoration: const BoxDecoration(
                      color: AppColors.shadeColor2,
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /* <---- Product review tab button ----> */
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomTabToggleButtonWidget(
                              text: 'Review (8)',
                              isSelected: _isReviewSelected,
                              onTap: () =>
                                  setState(() => _isReviewSelected = true)),
                        ),
                      ),
                      AppGaps.wGap5,
                      /* <---- Product description tab button ----> */
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomTabToggleButtonWidget(
                              text: 'Description',
                              isSelected: !_isReviewSelected,
                              onTap: () =>
                                  setState(() => _isReviewSelected = false)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: AppGaps.hGap24),
              _isReviewSelected
                  /* <---- If product review tab is selected ----> */
                  /* <---- Review list ----> */
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        /// Single review
                        final review = FakeData.reviews[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: ReviewDetailsWidget(review: review),
                        );
                      }, childCount: FakeData.reviews.length),
                    )
                  /* <---- If product description tab is selected ----> */
                  /* <---- Description widget ----> */
                  : SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* <---- Product description text ----> */
                          Text(_product.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: AppColors.bodyTextColor)),
                          AppGaps.hGap32,
                          Text('Size',
                              style: Theme.of(context).textTheme.button),
                          AppGaps.hGap16,
                          /* <---- Product available size horizontal option 
                                   list ----> */
                          SizedBox(
                            height: 42,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  AppGaps.wGap8,
                              itemCount: _product.availableSizes.length,
                              itemBuilder: (context, index) {
                                // Single available size
                                final availableSize =
                                    _product.availableSizes[index];
                                return ProductSizeWidget(
                                    availableSizeText: availableSize,
                                    isSelected:
                                        _product.selectedSizeIndex == index,
                                    onTap: () => setState(() =>
                                        _product.selectedSizeIndex = index));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
              const SliverToBoxAdapter(child: AppGaps.hGap32),
              SliverToBoxAdapter(
                child: Text(
                  'Similar Products',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              const SliverToBoxAdapter(child: AppGaps.hGap16),
              /* <---- Similar few product list carousel ----> */
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 268,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => AppGaps.wGap15,
                  itemCount: FakeData.similarProducts.length,
                  itemBuilder: (context, index) {
                    // Single similar product
                    final similarProduct = FakeData.similarProducts[index];
                    return SizedBox(
                      width: 175,
                      height: 268,
                      child: CustomGridSingleItemWidget(
                        backgroundColor: Colors.white,
                        borderColor: AppColors.lineShapeColor,
                        onTap: () {},
                        child: ProductGridSingleItemWidget(
                          title: similarProduct.productName,
                          shortDescription: similarProduct.productCategory,
                          price: similarProduct.priceText,
                          productImageProvider: similarProduct.productImage,
                          isAddedToCart: similarProduct.isAddedToCart,
                          isWishlisted: similarProduct.isWishlisted,
                          onAddTap: () => setState(() => similarProduct
                              .isAddedToCart = !similarProduct.isAddedToCart),
                          onWishlistTap: () => setState(() => similarProduct
                              .isWishlisted = !similarProduct.isWishlisted),
                        ),
                      ),
                    );
                  },
                ),
              )),
              // Bottom spaces
              const SliverToBoxAdapter(child: AppGaps.hGap30),
            ]),
          )),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedButtonWidget(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssetImages.cartSVGLogoLine,
                  color: Colors.white,
                ),
                AppGaps.wGap8,
                const Text('Add to cart'),
              ],
            ),
            onTap: () {}),
      ),
    );
  }
}
