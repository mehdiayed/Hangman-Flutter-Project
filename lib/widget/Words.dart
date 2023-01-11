class Words {
  String? word = '';

  // constructor
  Words( 
      {
       this.word,
      
      }
   );
  //method that assign values to respective datatype vairables
  Words.fromJson(Map<String,dynamic> json)
  {
    word = json['word'];
    
  }
}
