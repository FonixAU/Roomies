//Useful tools
//These are for modules and cards and so on.
//Also for adaptive stuff
              // SliverCard(
              //   shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(12)),
              //   margin: const EdgeInsets.fromLTRB(40,0,40,40),
              //   elevation: 3,
              //   clipBehavior: Clip.antiAlias,
              //   sliver: 



//If i have to do this in parts:
///When editing this file, remember to edit both the
///Mobile and Desktop navigation bars. CTRL - D might help

//This is the horizontal / mobile navigation bar

// class CardModule extends StatelessWidget {
//   const CardModule({
//     super.key,
//     required this.body,
//     required this.selectedIndex,
//     required this.onDestinationSelected,
//   });
//   final Widget body;
//   final int selectedIndex;
//   final ValueChanged<int> onDestinationSelected;

//This would be the web based cards if necessary and grid functionality doesn't become the norm.

// class ScaffoldWithNavigationRail extends StatelessWidget {
//   const ScaffoldWithNavigationRail({
//     super.key,
//     required this.body,
//     required this.selectedIndex,
//     required this.onDestinationSelected,
//   });
//   final Widget body;
//   final int selectedIndex;
//   final ValueChanged<int> onDestinationSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           NavigationRail(
//             selectedIndex: selectedIndex,
//             onDestinationSelected: onDestinationSelected,
//             labelType: NavigationRailLabelType.all,
//             destinations: const <NavigationRailDestination>[
//           NavigationRailDestination(label: Text('Home'), icon: Icon(Icons.home)),
//           NavigationRailDestination(label: Text('Bills'), icon: Icon(Icons.attach_money_rounded)),
//           NavigationRailDestination(label: Text('Chores'), icon: Icon(Icons.cleaning_services)),
//           NavigationRailDestination(label: Text('Shared'), icon: Icon(Icons.shopping_cart_rounded)),
//           NavigationRailDestination(label: Text('Settings'), icon: Icon(Icons.settings)),

//             ],
//           ),
//           const VerticalDivider(thickness: 1, width: 1),
//           // This is the main content.
//           Expanded(
//             child: body,
//           ),
//         ],
//       ),
//     );
//   }
// }

//This section could choose the card based on the types provided.

// class ScaffoldWithNestedNavigation extends StatelessWidget {
//   const ScaffoldWithNestedNavigation({
//     Key? key,
//     required this.navigationShell,
//   }) : super(
//             key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
//   final StatefulNavigationShell navigationShell;

//   void _goBranch(int index) {
//     navigationShell.goBranch(
//       index,
//       // A common pattern when using bottom navigation bars is to support
//       // navigating to the initial location when tapping the item that is
//       // already active. This example demonstrates how to support this behavior,
//       // using the initialLocation parameter of goBranch.
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       if (constraints.maxWidth < 450) {
//         return CardModule(
//           body: navigationShell,
//           selectedIndex: navigationShell.currentIndex,
//           onDestinationSelected: _goBranch,
//         );
//       } else {
//         return ScaffoldWithNavigationRail(
//           body: navigationShell,
//           selectedIndex: navigationShell.currentIndex,
//           onDestinationSelected: _goBranch,
//         );
//       }
//     });
//   }
// }
//Single Classless LOCAL ONLY Import (Font froget to pass through context)
//Widget _choreCards(BuildContext context, String name , int order,Color color,String frequency, HouseHold myHouse) {
//     return (Card(
//         clipBehavior: Clip.antiAlias,
//         margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
//         elevation: 3,
//         child:
//         Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//                 Container(
//                   width: double.infinity,
//                   padding:const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: color,
//                     borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   )),
//                 child: Text(frequency,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w100)),
//                 ),Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   )
//                 ),  
//                 child:Row(
//                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Text(name,
//                           style:
//                               const TextStyle(fontSize: 20, fontWeight: FontWeight.w100))),
//                       Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Text(occupant_m.getFromOrder(myHouse.occupants, order),
//                           style:
//                               const TextStyle(fontSize: 15, fontWeight: FontWeight.w100)))  
//             ])
//             )
//             ])
//           ));  
// }
