import 'package:shared_preferences/shared_preferences.dart';

class CommentManager {
  // Key for storing comments
  static const String commentsKey = "comments_list";

  static Future<void> addComment(String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? comments = prefs.getStringList(commentsKey) ?? [];
    comments.add(comment);
    await prefs.setStringList(commentsKey, comments);
  }

  static Future<List<String>> getComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(commentsKey) ?? [];
  }

  // Method to update a comment
  static Future<void> updateComment(int index, String updatedComment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? comments = prefs.getStringList(commentsKey) ?? [];
    if (index >= 0 && index < comments.length) {
      comments[index] = updatedComment;
      await prefs.setStringList(commentsKey, comments);
    }
  }

  // Method to delete a comment
  static Future<void> deleteComment(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? comments = prefs.getStringList(commentsKey) ?? [];
    if (index >= 0 && index < comments.length) {
      comments.removeAt(index);
      await prefs.setStringList(commentsKey, comments);
    }
  }
}
