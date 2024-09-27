import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for state management
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import smooth_page_indicator package


class RouteController extends GetxController {
  // Observable to track the current route index
  var currentRouteIndex = 0.obs;
}

class OutputActivity extends StatelessWidget {
  final RouteController routeController = Get.put(RouteController());

  final List<List<String>> allRoutes; // All routes
  final List<String> bestRoute; // Best route
  final String travelTime; // Travel time
  final String ticketPrice; // Ticket price
  final String numberOfStations; // Number of stations

  // Constructor to receive data
  OutputActivity({
    required this.allRoutes,
    required this.bestRoute,
    required this.travelTime,
    required this.ticketPrice,
    required this.numberOfStations,
  });

  @override
  Widget build(BuildContext context) {
        final PageController pageController = PageController();

    return Scaffold(
      backgroundColor: const Color(0xFF333333), // Equivalent to #333
      body: SafeArea(
        child: Column(
          children: [
            // Back Arrow and Header Direction
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Arrow
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Get.back(); // Back navigation using Get
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Box shadow color equivalent
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.arrow_back, color: Color(0xFF333333)),
                    ),
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 24.0),
        
            // Time, Stations, Price Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoBox('Time', travelTime),
                  _buildInfoBox('Stations', numberOfStations),
                  _buildInfoBox('Price', ticketPrice),
                ],
              ),
            ),
        
            SizedBox(height: 16.0),
        
            // Displaying the best route
           // _buildRouteCard(bestRoute),
        
           // SizedBox(height: 16.0),
        
            // Expanded to allow scrolling for the page view
            Expanded(
              child: PageView.builder(
                   controller: pageController,
                itemCount: allRoutes.length,
                itemBuilder: (context, index) {
                  // Compare list content rather than the list object itself
                 // if (allRoutes[index].join(',') != bestRoute.join(',')) {
                    return _buildRouteCard(allRoutes[index]);
                  //}
                  //return SizedBox.shrink(); // Skip the best route
                },
              ),
              
            ),
            SizedBox(height: 16.0),
            SmoothPageIndicator(
              controller: pageController,
              count: allRoutes.length,
              effect: WormEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.white,
              ),
              ),
          ],
        ),
      ),
    );
  }

  // A helper method to build each info box (Time, Stations, Price)
  Widget _buildInfoBox(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // A helper method to build a route card for the current route
  Widget _buildRouteCard(List<String> route) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: route.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    route[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}