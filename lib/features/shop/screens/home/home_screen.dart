import 'package:flutter/material.dart';
import 'widgets/home_body.dart';
import 'widgets/home_header_container.dart';

class HomeScreen extends StatelessWidget {
            

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
       
    return const Scaffold(
    
      body:SingleChildScrollView(
        child: Column(
          children: [
            // * blue container header with curved edges
            HomeHeader(),

            // * -- Home body
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
