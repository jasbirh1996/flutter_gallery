
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../utils/widgets/image_card.dart';
import 'main_screen_controller.dart';


class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Center(child: Text("Gallery Images"),),
        ),
        body: Obx(() {
          if (controller.isLoading.value && controller.images.isEmpty) {
            // Loading indicator when no images are loaded yet
            return const Center(child: CircularProgressIndicator());
          } else if (controller.images.isEmpty && !controller.isLoading.value) {
            // Display error or no data message if no images are fetched
            return const Center(child: Text('No images available.'));
          }

          // Image grid with dynamic columns based on screen width
          return GridView.builder(
            controller: controller.scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (MediaQuery.of(context).size.width / 150).floor(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              final image = controller.images[index];
              return ImageCard(image: image); // Custom widget for each image card
            },
          );
        }),
      ),
    );
  }
}










