import 'package:animagieeui/view/comment/models/post_comment_model.dart';
import 'package:animagieeui/view/comment/services/comment_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  CommentService service = CommentService();
  final RxList<PostCommentModel> _commentList = <PostCommentModel>[].obs;
  RxList<PostCommentModel> get commentList => _commentList;
  RxBool isCommentLoading = true.obs;
  Future getComment({required postId}) async {
    isCommentLoading(true);
    try {
      var data = await service.getComment(postId: postId);
      _commentList.clear();
      if (data != null) {
        _commentList.add(data);
        isCommentLoading(false);
      } else {
        isCommentLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getCommentWithoutLoading({required postId}) async {
    try {
      var data = await service.getComment(postId: postId);
      _commentList.clear();
      if (data != null) {
        _commentList.add(data);
      } else {}
    } catch (e) {
      rethrow;
    }
  }

  TextEditingController comment = TextEditingController();
  RxBool isAddCommentLoading = true.obs;
  Future addComment({required postId}) async {
    isAddCommentLoading(true);
    try {
      var data =
          await service.addComment(postId: postId, comment: comment.text);
      if (data != null) {
        getCommentWithoutLoading(postId: postId);
        isAddCommentLoading(false);
      } else {
        isAddCommentLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
