import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentations/screens/cards/cards_screen.dart';
//import 'package:widgets_app/config/presentations/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {

  
  
  const _HomeView();
    
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {  
        final menuItem = appMenuItems[index];

        
        return _CustomListTile(menuItem: menuItem);
        

      }, 
      );
    
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({    
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;


    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: () {
        
        // Using the Navigator
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        
        // Using Named Routes
        //Navigator.pushNamed(context, menuItem.link);

        //context.push(menuItem.link);

        context.pushNamed(CardsScreen.name);


      },
    );
  }
}