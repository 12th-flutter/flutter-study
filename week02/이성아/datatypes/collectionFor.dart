void collectionFor() {
  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var freind in oldFriends) "💖 $freind",
  ];
  print(newFriends);
}