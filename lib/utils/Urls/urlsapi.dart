import 'package:animagieeui/view/homepage/model/suggestedFriendListModel.dart';

class Urls {
  static const baseUrl = 'http://192.168.1.32:9000/';
  static const login = '${baseUrl}api/user/registersandlogin';
  static const communities = '${baseUrl}api/community/communitydetails';
  static const updatecommunities = '${baseUrl}api/community/mycommunityupdate';
  static const profile = '${baseUrl}api/user/registerDeatils';
  static const editprofile = '${baseUrl}api/user/editprofile';
  // static const mysubscription = '${baseUrl}api/community/myselected';
  static const bgimage = '${baseUrl}api/user/createbackgroundprofile';
  static const clubcreationlist = "${baseUrl}api/club/joinedClublist";
  static const clubcreation = '${baseUrl}api/club/clubcreation';
  static const clubiconcreation = '${baseUrl}api/club/iconcreation';
  // static const userpostlist = '${baseUrl}api/post/myhome';
  static const userpostlist = '${baseUrl}api/post/myhome';
  static const homesearch = '${baseUrl}api/post/homeUserOrpostsearch';
  static const userpostprofile = '${baseUrl}api/post/userPostProfile';
  static const userpostprofileget = '${baseUrl}api/post/postwithlike';
  static const communitiUserpost = '${baseUrl}api/club/joinedClublistother';
  static const SuggestedFriendList = '${baseUrl}api/user/suggestionfriendlist';
  static const homecreatepost = '${baseUrl}api/post/postcreation';
}
