class CategoryModel{
     String id;
     String cname;
     String cavatar;

  CategoryModel(this.id,this.cname,this.cavatar);


    static List<CategoryModel> getCategory(){
      return [
           CategoryModel('','',''),
           CategoryModel('','',''),
           CategoryModel('','',''),
           CategoryModel('','',''),
      ];
    }
}

