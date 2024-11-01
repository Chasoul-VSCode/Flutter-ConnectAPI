String get apiUrl => Config.isLocal ? Config.localApiUrl : Config.remoteApiUrl;
// taro disetiap bagian pages untuk memanggil variable



    try {
      final response = await http.get(
        Uri.parse('$apiUrl/api/users/${widget.userId}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        setState(() {
          _forUserProfileImage = userData['images_profile'];
        });
      }
    } catch (e) {
      print('Error fetching for_user profile: $e');
    }

    // taruh bagian ini disetiap konfigurasi kedalam api, dan sesuaikan dengan api yang lu punya