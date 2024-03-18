import 'package:flutter/material.dart';
import 'package:intranet_pais/models/home_options.dart';
import 'package:intranet_pais/utils/Constants.dart';
import 'package:intranet_pais/utils/responsive.dart';
import 'package:intranet_pais/view/registro-pias/registro-pias.dart';

// Define the GlobalKey for the Scaffold
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    int currenIndex = 0;
    List<HomeOptions> aHomeOptions = [];
    double wp = responsive.wp(14);
    double hp65 = responsive.hp(1);
    String icon0 = 'assets/icons/icon_user_setting.png';
    aHomeOptions.add(
      HomeOptions(
        code: 'OPT0001',
        name: 'REGISTRO PIAS',
        types: const ['Ver'],
        image: icon0,
        color: blanco,
      ),
    );

/*    aHomeOptions.add(
      HomeOptions(
        code: 'OPT0001',
        name: 'INTERVENCIONES REGISTRADAS',
        types: const ['Ver'],
        image: icon0,
        color: blanco,
      ),
    ); */

    List listPages = [
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: hp65,
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                padding: const EdgeInsets.only(
                  left: 28,
                  right: 28,
                  bottom: 58,
                ),
                itemCount: aHomeOptions.length,
                itemBuilder: (context, index) {
                  HomeOptions homeOption = aHomeOptions[index];
                  return InkWell(
                      splashColor: Colors.white10,
                      highlightColor: Colors.white10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/icons/botones 1-02.png"),
                            fit: BoxFit.cover,
                          ),
                          color: homeOption.color,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 8,
                                ),
                                child: Hero(
                                  tag: homeOption.image!,
                                  child: Image.asset(
                                    homeOption.image!,
                                    fit: BoxFit.contain,
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(1),
                                child: Center(
                                  child: Text(
                                    homeOption.name!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 11.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {
                        var oHomeOptionSelect = aHomeOptions[index];

                        switch (oHomeOptionSelect.code) {
                          case 'OPT0001':
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InterventionListScreen(),
                              ),
                            );
                            break;

                          default:
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('INTRANET PAIS'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          InkWell(
            child: Text("MI PERFIL"),
            onTap: () {
              showCustomPopupMenu(context, _scaffoldKey);
              // Text("fd");
            },
          ),
        ],
      ),
      drawer: NavigationDrawerWidget(), // Your Drawer widget here
      body: listPages[currenIndex],
    );
  }

  void showCustomPopupMenu(BuildContext context, GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final double menuWidth =
        200; // You should set this to the width of your menu

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width -
            offset.dx -
            menuWidth, // Adjusted left
        offset.dy, // top
        MediaQuery.of(context).size.width - offset.dx, // right
        offset.dy + renderBox.size.height, // bottom
      ),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'profile',
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              Text('Profile'),
            ],
          ),
        ),
        /*    const PopupMenuItem<String>(
          value: 'CambiarContrasenia',
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              Text('Cambiar Contraseña'),
            ],
          ),
        ), */
        PopupMenuItem<String>(
          value: 'cerrarSesion',
          child: Row(
            children: <Widget>[
              Icon(Icons.display_settings_sharp),
              Text('Cerrar Sesion'),
            ],
          ),
        ),
      ],
    ).then((value) {
      // Handle the selection
      if (value != null) {
        // Do something based on the value selected
      }
    });
  }

/*  void showCustomPopupMenu(BuildContext context) {
    // Use the `showMenu` function to show the popup menu
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
            overlay.localToGlobal(Offset
                .zero), // This is the starting point of the menu (top left)
            overlay.localToGlobal(Offset
                .zero) // This is the ending point of the menu (bottom right)
            ),
        Offset.zero & overlay.size, // Smaller rect, the touch area
      ),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'profile',
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              Text('Profile'),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'CambiarContrasenia',
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              Text('Cambiar Contraseña'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'cerrarSesion',
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              Text('Cerrar Sesion'),
            ],
          ),
        ),
        // Add other items here
      ],
    ).then((value) {
      // Handle the selection
      if (value != null) {
        // Do something based on the value selected
      }
    });
  } */
}

class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType
          .transparency, // Use transparency to keep the existing design
      child: PopupMenuButton<String>(
        onSelected: (String result) {
          // Handle the menu item selected here
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              children: <Widget>[
                Icon(Icons.account_circle),
                Text('Profile'),
              ],
            ),
          ),
          // ... add other menu items here
        ],
      ),
    );
  }
}

class NavigationDrawerWidget extends StatelessWidget {
  // Build your navigation drawer widget here
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text('INTRANET PAIS')
        ],
      ),
      // Populate your drawer with items here
    );
  }
}

// Your SignInScreen code remains the same...
