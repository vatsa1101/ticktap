import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticktap/application/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "assets/images/icon-fit.png",
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Flexible(
              child: AutoSizeText(
                "TickTap",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
                minFontSize: 1,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeInitialState()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => context
                              .read<HomeBloc>()
                              .add(GenerateButtonClickedEvent()),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const AutoSizeText(
                            "Generate",
                            minFontSize: 1,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
