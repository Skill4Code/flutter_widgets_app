import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentations/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;  //ref.watch(isDarkmodeProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor; //ref.watch(selectedColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: () {
              // ref.read(isDarkmodeProvider.notifier)
              // .update((isDarkMode) => !isDarkMode);
              ref.read(themeNotifierProvider.notifier)
              .toggleDarkmode();
            },
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return RadioGroup(
          groupValue: selectedColor,
          onChanged: (value) { 
            // todo: notificar el cambio
            ref.read(themeNotifierProvider.notifier)
            .changeColorIndex(value as int);
           }, 
          child: ListView.builder(
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final Color color = colors[index];
              

              return RadioListTile(
                title: Text('Color $index', style: TextStyle( color: color),),
                subtitle: Text('${color.toARGB32()}'),
                activeColor: color,
                value: index,
                
              );
            },
          
          ),
       
    );
  }
}
