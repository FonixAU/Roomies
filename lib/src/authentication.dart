// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right:8),
          child: IconButton(
              onPressed: () {
                !loggedIn ? context.push('/sign-in') : signOut();
              },
              icon:!loggedIn ? const Icon(Icons.login_rounded) : const Icon(Icons.logout_rounded),
        )),
         Visibility(
            visible: loggedIn,
            child: Padding(
              padding: const EdgeInsets.only(right:8),
              child: IconButton(
                  onPressed: () {
                    context.push('/profile');
                  },
              icon:const Icon(Icons.person),
              )))
      ],
    );
  }
}
class AuthRedir extends StatelessWidget {
  const AuthRedir({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
          padding: const EdgeInsets.only(right:8),
          child: TextButton(
              onPressed: () {
                context.push('/sign-in');
              },
              child: const Text("Click Here To Sign-In"),
        )),
    );
  }
}