import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticktap/application/home/home_bloc.dart';
import 'package:ticktap/data/localDb/local_db.dart';
import 'package:ticktap/presentation/home/widgets/custom_appbar.dart';
import 'package:ticktap/presentation/home/widgets/random_number.dart';
import 'package:ticktap/presentation/home/widgets/result_widget.dart';
import 'package:ticktap/presentation/home/widgets/successful_taps.dart';
import 'package:ticktap/presentation/home/widgets/time_widget.dart';
import 'package:ticktap/presentation/utils/size_helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? number;
  bool success = false;
  bool generatingNumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(),
      body: SafeArea(
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(HomeInitialState()),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is GeneratingRandomNumberState) {
                generatingNumber = true;
              }
              if (state is RandomNumberGeneratedState) {
                number = state.number;
                success = state.success;
                generatingNumber = false;
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: SuccessfulTaps(count: LocalDb.successfulTaps),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: context.width * 0.6,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 8,
                          color: Colors.blue.shade500,
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TimeWidget(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ResultWidget(
                      success: number != null ? success : null,
                      key: ValueKey(number),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: generatingNumber
                                ? () {}
                                : () => context
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
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: RandomNumber(
                            key: ValueKey(number),
                            number: number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
