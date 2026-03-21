import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text("Sharon es loca????"),
      action: SnackBarAction(label: "Si?", onPressed: () {}),
      duration: const Duration(seconds: 2),
      persist: false,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Are you sure?"),
        content: const Text("Ad proident labore officia ea culpa in aliquip dolor minim laboris. Nisi pariatur veniam ullamco nisi anim cupidatat velit qui laboris fugiat nostrud dolore ad. Dolor sint dolor nostrud pariatur et est aute aute pariatur fugiat elit in Lorem."),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text("Cancelar")),
          
          FilledButton(onPressed: ()=> context.pop(), child: Text("Aceptar")),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars and Dialogs')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                
                showAboutDialog(context: context, 
                  children: [
                    const Text("Ullamco ea est amet Lorem ullamco adipisicing occaecat ea ex sunt. Ipsum laborum sint adipisicing sint duis et. Aliquip anim eu ad officia magna mollit pariatur aute duis ipsum aliqua. Eiusmod mollit ut laborum enim pariatur occaecat. Voluptate do elit aute ad elit.")
                  ]
                
                );
              },
              child: const Text("Show licenses"),
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Show dialog"),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text("Mostrar snackbar"),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
