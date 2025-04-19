import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';

class ThemeSwitchButtonWidget extends StatefulWidget {
  final bool fromWebBar;
  const ThemeSwitchButtonWidget({super.key, this.fromWebBar = true});

  @override
  State<ThemeSwitchButtonWidget> createState() => _ThemeSwitchButtonWidgetState();
}

class _ThemeSwitchButtonWidgetState extends State<ThemeSwitchButtonWidget> with SingleTickerProviderStateMixin{


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return InkWell(
            hoverColor: Colors.transparent,
            onTap: ()=> themeProvider.toggleTheme(),
            child: AnimatedContainer(
              curve: Curves.easeInOutCirc,
              duration: const Duration(seconds: 1),
              child: Icon(
                themeProvider.darkTheme ? Icons.dark_mode : Icons.light_mode,
                size: widget.fromWebBar ? 20 : 35,
                color: widget.fromWebBar ? null : Colors.white,
              ),
            ),
          );
        }
    );
  }
}
