// ignore_for_file: sort_child_properties_last, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:front/ui/common/app_colors.dart';
import 'package:front/ui/views/auth_page/auth_view.dart';
import '../../common/app_constants.dart';
import '../../common/shered_styles.dart';
import '../../common/ui_helpers.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    void _toauth() {
      final navigator = Navigator.of(context);
      navigator.push(MaterialPageRoute<void>(builder: (context) => AuthView()));
    }

    return Scaffold(
        backgroundColor: kcBackgroundColor,
        // Outside Row
        body: Center(
          child: SizedBox(
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Left side of screen
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Academy Icon
                    Text(
                      'Mushu`s Academy',
                      style: ktsBodyTitle.copyWith(fontWeight: FontWeight.w800),
                    ),

                    const Spacer(
                      flex: 2,
                    ),

                    // Title
                    GradientText(
                      'LEARN\nCHINESE',
                      style: ktsTitleText,
                      colors: const [
                        Color.fromARGB(127, 44, 233, 76),
                        Color.fromARGB(195, 38, 165, 197)
                      ],
                    ),
                    Text(
                      'ON THE WEB',
                      style: ktsTitleText,
                    ),

                    // Subtitle
                    Row(
                      children: [
                        Text(
                          'Discover new horizons with us.',
                          style: ktsBodyLarge.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          ' Sign up to start your learning!',
                          style: ktsBodyLarge.copyWith(
                              fontWeight: FontWeight.w600),
                          colors: const [
                            Color.fromARGB(127, 44, 233, 76),
                            Color.fromARGB(195, 38, 165, 197)
                          ],
                        )
                      ],
                    ),

                    verticalSpaceMedium,

                    // Arrow
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child:
                          SvgPicture.asset('assets/images/sign-up-arrow.svg'),
                    ),

                    verticalSpaceSmall,

                    TextButton(
                      onPressed: (_toauth),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 90,
                          vertical: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Registration',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ),

                    const Spacer(flex: 3),
                  ],
                ),
                // Right side of screen
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/home_page.jpg',
                    width: kdDesktopMaxContentWidth * 0.4,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ));
    ;
  }
}
