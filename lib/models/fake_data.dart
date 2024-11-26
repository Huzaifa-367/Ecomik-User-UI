import 'package:ecomik/models/fake_models/chat_message_model.dart';
import 'package:ecomik/models/fake_models/home_product_category_model.dart';
import 'package:ecomik/models/fake_models/intro_content_model.dart';
import 'package:ecomik/models/fake_models/my_order_model.dart';
import 'package:ecomik/models/fake_models/notification_model.dart';
import 'package:ecomik/models/fake_models/payment_option_model.dart';
import 'package:ecomik/models/fake_models/product_model.dart';
import 'package:ecomik/models/fake_models/product_review_model.dart';
import 'package:ecomik/models/fake_models/recent_payment_product_model.dart';
import 'package:ecomik/models/fake_models/saved_address_model.dart';
import 'package:ecomik/models/fake_models/similar_product_model.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FakeData {
  // Intro screens
  static List<FakeIntroContent> fakeIntroContents = [
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration1.png',
        slogan: 'Discover something new',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration2.png',
        slogan: 'Clearly different',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration3.png',
        slogan: 'Buy, think & grow',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
  ];

  // Home page product categories
  static List<FakeHomeProductCategory> fakeHomeProductCategories = [
    FakeHomeProductCategory(
        title: 'Headphone',
        itemNumber: 22,
        categoryImage: Image.asset(
                'assets/images/demo_images/product_categories/item1.png')
            .image),
    FakeHomeProductCategory(
        title: 'Photography',
        itemNumber: 22,
        categoryImage: Image.asset(
                'assets/images/demo_images/product_categories/item2.png')
            .image),
    FakeHomeProductCategory(
        title: 'Accessories',
        itemNumber: 22,
        categoryImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image),
    FakeHomeProductCategory(
        title: 'Hand watch',
        itemNumber: 22,
        categoryImage: Image.asset(
                'assets/images/demo_images/product_categories/item4.png')
            .image),
    FakeHomeProductCategory(
        title: 'Home Decor',
        itemNumber: 22,
        categoryImage: Image.asset(
                'assets/images/demo_images/product_categories/item5.png')
            .image),
    FakeHomeProductCategory(
        title: 'Sound speaker',
        itemNumber: 22,
        categoryImage: Image.asset(
                'assets/images/demo_images/product_categories/item6.png')
            .image),
  ];

  // Products for various screens
  static List<FakeProductModel> products = [
    FakeProductModel(
        name: 'Sony DR-ZX1AP',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item1.png')
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
        rating: 4.2),
    FakeProductModel(
        name: 'Bose Quiet Comfort',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item2.png')
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
        rating: 4.2),
    FakeProductModel(
        name: 'Beats Pro Wired',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
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
        rating: 4.2),
    FakeProductModel(
        name: 'JBL Wireless',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item4.png')
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
        rating: 4.2),
  ];

  // Notifications
  static List<FakeNotificationDateGroupModel> fakeNotificationDateGroups = [
    FakeNotificationDateGroupModel(
      dateHumanReadableText: 'Today',
      groupNotifications: [
        FakeNotificationModel(timeText: '02:02 PM', isRead: false, texts: [
          FakeNotificationTextModel(text: 'Your order '),
          FakeNotificationTextModel(text: '#637288', isHashText: true),
          FakeNotificationTextModel(text: ' is arrived Railstation by '),
          FakeNotificationTextModel(text: 'Michle Leo Hunt', isBoldText: true),
        ]),
        FakeNotificationModel(timeText: '03:10 PM', isRead: true, texts: [
          FakeNotificationTextModel(text: 'You received a payment of '),
          FakeNotificationTextModel(text: '#58.00', isHashText: true),
          FakeNotificationTextModel(text: ' is arrived Railstation by '),
          FakeNotificationTextModel(text: 'Michle Leo Hunt', isBoldText: true),
        ]),
      ],
    ),
    FakeNotificationDateGroupModel(
      dateHumanReadableText: 'Yesterday',
      groupNotifications: [
        FakeNotificationModel(timeText: '02:02 PM', isRead: true, texts: [
          FakeNotificationTextModel(text: '30% Discount', isColoredText: true),
          FakeNotificationTextModel(text: ' on '),
          FakeNotificationTextModel(text: 'trending item', isColoredText: true),
          FakeNotificationTextModel(
              text: ' for all new customer for first 20 sales'),
        ]),
        FakeNotificationModel(timeText: '03:10 PM', isRead: true, texts: [
          FakeNotificationTextModel(text: 'You received a payment of '),
          FakeNotificationTextModel(text: '#58.00', isHashText: true),
          FakeNotificationTextModel(text: ' is arrived Railstation by '),
          FakeNotificationTextModel(text: 'Michle Leo Hunt', isBoldText: true),
        ]),
        FakeNotificationModel(timeText: '27 Dec, 2021', isRead: true, texts: [
          FakeNotificationTextModel(text: 'You received a payment of '),
          FakeNotificationTextModel(text: '#58.00', isHashText: true),
          FakeNotificationTextModel(text: ' is arrived Railstation by '),
          FakeNotificationTextModel(text: 'Michle Leo Hunt', isBoldText: true),
        ]),
      ],
    ),
    FakeNotificationDateGroupModel(
      dateHumanReadableText: '27 Dec, 2021',
      groupNotifications: [
        FakeNotificationModel(timeText: '02:02 PM', isRead: true, texts: [
          FakeNotificationTextModel(text: '30% Discount', isColoredText: true),
          FakeNotificationTextModel(text: ' on '),
          FakeNotificationTextModel(text: 'trending item', isColoredText: true),
          FakeNotificationTextModel(
              text: ' for all new customer for first 20 sales'),
        ]),
        FakeNotificationModel(timeText: '03:10 PM', isRead: true, texts: [
          FakeNotificationTextModel(text: 'You received a payment of '),
          FakeNotificationTextModel(text: '#58.00', isHashText: true),
          FakeNotificationTextModel(text: ' is arrived Railstation by '),
          FakeNotificationTextModel(text: 'Michle Leo Hunt', isBoldText: true),
        ]),
        FakeNotificationModel(timeText: '27 Dec, 2021', isRead: true, texts: [
          FakeNotificationTextModel(text: 'You received a payment of '),
          FakeNotificationTextModel(text: '#58.00', isHashText: true),
          FakeNotificationTextModel(text: ' is arrived Railstation by '),
          FakeNotificationTextModel(text: 'Michle Leo Hunt', isBoldText: true),
        ]),
      ],
    ),
  ];

  /// Reviews
  static List<ProductReview> reviews = [
    ProductReview(
        reviewerName: 'Michle Jhon Smith',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer1.png')
                .image),
    ProductReview(
        reviewerName: 'Angle Saniya',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer2.png')
                .image)
  ];

  /// Payment options
  static List<FakePaymentOptionModel> paymentOptions = [
    FakePaymentOptionModel(
        name: 'Credit card',
        paymentImage: SvgPicture.asset(AppAssetImages.masterCardSVGLogoColor)),
    FakePaymentOptionModel(
        name: 'Paypal',
        paymentImage: SvgPicture.asset(AppAssetImages.paypalCardSVGLogoColor)),
    FakePaymentOptionModel(
        name: 'Debit card',
        paymentImage: SvgPicture.asset(AppAssetImages.googleSVGLogoColor)),
    FakePaymentOptionModel(
        name: 'Cash on delivery',
        paymentImage: SvgPicture.asset(AppAssetImages.walletSVGLogoSolid,
            color: AppColors.primaryColor, height: 32, width: 32)),
  ];

  /// Sample delivery man chat data
  static List<FakeChatMessageModel> deliveryManChats = [
    FakeChatMessageModel(
      isMyMessage: true,
      message: 'Hey there?\nHow much time?',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: false,
      message: 'On my way sir.\nWill reach in 10 mins.',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: true,
      message: 'Ok come with carefully!\nRemember the address please!',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: false,
      message:
          'Btw, I want to know more about the room space and facilities & can I get some more picture of current.',
      dateTimeText: 'Sep 04 2020',
    ),
  ];

  /// My orders
  static List<FakeMyOrderModel> myOrders = [
    FakeMyOrderModel(
        name: 'AJ504 Green Airpod',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image1.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'pending'),
    FakeMyOrderModel(
        name: 'Havit Gamenote',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image2.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
    FakeMyOrderModel(
        name: 'Havit HV-H2116D',
        price: '23.00',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image,
        dateText: '26 Dec, 2021',
        orderStatus: 'processing'),
    FakeMyOrderModel(
        name: 'KWG Taurus M1',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image3.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'cancelled'),
    FakeMyOrderModel(
        name: 'Havit HV-H2002D',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image4.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
  ];

  /// Recently my bought product
  static List<FakeRecentPaymentProduct> recentPaymentProducts = [
    FakeRecentPaymentProduct(
        productName: 'Sennheiser Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image1.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'JBL Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image2.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Beats Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image3.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Bose Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image4.png')
                .image),
  ];

  /// Saved addresses
  static List<FakeSavedAddressModel> savedAddresses = [
    FakeSavedAddressModel(
        addressType: 'home',
        addressText:
            'Flat No 12, First Floor, Central Residency 1023, Central Residency, Hamilton Park New York, USA'),
    FakeSavedAddressModel(
        addressType: 'office',
        addressText:
            'Flat No 12, First Floor, Central Residency 1023, Central Residency, Hamilton Park New York, USA'),
    FakeSavedAddressModel(
        addressType: 'other',
        addressText:
            'Flat No 12, First Floor, Central Residency 1023, Central Residency, Hamilton Park New York, USA'),
  ];

  /// Similar products
  static List<FakeSimilarProduct> similarProducts = [
    FakeSimilarProduct(
        productName: 'JBL Wireless',
        productCategory: 'Wireless headsets',
        priceText: '14.99',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image1.png')
                .image),
    FakeSimilarProduct(
        productName: 'JBL Wireless',
        productCategory: 'Wireless headsets',
        priceText: '14.99',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image2.png')
                .image),
    FakeSimilarProduct(
        productName: 'JBL Wireless',
        productCategory: 'Wireless headsets',
        priceText: '14.99',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image3.png')
                .image),
    FakeSimilarProduct(
        productName: 'JBL Wireless',
        productCategory: 'Wireless headsets',
        priceText: '14.99',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image4.png')
                .image),
  ];
}
