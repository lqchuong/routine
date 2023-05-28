import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine_app/src/pages/home/home_page.dart';
import 'package:routine_app/src/pages/main/bloc/bottom_bar_bloc.dart';
import 'package:routine_app/src/pages/shopping_cart/shopping_cart_page.dart';
import 'package:routine_app/src/themes/light_color.dart';

class TabsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomBarBloc(),
      child: TabsScreen(),
    );
  }
}

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    context.read<BottomBarBloc>().add(BottomBarInitialEvent(0));
    super.initState();
  }

  var selectPageIndex = 0;
  final List<Map<String, dynamic>> pageDetail = [
    {'pageName': MyHomePage(), 'title': ''},
    {'pageName': MyHomePage(), 'title': ''},
    {'pageName': ShoppingCartPage(), 'title': ''},
    {'pageName': ShoppingCartPage(), 'title': ''},
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarBloc, BottomBarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is BottomBarInitialSuccessful) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                pageDetail[state.selectIndex]['pageName'],
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //       image: AssetImage(
                    //         'assets/images/backgroundBottom.png',
                    //       ),
                    //       fit: BoxFit.cover),
                    //   borderRadius: BorderRadius.only(
                    //       topRight: Radius.circular(20),
                    //       topLeft: Radius.circular(20)),
                    // ),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: LightColor.disableColor2,
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: BottomNavigationBar(
                            // backgroundColor: Colors.transparent,

                            type: BottomNavigationBarType.fixed,
                            selectedItemColor:
                                LightColor.primaryBackgroundButton,
                            unselectedItemColor: LightColor.disableColor2,
                            selectedLabelStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                            unselectedLabelStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                            selectedIconTheme: const IconThemeData(size: 28),
                            unselectedIconTheme: const IconThemeData(size: 20),
                            currentIndex: state.selectIndex,
                            onTap: (index) {
                              print('a');
                              context
                                  .read<BottomBarBloc>()
                                  .add(OnItemTappedEvent(index));
                            },
                            elevation: 0.0,
                            items: [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home), label: 'Home'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.medical_information),
                                  label: 'Search'),
                              // BottomNavigationBarItem(
                              //     icon: Icon(Icons.access_time), label: 'Theo dõi'),
                              // BottomNavigationBarItem(
                              //     icon: Icon(Icons.settings), label: 'Cài đặt'),

                              BottomNavigationBarItem(
                                  icon: Icon(Icons.manage_accounts_outlined),
                                  label: 'Shopping'),

                              BottomNavigationBarItem(
                                  icon: Icon(Icons.confirmation_num),
                                  label: 'Favourite'),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
