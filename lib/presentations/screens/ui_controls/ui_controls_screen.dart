import 'package:flutter/material.dart';

class UiControlsScreens extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer mode"),
          subtitle: const Text("Additional controls for developers"),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = value;
          }),
        ),

        ExpansionTile(
          title: Text("Transport vehicle"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = value!;
              }),

              child: Column(
                children: [
                  const RadioListTile(
                    title: Text("By Car"),
                    subtitle: Text("Travel by car"),
                    value: Transportation.car,
                  ),

                  const RadioListTile(
                    title: Text("By Boat"),
                    subtitle: Text("Travel by boat"),
                    value: Transportation.boat,
                  ),

                  const RadioListTile(
                    title: Text("By Plane"),
                    subtitle: Text("Travel by plane"),
                    value: Transportation.plane,
                  ),

                  const RadioListTile(
                    title: Text("By Submarine"),
                    subtitle: Text("Travel by submarine"),
                    value: Transportation.submarine,
                  ),
                ],
              ),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text("Breakfast?"),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = value!;
          })),
        CheckboxListTile(
          title: const Text("Lunch?"),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = value!;
          })),
        CheckboxListTile(
          title: const Text("Dinner?"),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = value!;
          })),
      ],
    );
  }
}
