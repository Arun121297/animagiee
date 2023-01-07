class Urls {
  static const baseUrl = 'http://192.168.1.32:9000/';
  static const login = '${baseUrl}api/user/registersandlogin';
  static const communities = '${baseUrl}api/community/communitydetails';
  static const updatecommunities = '${baseUrl}api/community/mycommunityupdate';
  static const profile = '${baseUrl}api/user/registerDeatils';
  static const editprofile = '${baseUrl}api/user/editprofile';
  static const communityprofile = '${baseUrl}api/club/singleclubProfile';
  static const communitypostlist = '${baseUrl}api/post/clubbasedpostlist';
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
  static const memberList = '${baseUrl}api/club/clubMembers';
  // static const memberFollow = '${baseUrl}api/follow/ani_followrequest';
  static const SuggestedFriendList = '${baseUrl}api/user/suggestionfriendlist';
  static const homecreatepost = '${baseUrl}api/post/postcreation';

// POST
  static const createPost = "${baseUrl}api/post/postcreation";
  // My Frineds
  static const myFrineds = "${baseUrl}api/user/myfriends";
  static const joinedClub = "${baseUrl}api/club/joinedClublist";
  /* Favourite */
  // Favourite List
  static const favouriteList = '${baseUrl}api/post/myfavourites';
  static const addFavourite = '${baseUrl}api/post/saveandunsavepost';

  // block unblock
  static const blockUnblock = '${baseUrl}api/user/blockunblock';
  // like unlike
  static const likeUnlike = '${baseUrl}api/post/postlike';
  static const followrequest = '${baseUrl}api/follow/ani_followrequest';
  static const followgetrequest = '${baseUrl}api/follow/listFriendrequest';
  static const confirmfollowrequest = '${baseUrl}api/follow/acceptRequest';
  static const deletefollowrequest = '${baseUrl}api/follow/ignoreRequest';
  static const myfollower = '${baseUrl}api/follow/myFollowers';
  static const myfolloweruser = '${baseUrl}api/follow/myFollowingusers';
  // user followers
  static const otherUserFollowers = '${baseUrl}api/follow/othersfollowerSearch';
  // user following
  static const otherUserFollowing =
      '${baseUrl}api/follow/othersfollowingSearch';
  static const removefollowers = '${baseUrl}api/follow/unfollowfollowers';
  static const likes = '${baseUrl}api/post/postlike';
  static const singlepost = '${baseUrl}api/post/singlepost';

  ///clubedit
  static const editbgclub = '${baseUrl}api/club/editClubBackGroundProfile';
  static const editclub = '${baseUrl}api/club/editclubprofile';
}
