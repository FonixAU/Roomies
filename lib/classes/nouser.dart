import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:go_router/go_router.dart';
import '../app_state.dart';

class UserSignedInRouter extends StatelessWidget {
  const UserSignedInRouter({
    Key? key,
    required this.routedBody,
  }) : super(key: key);

  final Widget routedBody;

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, _) {
        if (!appState.loggedIn) {
          // Navigate to sign-in page if not logged in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Navigate after the build is complete to avoid build errors
            context.go('/sign-in');
          });
        }

        // Return the routed body wrapped with a navigator
        return Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (context) => routedBody);
          },
        );
      },
    );
  }
}
