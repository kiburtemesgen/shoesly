import 'package:flutter/material.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.onRetry});
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: size.height * 0.3,
                width: size.width * 0.8,
                child: Column(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.redAccent,
                          child: const Center(
                              child: Icon(
                            Icons.warning,
                            size: 60,
                            color: Colors.white,
                          )),
                        )),
                    Flexible(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                customText(
                                    text: 'oops!',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                                const SizedBox(
                                  height: 10,
                                ),
                                customText(
                                    text:
                                        'Something went wrong. Please try again'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    width: 85,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.redAccent,
                                    ),
                                    child: TextButton(
                                        onPressed: onRetry,
                                        child: customText(
                                            text: 'Try again',
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white)))
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
