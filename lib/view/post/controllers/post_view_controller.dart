import 'package:animagieeui/view/post/services/post_view_service.dart';
import 'package:get/get.dart';

class PostViewConroller extends GetxController {
  PostViewService service = PostViewService();
  Future postView({required postId}) async {
    try {
      var data = await service.postView(postId: postId);
      if (data != null) {}
    } catch (e) {
      rethrow;
    }
  }
}
