class Hadeth {
  String title;
  String? content;
  int id;

  Hadeth({required this.title,required this.content,required this.id});

  @override
  String toString() {
    return "Id: $id \nTitle: $title \nContent: $content";
  }
}