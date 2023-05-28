import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine_app/src/pages/slide_bar/bloc/slide_bar_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:routine_app/src/themes/light_color.dart';

class SlideBarMenuView extends StatelessWidget {
  const SlideBarMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SlideBarBloc(),
      child: SidebarMenu(),
    );
  }
}

class SidebarMenu extends StatefulWidget {
  SidebarMenu({Key? key}) : super(key: key);

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  int? count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext? mainContext;
    return BlocConsumer<SlideBarBloc, SlideBarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      listenWhen: ((previous, current) => previous != current),
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Admin'),
                accountEmail: Text(''),
                currentAccountPicture: CircleAvatar(
                  child: Image.asset(
                    'assets/user.png',
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LightColor.gradientColor,
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  // leading: const Icon(Icons.person),
                  title: Text('User'),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  // leading: const Icon(Icons.group),
                  title: Text('Group'),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  // leading: const Icon(Icons.group),
                  title: Text('Permission'),
                  onTap: () {},
                ),
              ),
              // const Divider(
              //   thickness: 0.5,
              // ),
            ],
          ),
        );
      },
    );
  }
}

// void _showAlertDialog(BuildContext context, BuildContext mainContext) {
//   // show the dialog
//   print("a");
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(AppLocalizations.of(mainContext).notification.toString()),
//         content: Text(AppLocalizations.of(mainContext).menu_008.toString()),
//         actions: [
//           TextButton(
//             child: Text(AppLocalizations.of(mainContext).no.toString()),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           TextButton(
//             child: Text(AppLocalizations.of(mainContext).yes.toString()),
//             onPressed: () {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 mainContext.go('/');

//                 Navigator.pop(context);
//                 Phoenix.rebirth(context);
//               });
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// class Avatar extends StatelessWidget {
//   String? imgPath;
//   // final ImageProvider<dynamic> image;
//   final Color borderColor;
//   final Color? backgroundColor;
//   final double radius;
//   final double borderWidth;

//   Avatar(
//       {Key? key,
//       // required this.image,
//       this.imgPath,
//       this.borderColor = LightColor.blueColor,
//       this.backgroundColor,
//       this.radius = 30,
//       this.borderWidth = 5})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print('${Network.url}$imgPath');
//     return CircleAvatar(
//       radius: radius + borderWidth,
//       backgroundColor: borderColor,
//       child: RoyalUser.userInfo?.urlImage == null
//           ? CircleAvatar(
//               radius: radius,
//               backgroundColor: Colors.white,
//               child: CircleAvatar(
//                 radius: radius - borderWidth,
//                 child: Text(
//                   RoyalUser.userInfo?.fullName?.substring(0, 1).toUpperCase() ??
//                       '',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                 ),
//               ))
//           : CircleAvatar(
//               radius: radius,
//               backgroundColor: Colors.blue.shade900,
//               child: CachedNetworkImage(
//                 imageBuilder: (context, imageProvider) => Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 imageUrl: ('${Network.url}$imgPath'),
//                 placeholder: (context, url) => CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               ),
//             ),
//     );
//   }
// }
