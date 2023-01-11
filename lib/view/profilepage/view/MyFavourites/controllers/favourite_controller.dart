import 'package:animagieeui/view/profilepage/view/MyFavourites/models/my_favourites_model.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/services/favourite_service.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  // service
  FavouriteService service = FavouriteService();

  /* FAVOURITE LIST */
  final RxList<MyFavouritesModel> _myFavouriteList = <MyFavouritesModel>[].obs;
  RxList<MyFavouritesModel> get myFavouriteList => _myFavouriteList;
  RxList<bool> savedList = List<bool>.empty(growable: true).obs;
  RxList<bool> likeList = List<bool>.empty(growable: true).obs;

  RxBool isMyFavouriteLoading = true.obs;
  Future getFavourite() async {
    isMyFavouriteLoading(true);
    try {
      _myFavouriteList.clear();
      savedList.clear();
      likeList.clear();
      var data = await service.getFavourite();
      if (data != null) {
        _myFavouriteList.add(data);
        for (var list in data.data!) {
          savedList.add(list.saved!);
          likeList.add(list.liked!);
        }
        isMyFavouriteLoading(false);
      } else {
        isMyFavouriteLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  /*ADD TO FAVOURITE */

  Future addToFavourite({
    required postId,
  }) async {
    try {
      var data = await service.addToFavourite(postId: postId);
      if (data != null) {}
    } catch (e) {
      rethrow;
    }
  }

  /*LIKE UNLIKE */

  Future likeUnLike({required postId}) async {
    try {
      var data = await service.likeUnlike(postId: postId);
      if (data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
  /*BLOCK UNBLOCK */

  Future<bool> blockUnblock({required userId}) async {
    try {
      var data = await service.blockUser(userId: userId);
      if (data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
