import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../themes.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final _kTabPages = <Widget>[
      doctorsList(),
      doctorsList(),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'الدكاترة'),
      const Tab(text: 'العيادات'),
    ];

    return DefaultTabController(
      initialIndex: 1,
      length: _kTabs.length,
      child: ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: _appBarTitle,
              leading: ThemeSwitcher(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.brightness_4_rounded,
                    //size: 30,
                  ),
                  onPressed: () {
                    final theme =
                        isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

                    final switcher = ThemeSwitcher.of(context);
                    switcher.changeTheme(theme: theme);
                  },
                ),
              ),
              actions: [
                new IconButton(
                  icon: _searchIcon,
                  onPressed: _searchPressed,
                ),
              ],
              bottom: TabBar(tabs: _kTabs),
            ),
            body: TabBarView(
              children: _kTabPages,
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorsList() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: FlutterLogo(),
              ),
              title: Text('اسم العيادة'),
              subtitle: Text('معلومات'),
            );
          }),
    );
  }

  ////////////////////////////// search app bar
  Widget _appBarTitle = new Text('الصفحة الرئيسية');
  Icon _searchIcon = new Icon(Icons.search);

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          textAlign: TextAlign.end,
          onEditingComplete: () {
            setState(() {
              //  getdata();
            });
          },
          onSubmitted: (v) {
            setState(() {
              // getdata();
            });
            print(v);
          },
          onChanged: (val) => initiateSearch(val),
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
              suffixIcon: new Icon(Icons.search), hintText: '....بحث   '),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('الصفحة الرئيسية');
      }
    });
  }

  String name = "";
  void initiateSearch(String val) {
    setState(() {
      name = val.toLowerCase().trim();
    });
  }
}
