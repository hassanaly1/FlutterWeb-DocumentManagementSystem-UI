import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/archieve/archeive_screen.dart';
import 'package:document_management_web/views/completed/completed_screen.dart';
import 'package:document_management_web/views/compose/compose_screen.dart';
import 'package:document_management_web/views/dashboard/dashboard_screen.dart';
import 'package:document_management_web/views/recieved/recieved_screen.dart';
import 'package:document_management_web/views/settings/settings_screen.dart';
import 'package:document_management_web/views/templates/templates_screen.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  //final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // bool isMenuTapped = false;
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.primaryColor,
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        title: Image.asset(
          'assets/images/app-logo.png',
          height: 220,
        ),
        actions: [
          Container(
            width: context.width * 0.75,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          const Icon(Icons.notifications, color: Colors.white),
          const SizedBox(width: 15.0),
          const Icon(Icons.account_circle_rounded, color: Colors.white),
          const SizedBox(width: 15.0),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            collapseWidth: 100,
            controller: sideMenu,
            style: SideMenuStyle(
              openSideMenuWidth: 210,
              itemBorderRadius: BorderRadius.circular(12.0),
              toggleColor: Colors.white,
              itemOuterPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              compactSideMenuWidth: 70,
              backgroundColor: Colors.transparent,
              itemInnerSpacing: 10.0,
              displayMode: SideMenuDisplayMode.compact,
              showTooltip: true,
              iconSize: 26,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              )),
              hoverColor: Colors.white.withOpacity(0.1),
              selectedHoverColor: AppAssets.primaryColor,
              selectedColor: AppAssets.primaryColor,
              unselectedIconColor: Colors.white70,
              selectedTitleTextStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              unselectedTitleTextStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
              selectedIconColor: Colors.white,
            ),
            showToggle: true,
            items: [
              SideMenuItem(
                title: 'Dashboard',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                // iconWidget: Image.asset('assets/images/menu.png', height: 25),
                icon: const Icon(Icons.home_filled),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Compose',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.description),
              ),
              SideMenuItem(
                title: 'Recieved',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.file_copy_rounded),
                trailing: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 3),
                      child: Text(
                        'New',
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                      ),
                    )),
              ),
              SideMenuItem(
                title: 'Completed',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.download_done_outlined),
              ),
              SideMenuItem(
                title: 'Templates',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.edit_document),
              ),
              SideMenuItem(
                title: 'Archives',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.bookmark_outlined),
              ),
              SideMenuItem(
                title: 'Settings',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.settings),
              ),
              SideMenuItem(
                title: 'Logout',
                onTap: (index, _) {},
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                const DashboardScreen(),
                const ComposeScreen(),
                const RecievedScreen(),
                const CompletedScreen(),
                TemplateScreen(),
                const ArcheiveScreen(),
                const SettingScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
