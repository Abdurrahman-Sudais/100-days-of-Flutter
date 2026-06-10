import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade300),
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  bool _hideBalance = false;

  Widget _navItem(FaIconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 14,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            FaIcon(
              icon,
              size: 24,
              color: isSelected ? Colors.white : Colors.grey.shade400,
            ),
            if (isSelected) ...[
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _balanceCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cash Balance",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  Text(
                    "Account & Routing",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    _hideBalance ? "••••••" : "\$24.89",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _hideBalance = !_hideBalance),
                    child: FaIcon(
                      _hideBalance
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xFFF5F5F5),
                        minimumSize: Size(double.infinity, 60),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Add Cash",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xFFF5F5F5),
                        minimumSize: Size(double.infinity, 60),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Cash Out",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _savingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Savings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFFD7D7D7),
                ),
              ],
            ),
            Spacer(),
            Image.network(
              'https://files.catbox.moe/3p6h48.png',
              height: 60,
              fit: BoxFit.contain,
            ),
            Text(
              "\$0.00",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Save for a goal",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buyBitcoinCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buy Bitcoin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xFFD7D7D7),
                  ),
                ],
              ),
            ),
            Spacer(),
            Image.network(
              'https://files.catbox.moe/fg1srj.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Widget _investCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 7, bottom: 2, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invest in stocks",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xFFD7D7D7),
                  ),
                ],
              ),
            ),
            Spacer(),
            Image.network(
              'https://files.catbox.moe/jv6fa3.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Widget _taxCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Free tax filing",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xFFD7D7D7),
                  ),
                ],
              ),
            ),
            Spacer(),
            Image.network(
              'https://files.catbox.moe/1lwyc8.png',
              height: 80,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Widget _gridview() {
    final List<Widget> cards = [
      _savingsCard(),
      _buyBitcoinCard(),
      _investCard(),
      _taxCard(),
    ];

    return GridView.builder(
      itemCount: cards.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) => cards[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        title: Text(
          "M O N I F Y",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFA0978C),
              backgroundImage: NetworkImage(
                "https://files.catbox.moe/ueaiq0.jpg",
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF5F5F5),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navItem(FontAwesomeIcons.house, 'Home', 0),
            _navItem(FontAwesomeIcons.creditCard, 'Card', 1),
            _navItem(FontAwesomeIcons.dollarSign, 'Money', 2),
            _navItem(FontAwesomeIcons.magnifyingGlass, 'Search', 3),
            _navItem(FontAwesomeIcons.clockRotateLeft, 'History', 4),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            _balanceCard(),
            SizedBox(height: 15),
            _gridview(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
