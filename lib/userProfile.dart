

class UserProfile  {

  final String uid;
  final String username;
  final String email;
  final String phone;

  UserProfile({required this.uid, required this.username, required this.email,required this.phone});

  factory UserProfile.fromRTDB(Map<String, dynamic> data){
    return UserProfile(
        uid:data['uid'],
        username: data['username'],
        email: data ['email'],
        phone: data['phone']);
  }


  String getuid(){
    return uid;
  }

  String getUsername(){
    return username;
  }

  String getEmail(){
    return email;
  }

  String getPhone(){
    return phone;
  }



}
