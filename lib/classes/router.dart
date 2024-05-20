import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/house_hold.dart';
import '../pages/repeatable/repeatable_screen.dart';
import '../pages/repeatable/edit_screen.dart';
import '../pages/settings_page.dart';
import '../pages/bills_page.dart';
import '../pages/repeatable/filter_screen.dart';
import '../interfaces/navbar.dart';
import '../pages/home_page.dart';
import '../pages/chores_page.dart';
import '../classes/user.dart';
import '../methods/fetch_data.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import '../classes/house_hold.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorBillsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellBills');
final _shellNavigatorChoresKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellChores');
final _shellNavigatorShopKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellShop');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

const User user = User(surname:"Doe" ,name:"Jane",houseID:1 ,order: 2);
HouseHold house = getHouse();

final goRouter = GoRouter(
  
    initialLocation: '/',
    // * Passing a navigatorKey causes an issue on hot reload:
    // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
    // * However it's still necessary otherwise the navigator pops back to
    // * root on hot reload
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomePage(),
                ),
                routes: [
                  GoRoute(
                    path: 'calendar',
                    builder: (context, state) =>
                        const EditScreen(label: 'Calendar')),
                  GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction(((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: <String, String?>{
                      'email': email,
                    },
                  );
                  context.push(uri.toString());
                })),
                AuthStateChangeAction(((context, state) {
                  final user = switch (state) {
                    SignedIn state => state.user,
                    UserCreated state => state.credential.user,
                    _ => null
                  };
                  if (user == null) {
                    return;
                  }
                  if (state is UserCreated) {
                    user.updateDisplayName(user.email!.split('@')[0]);
                  }
                  if (!user.emailVerified) {
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                        content: Text(
                            'Please check your email to verify your email address'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  context.pushReplacement('/');
                })),
              ],
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                final arguments = state.uri.queryParameters;
                return ForgotPasswordScreen(
                  email: arguments['email'],
                  headerMaxExtent: 200,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return ProfileScreen(
              providers: const [],
              actions: [
                SignedOutAction((context) {
                  context.pushReplacement('/');
                }),
              ],
            );
          },
        ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBillsKey,
            routes: [
              GoRoute(
                path: '/bills',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child:
                      BillsPage(user: user),  
                ),
                routes: [
                  GoRoute(
                    path: 'add',
                    builder: (context, state) =>
                        const EditScreen(label: 'Bills'),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorChoresKey,
            routes: [
              GoRoute(
                path: '/chores',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ChorePage(),
                ),
                routes: [
                  GoRoute(
                    path: 'add',
                    builder: (context, state) =>
                        const EditScreen(label: 'Chores'),
                  ),
                  GoRoute(
                    path: 'filter',
                    builder: (context, state) =>
                        const FilterScreen(label: 'Chores', occupants:[]),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorShopKey,
            routes: [
              // Shopping Cart
              GoRoute(
                path: '/sharedItems',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: RootScreen(
                      label: 'Shared Items',
                      detailsPath: '/sharedItems/details'),
                ),
                routes: [
                  GoRoute(
                    path: 'details',
                    builder: (context, state) =>
                        const EditScreen(label: 'Shared Items'),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              // Shopping Cart
              GoRoute(
                path: '/settings',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsPage()),
              )
            ],
          ),
        ],
      )
    ]);
