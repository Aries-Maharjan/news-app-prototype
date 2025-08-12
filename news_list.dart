import 'package:flutter/material.dart';
import '../ctrl/news_ctrl.dart';
import '../model/news_model.dart';
import 'news_card.dart';

// Stateful widget to display a list of news articles
class NewsList extends StatefulWidget {
  // Constructor with optional key parameter
  const NewsList({super.key});


  // Creates the state for this widget
  @override
  State<NewsList> createState() => _NewsListState();
}


// State class for NewsList widget
class _NewsListState extends State<NewsList> {
  // Initializing the news controller to manage API calls and data
  final NewsCtrl _controller = NewsCtrl();


  // Build method to construct the UI
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic app structure with AppBar and body
    return Scaffold(
      // AppBar with a title for the news screen
      appBar: AppBar(title: const Text("NCE NEWS")),


      // Body using FutureBuilder to handle asynchronous data loading
      body: FutureBuilder<NewsModel?>(
        // Fetching news data using the controller's fetchNews method
        future: _controller.fetchNews(),


        // Builder function to handle different states of the Future
        builder: (context, snapshot) {
          // Show loading indicator while data is being fetched
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());


            // Handle error cases or null data
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Failed to load news'));


            // Handle case where no articles are available
          } else if (snapshot.data!.articles == null || snapshot.data!.articles!.isEmpty) {
            return const Center(child: Text('No news available'));
          }


          // Extract articles from the snapshot data
          final articles = snapshot.data!.articles!;


          // Build a scrollable list of news articles
          return ListView.builder(
            // Number of items in the list
            itemCount: articles.length,
            // Builder function to create each news card
            itemBuilder: (context, index) {
              // Return a NewsCard widget for each article
              return NewsCard(article: articles[index]);
            },
          );
        },
      ),
    );
  }
}
