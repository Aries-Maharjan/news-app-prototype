import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news_model.dart';


class NewsDetails extends StatelessWidget {
  final Articles article;


  const NewsDetails({super.key, required this.article});


  // Function to launch URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News Details',
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            FadeInDown(
              duration: const Duration(milliseconds: 600),
              child: article.urlToImage != null
                  ? CachedNetworkImage(
                imageUrl: article.urlToImage!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              )
                  : Container(
                height: 250,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),


            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  FadeInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Text(
                      article.title ?? 'No Title',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),


                  // Author and Date
                  FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '👨 Author: ${article.author ?? 'Unknown'}',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '📅 ${article.publishedAt?.split('T')[0] ?? 'N/A'}',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),


                  // Description
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    child: Text(
                      article.description ?? 'No Description',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),


                  // Content
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      article.content ?? 'No Content Available',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),


                  // Read Full Article Button
                  FadeInUp(
                    duration: const Duration(milliseconds: 1100),
                    child: ElevatedButton(
                      onPressed: article.url != null
                          ? () => _launchUrl(article.url!)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Read Full Article',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
