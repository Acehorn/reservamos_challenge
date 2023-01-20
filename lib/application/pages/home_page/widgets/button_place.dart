import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/application/pages/home_page/bloc/home_logic_bloc.dart';

class ButtonPlace extends StatelessWidget {
  const ButtonPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 120, right: 120, bottom: 30),
      child: InkResponse(
        onTap: () {
     BlocProvider.of<HomeLogicBloc>(context).add(HomeRequestedEvent());
      }, 
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeData.colorScheme.secondary,
          ),
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child:  Text("Buscar", style: themeData.textTheme.titleLarge),
          )))),
    );
  }
}