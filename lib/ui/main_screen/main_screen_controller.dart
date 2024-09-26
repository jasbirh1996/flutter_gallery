import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/modal/image_modal.dart';
import '../../data/remote/api_service.dart';

class MainScreenController extends GetxController {
  var images = <ImageModel>[].obs; // Observing the list of images
  var isLoading = false.obs; // Observing loading state
  var page = 1; // Pagination
  final ApiService _apiService = ApiService();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchImages(); // Initial fetch of images
    scrollController.addListener(_scrollListener);
  }

  // Fetches images from the API with pagination.
  void fetchImages() async {
    if (!isLoading.value) {
      isLoading.value = true;
      try {
        final newImages = await _apiService.fetchImages(page);
        if (newImages.isNotEmpty) {
          images.addAll(newImages); // Add new images to the list
          page++; // Increment page for next fetch
        }
      } catch (error) {
        Get.snackbar('Error', 'Failed to load images: $error'); // Show error in UI
      } finally {
        isLoading.value = false; // Stop loading state
      }
    }
  }

  // Listener to detect when user scrolls to the bottom and triggers fetchImages
  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      fetchImages(); // Load more images when reaching the bottom
    }
  }

  @override
  void onClose() {
    scrollController.dispose(); // Dispose controller to prevent memory leaks
    super.onClose();
  }
}
