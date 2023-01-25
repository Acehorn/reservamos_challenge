import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/application/pages/home_page/widgets/advice_field.dart';
import 'package:reservamos_challenge/application/pages/home_page/widgets/button_place.dart';
import 'package:reservamos_challenge/application/pages/home_page/widgets/card_place.dart';
import 'package:reservamos_challenge/application/pages/home_page/widgets/error_message.dart';

import '../../../injection.dart';
import 'widgets/text_place_field.dart';

import 'bloc/home_logic_bloc.dart';

class HomePageWrapperProvider extends StatelessWidget {
  const HomePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeLogicBloc>(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Reservamos", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           const TextPlaceField(),
           const ButtonPlace(),
          Expanded(
              child: Align(
            alignment: Alignment.topCenter,
            child: BlocBuilder<HomeLogicBloc, HomeLogicState>(
              builder: (context, state) {
                if (state is HomeLogicInitial) {
                  return const AdviceField(
                      advice: "EXAMPLE ADVICE - YOUR DAY WILL BE GOOD");
                } else if (state is HomeLStateLoading) {
                  return CircularProgressIndicator(
                    color: themeData.colorScheme.secondary,
                  );
                } else if (state is HomeLStateLoaded) {
                  return  CardPlace(
                      placeLocation: state.advice ?? "Not found", temperature: state.temperature ?? "Not found");
                } else if (state is HomeLStateError) {
                  return ErrorMessage(message: state.message);
                }

                return const SizedBox();
              },
            ),
          ))
        ],
      ),
    );
  }


}
