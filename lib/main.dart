import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';
import 'theme/color_schemes.g.dart';

//screens
import 'package:fledusa/shop/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: 'Metropolitano'),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      title: 'Fledusa',
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fledusa'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Flutter layout demo'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Flutter layout test'),
          ],
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ));
  }
}

final List<Widget> _pages = <Widget>[
  ListView(
    children: [
      imageSection,
      titleSection,
      ButtonSection(),
      textAreaSection,
      NeopopButton(),
    ],
  ),
  SplashScreen()
];

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).colorScheme.primary);
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
                primaryColor: Theme.of(context).colorScheme.primary,
                icon: Icons.shopping_basket_rounded,
                text: 'Verifiziert'),
            Container(width: 20),
            ButtonWidget(
                primaryColor: Theme.of(context).colorScheme.primary,
                icon: Icons.shopping_basket_rounded,
                text: 'Verifiziert'),
            Container(width: 20),
            ButtonWidget(
                primaryColor: Theme.of(context).colorScheme.primary,
                icon: Icons.shopping_basket_rounded,
                text: 'Verifiziert'),
          ],
        ));
  }
}

Widget textAreaSection = const Padding(
  padding: EdgeInsets.all(30),
  child: Text(
    '''Alps. Situated 1,578 meters above sea level, it is one of the Alps. Situated 1,578 meters above sea level, it is one of the Alps. Situated 1,578 meters above sea level, it is one of the Alps. Situated 1,578 meters above sea level, it is one of the Alps. Situated 1,578 meters above sea level, it is one of the.''',
    softWrap: true,
  ),
);

Widget imageSection = Container(
    child: Image.asset(
  'images/DALL·E 2022-12-07 17.59.12 - star sky planet in galaxy photorealistic.png',
  width: 600,
  height: 240,
  fit: BoxFit.cover,
));

Widget titleSection = Container(
  padding: const EdgeInsets.all(30),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Testapp KG',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Metropolitano'),
              ),
            ),
            Text(
              'Birkenfeld, Deutschland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      const FavoriteWidget(),
    ],
  ),
);

class NeopopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: NeoPopCard(
        depth: 5,
        size: Size(1000, 150),
        borderColor: Theme.of(context).colorScheme.primary,
        hShadowColor: Color.fromARGB(255, 24, 24, 24),
        color: Theme.of(context).colorScheme.primary,
        child: Container(
          padding: const EdgeInsets.all(50),
          child: NeoPopTiltedButton(
            isFloating: true,
            decoration: NeoPopTiltedButtonDecoration(
              color: Colors.white,
              shadowColor: Color.fromARGB(255, 66, 66, 66),
              showShimmer: true,
              shimmerColor: Theme.of(context).colorScheme.primary,
              shimmerPlunkColor: Colors.white,
            ),
            onTapUp: () => print(123),
            onTapDown: () => print(1234),
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70.0,
                vertical: 15,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'STARTEN',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Theme.of(context).colorScheme.primary,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 23,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

class ButtonWidget extends StatefulWidget {
  final Color primaryColor;
  final IconData icon;
  final String text;
  const ButtonWidget(
      {Key? key,
      required this.primaryColor,
      required this.icon,
      required this.text})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState(primaryColor);
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool pressed = false;
  Color primaryColor;
  Color secondaryColor = Colors.white;
  _ButtonWidgetState(this.primaryColor);

  void _toggleButton() {
    pressed = !pressed;
    setState(() {
      print(primaryColor);
      var handOver = pressed ? primaryColor : secondaryColor;
      primaryColor = pressed ? Colors.white : handOver;
      secondaryColor = pressed ? handOver : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _toggleButton(),
      child: NeoPopCard(
          color: secondaryColor,
          borderColor: primaryColor,
          hShadowColor: Colors.transparent,
          vShadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, color: primaryColor),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
