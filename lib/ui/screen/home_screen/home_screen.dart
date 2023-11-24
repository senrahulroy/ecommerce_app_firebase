import 'dart:ffi';

import 'package:ecommerceapp_firebase/constants/app_rounts.dart';
import 'package:ecommerceapp_firebase/constants/app_strings.dart';
import 'package:ecommerceapp_firebase/constants/const.dart';
import 'package:ecommerceapp_firebase/constants/widgets/app_common_inpute_field.dart';
import 'package:ecommerceapp_firebase/constants/widgets/app_top_titles.dart';
import 'package:ecommerceapp_firebase/data/model/product_model/product_model.dart';
import 'package:ecommerceapp_firebase/ui/screen/auth_screen/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitles(title: AppString.strECommerce, subTitle: ""),

                const CommonTextField(
                    hintText: AppString.strSearchHere,
                    prefixIcon: Icon(Icons.search),
                    labelText: AppString.strSearch),

                Gap(12.h),
                Text(
                  AppString.strCategories,
                  style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.bold),
                ),

                /// List of Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoriesList
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Card(
                              color: Colors.white,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: SizedBox(
                                height: 100.h,
                                width: 100.w,
                                child: Image.network(e),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                Gap(12.h),

                /// List of Product
                Text(
                  AppString.strTopSelling,
                  style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.bold),
                ),
                Gap(12.h),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: topSelling.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    ProductModel getAllProduct = topSelling[index];
                    return Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                          color: Colors.red.withOpacity(0.2),

                      ),
                      child: Column(
                        children: [
                          Gap(10.h),
                          Image.network(
                            getAllProduct.image,
                            height: 65,
                            width: 65,
                          ),
                          Gap(10.h),
                          Text(
                            getAllProduct.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("Price :  ₹ ${getAllProduct.rate}"),
                          Gap(15.h),
                          SizedBox(
                              height: 35.h,
                              width: 130.w,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  AppString.strBuy,

                                ),
                              )),
                        ],
                      ),
                    );
                  },
                )

                // const Text('Pressed Logout'),
                // IconButton(
                //     onPressed: () {
                //       FirebaseAuth.instance.signOut();
                //       var username = FirebaseAuth.instance.currentUser!.email;
                //       appToast(username!);
                //       Routes.instance.pushReplacement(const LoginScreen(), context);
                //     },
                //     icon: const Icon(Icons.logout))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "https://cdn.pixabay.com/photo/2016/03/31/21/15/bread-1296280_960_720.png",
  "https://www.pngkey.com/png/full/20-201517_image-freeuse-taco-vegetable-design-food-vector-free.png",
  "https://e7.pngegg.com/pngimages/8/586/png-clipart-mcdonalds-hamburger-hot-dog-cheeseburger-veggie-burger-a-burger-food-chicken-meat.png",
  "https://cdn.pixabay.com/photo/2019/05/28/15/22/watermelon-4235381_1280.png",
  "https://w7.pngwing.com/pngs/757/272/png-transparent-corn-food-maize-plant-agriculture-crop-free-vector-graphics-thumbnail.png",
  "https://seeklogo.com/images/P/pizza-logo-42816D88BE-seeklogo.com.png",
];

List<ProductModel> topSelling = [
  ProductModel(
    id: "1",
    rate: "12.99",
    name: "Apple",
    isFavourite: false,
    image:
        "https://e7.pngegg.com/pngimages/399/447/png-clipart-red-apple-illustration-juice-apple-fruit-graphy-red-apple-natural-foods-food-thumbnail.png",
    description:
        "Apples are delicious and nutritious fruits that come in various colors and flavors. They are packed with fiber, vitamins, and antioxidants. Apples are versatile and can be enjoyed as a refreshing snack, sliced in salads, or used in baking for pies and muffins. The crisp texture and natural sweetness of apples make them a popular choice for both kids and adults. From classic red apples to the tangy green varieties, there's an apple for every taste preference.",
    status: "in_stock",
  ),
  ProductModel(
    id: "2",
    rate: "9.49",
    name: "Banana",
    isFavourite: true,
    image:
        "https://img.lovepik.com/free-png/20220120/lovepik-banana-png-image_401551817_wh860.png",
    description:
        "Bananas are an energy-packed tropical fruit known for their rich potassium content. They are easy to peel and make a convenient on-the-go snack. Bananas can be blended into smoothies, added to cereal, or used as a natural sweetener in recipes. The natural sugars in bananas provide a quick energy boost, making them a favorite among athletes. With their creamy texture and mild flavor, bananas are a versatile fruit that pairs well with many dishes.",
    status: "in_stock",
  ),
  ProductModel(
    id: "3",
    rate: "6.99",
    name: "Orange",
    isFavourite: false,
    image:
        "https://w7.pngwing.com/pngs/187/615/png-transparent-orange-fruit-orange-tangerine-orange-natural-foods-food-citrus.png",
    description:
        "Oranges are vibrant citrus fruits known for their refreshing taste and high vitamin C content. They can be peeled and segmented for a juicy and tangy snack. Oranges are often juiced to create a flavorful and vitamin-packed beverage. The zesty aroma of oranges adds a burst of flavor to dishes and desserts. With their bright color and health benefits, oranges are a popular choice to boost the immune system and brighten up any meal.",
    status: "in_stock",
  ),
  ProductModel(
    id: "4",
    rate: "5.99",
    name: "Grapes",
    isFavourite: true,
    image:
        "https://e7.pngegg.com/pngimages/675/564/png-clipart-sultana-grape-verjuice-wine-seedless-fruit-grape-natural-foods-food.png",
    description:
        "Grapes are small, round fruits that come in various colors such as red, green, and purple. They are naturally sweet and make a delicious snack. Grapes are also used to make wines and juices. They are rich in antioxidants, especially in red and purple varieties. The juicy and crisp texture of grapes makes them a favorite in fruit salads, cheese platters, and desserts. Enjoy the burst of flavor in every grape!",
    status: "in_stock",
  ),
  ProductModel(
    id: "5",
    rate: "3.99",
    name: "Strawberry",
    isFavourite: true,
    image:
        "https://w7.pngwing.com/pngs/983/762/png-transparent-strawberry-fruit-strawberry-strawberry-clipart-thumbnail.png",
    description:
        "Strawberries are delightful, heart-shaped berries known for their sweet taste and vibrant red color. They are a fantastic source of vitamin C, antioxidants, and dietary fiber. Strawberries are enjoyed on their own, added to cereals and yogurt, or used as a topping for desserts. These berries are a sign of summer and bring joy to both kids and adults. Enjoy the juicy and refreshing goodness of strawberries.",
    status: "in_stock",
  ),
  ProductModel(
    id: "6",
    rate: "4.49",
    name: "Mango",
    isFavourite: true,
    image:
        "https://e7.pngegg.com/pngimages/493/777/png-clipart-slice-of-mango-mango-tea-fruit-mango-game-food-thumbnail.png",
    description:
        "Mangoes are tropical fruits known for their luscious, sweet flavor and smooth texture. They are rich in vitamins A and C, as well as dietary fiber. Mangoes are commonly eaten fresh, but they can also be used in smoothies, salsas, and desserts. Their tropical aroma and unique taste evoke images of sunny beaches and warm climates. Discover the tropical paradise of mangoes!",
    status: "in_stock",
  ),
  ProductModel(
    id: "7",
    rate: "7.99",
    name: "Pineapple",
    isFavourite: true,
    image:
        "https://w7.pngwing.com/pngs/9/79/png-transparent-pineapple-fruit-pineapple-pineapple-fruit-pineapple-clipart-thumbnail.png",
    description:
        "Pineapples are juicy and tropical fruits with a deliciously sweet and tangy flavor. They are an excellent source of vitamin C and manganese. Pineapples can be sliced and enjoyed fresh, grilled for a delightful dessert, or used in refreshing fruit salads. The distinct taste of pineapples adds a tropical twist to various dishes. Savor the tropical sweetness of pineapples!",
    status: "in_stock",
  ),
  ProductModel(
    id: "8",
    rate: "8.99",
    name: "Watermelon",
    isFavourite: false,
    image:
        "https://w7.pngwing.com/pngs/3/669/png-transparent-watermelon-seed-fruit-vegetable-watermelon-watermelon-food-sweetness-melon.png",
    description:
        "Watermelon is a hydrating and refreshing summer fruit known for its juicy, sweet, and crisp flesh. It's a great source of hydration due to its high water content. Watermelon can be enjoyed in slices, blended into refreshing beverages, or used in fruit salads. The vibrant pink and green colors of watermelon brighten up picnics and gatherings. Stay refreshed with the cool and juicy taste of watermelon!",
    status: "in_stock",
  ),
  ProductModel(
    id: "9",
    rate: "5.99",
    name: "Blueberry",
    isFavourite: true,
    image:
        "https://w7.pngwing.com/pngs/582/846/png-transparent-blueberry-organic-food-bilberry-blueberry-natural-foods-food-blueberry.png",
    description:
        "Blueberries are small, round berries with a deep blue-purple hue. They are packed with antioxidants, vitamins, and fiber. Blueberries can be enjoyed as a snack, added to yogurt, or used in baking muffins and pancakes. The natural sweetness and nutritional value of blueberries make them a superfood. Dive into the rich flavor and health benefits of blueberries!",
    status: "in_stock",
  ),
  ProductModel(
    id: "10",
    rate: "6.49",
    name: "Kiwi",
    isFavourite: false,
    image:
        "https://static.vecteezy.com/system/resources/previews/008/530/509/original/kiwi-fruit-cutout-file-png.png",
    description:
        "Kiwi is a small, fuzzy fruit with a unique sweet-tart flavor. It's a great source of vitamin C, vitamin K, and dietary fiber. Kiwi can be sliced and eaten as is, added to fruit salads, or used in smoothies. The vibrant green color and refreshing taste of kiwi make it a popular choice for healthy snacking. Explore the exotic taste of kiwi!",
    status: "in_stock",
  ),
  ProductModel(
    id: "11",
    rate: "2.99",
    name: "Peach",
    isFavourite: true,
    image:
        "https://e7.pngegg.com/pngimages/192/444/png-clipart-peach-peach.png",
    description:
        "Peaches are juicy and flavorful fruits with a soft texture and sweet taste. They are rich in vitamins A and C, as well as dietary fiber. Peaches can be enjoyed fresh, sliced in salads, or used in desserts like pies and cobblers. The fragrant aroma and succulent flesh of peaches evoke the warmth of summer. Savor the sweetness of ripe peaches!",
    status: "in_stock",
  ),
  ProductModel(
    id: "12",
    rate: "9.99",
    name: "Pear",
    isFavourite: true,
    image:
        "https://e7.pngegg.com/pngimages/840/28/png-clipart-asian-pear-fruit-pear-food-photography-thumbnail.png",
    description:
        "Pears are sweet and juicy fruits with a smooth texture and delicate flavor. They are a good source of dietary fiber and vitamin C. Pears can be eaten fresh, sliced in salads, or used in cooking. The versatility of pears makes them a delightful addition to both sweet and savory dishes. Discover the subtle sweetness of pears!",
    status: "in_stock",
  ),
  ProductModel(
    id: "13",
    rate: "7.49",
    name: "Cherry",
    isFavourite: false,
    image:
        "https://e7.pngegg.com/pngimages/333/291/png-clipart-cherry-cherry-fresh-cherries-thumbnail.png",
    description:
        "Cherries are small, round fruits with a vibrant color and deliciously sweet-tart taste. They are rich in antioxidants and vitamin C. Cherries can be enjoyed as a snack, added to desserts, or used in cooking. From sweet Bing cherries to tart Montmorency cherries, there's a cherry variety for every palate. Indulge in the juicy and flavorful goodness of cherries!",
    status: "in_stock",
  ),
  ProductModel(
    id: "14",
    rate: "4.99",
    name: "Plum",
    isFavourite: true,
    image:
        "https://w7.pngwing.com/pngs/872/938/png-transparent-wine-juice-plum-peach-fruit-plum-natural-foods-food-photography-thumbnail.png",
    description:
        "Plums are succulent and sweet stone fruits with a smooth skin and tender flesh. They are rich in vitamins, minerals, and dietary fiber. Plums can be eaten fresh, dried to make prunes, or used in cooking and baking. The natural sweetness of plums makes them a delightful treat for the whole family. Enjoy the burst of flavor in every plum!",
    status: "in_stock",
  ),
  ProductModel(
    id: "15",
    rate: "6.99",
    name: "Raspberry",
    isFavourite: true,
    image:
        "https://w7.pngwing.com/pngs/990/444/png-transparent-raspberry-fruits-red-raspberry-fruit-black-raspberry-raspberry-ketone-rasberry-natural-foods-frutti-di-bosco-food-thumbnail.png",
    description:
        "Raspberries are small, delicate berries known for their vibrant red color and sweet-tart taste. They are loaded with antioxidants, vitamins, and fiber. Raspberries can be enjoyed on their own, added to yogurt, or used in baking. The bold flavor and nutritional benefits of raspberries make them a popular choice for healthy snacking. Delight in the tangy-sweet goodness of raspberries!",
    status: "in_stock",
  ),
  ProductModel(
    id: "16",
    rate: "8.99",
    name: "Blackberry",
    isFavourite: false,
    image:
        "https://w7.pngwing.com/pngs/653/224/png-transparent-blackberry-fruit-food-blackberry-frutti-di-bosco-food-fruit-thumbnail.png",
    description:
        "Blackberries are dark, juicy berries with a rich and sweet flavor. They are a great source of vitamins, minerals, and antioxidants. Blackberries can be enjoyed fresh, added to cereal, or used in desserts and smoothies. Their deep color and delectable taste make blackberries a wonderful addition to a healthy diet. Experience the juicy goodness of blackberries!",
    status: "in_stock",
  ),
  ProductModel(
    id: "17",
    rate: "3.49",
    name: "Cantaloupe",
    isFavourite: true,
    image:
        "https://w7.pngwing.com/pngs/65/352/png-transparent-two-sliced-melons-melon-cantaloupe-fruit-melon-food-orange-watermelon.png",
    description:
        "Cantaloupe, also known as muskmelon, is a sweet and aromatic fruit with a pale orange flesh. It's a great source of vitamins A and C, as well as hydration due to its high water content. Cantaloupe can be enjoyed in slices, blended into smoothies, or used in fruit salads. The refreshing taste and juiciness of cantaloupe make it a delightful summer treat. Stay refreshed with the cool and sweet flavor of cantaloupe!",
    status: "in_stock",
  ),
  ProductModel(
    id: "18",
    rate: "2.99",
    name: "Pomegranate",
    isFavourite: true,
    image:
        "https://e7.pngegg.com/pngimages/38/272/png-clipart-pomegranate-juice-pomegranate-natural-foods-frutti-di-bosco.png",
    description:
        "Pomegranates are unique fruits with a tough outer skin and a treasure trove of juicy seeds known as arils. They are rich in antioxidants and vitamins. Pomegranates can be eaten by removing the arils, which are bursting with sweet-tart flavor and a hint of crunch. The vibrant color and health benefits of pomegranates make them a popular choice for both culinary and medicinal purposes. Experience the delightful burst of arils in every pomegranate!",
    status: "in_stock",
  ),
  ProductModel(
    id: "19",
    rate: "5.99",
    name: "Apricot",
    isFavourite: true,
    image:
        "https://e7.pngegg.com/pngimages/29/515/png-clipart-plum-fruits-apricot-apricots-natural-foods-food.png",
    description:
        "Apricots are small, golden-orange fruits with a soft and velvety skin. They are rich in vitamins A and C, as well as dietary fiber. Apricots can be enjoyed fresh, dried to make a nutritious snack, or used in cooking and baking. Their delicate flavor and natural sweetness make apricots a delightful addition to fruit salads and desserts. Savor the juicy goodness of apricots!",
    status: "in_stock",
  ),
  ProductModel(
    id: "20",
    rate: "7.99",
    name: "Mango",
    isFavourite: true,
    image:
        "https://w7.pngwing.com/pngs/790/811/png-transparent-sliced-mangoe-juice-mango-alphonso-fruit-flavor-mango-food-dried-fruit-tropical-fruit-thumbnail.png",
    description:
        "Mangoes are tropical fruits known for their luscious, sweet flavor and smooth texture. They are rich in vitamins A and C, as well as dietary fiber. Mangoes are commonly eaten fresh, but they can also be used in smoothies, salsas, and desserts. Their tropical aroma and unique taste evoke images of sunny beaches and warm climates. Discover the tropical paradise of mangoes!",
    status: "in_stock",
  ),
];
