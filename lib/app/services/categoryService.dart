class CategoryService {
  static const categoryList = [
    {
      "code": "001",
      "categoryNameFR": "catégorie 001",
      "categoryNameEN": "category 001",
      "categoryNameAR": "الصنف 001",
      "children": [
        {
          "code": "001001",
          "categoryNameFR": "catégorie 001001",
          "categoryNameEN": "category 001001",
          "categoryNameAR": "الصنف 001001",
          "children": [
            {
              "code": "001001001",
              "categoryNameFR": "catégorie 001001001",
              "categoryNameEN": "category 001001001",
              "categoryNameAR": "الصنف 001001001",
              "children": []
            },
          ]
        },
        {
          "code": "001002",
          "categoryNameFR": "catégorie 001002",
          "categoryNameEN": "category 001002",
          "categoryNameAR": "الصنف 001002",
          "children": []
        },
        {
          "code": "001003",
          "categoryNameFR": "catégorie 001003",
          "categoryNameEN": "category 001003",
          "categoryNameAR": "الصنف 001003",
          "children": []
        },
        {
          "code": "001004",
          "categoryNameFR": "catégorie 001004",
          "categoryNameEN": "category 001004",
          "categoryNameAR": "الصنف 001004",
          "children": []
        },
      ]
    },
    {
      "code": "002",
      "categoryNameFR": "catégorie 002",
      "categoryNameEN": "category 002",
      "categoryNameAR": "الصنف 002",
      "children": [
        {
          "code": "002001",
          "categoryNameFR": "catégorie 002001",
          "categoryNameEN": "category 002001",
          "categoryNameAR": "الصنف 002001",
          "children": []
        },
        {
          "code": "002002",
          "categoryNameFR": "catégorie 002002",
          "categoryNameEN": "category 002002",
          "categoryNameAR": "الصنف 002002",
          "children": []
        },
      ]
    },
    {
      "code": "003",
      "categoryNameFR": "catégorie 003",
      "categoryNameEN": "category 003",
      "categoryNameAR": "الصنف 003",
      "children": []
    },
    {
      "code": "004",
      "categoryNameFR": "catégorie 004",
      "categoryNameEN": "category 004",
      "categoryNameAR": "الصنف 004",
      "children": []
    },
  ];
  static List<Map<String, dynamic>> getCategoriesByCode(String code, List categories) {
      var codeArr = splitCode(code);
      List categoriesByCode = [];

      for (var c in codeArr) {
        for (var category in categories) {
          if(c == category['code']) {
            categoriesByCode = category['children'];
            break;
          }
        }
        categories = categoriesByCode;
      }


      for (var category in categories) {
        if(category['code'] == code) {
          if (category['children'].isEmpty) {
            return List<Map<String, dynamic>>.empty();
          }
          return category['children'];
        }
      }
      return List<Map<String, dynamic>>.empty();
  }

  static List splitCode(String code) {
    const splitSize = 3;
    RegExp exp = RegExp(r"{\d{" + "$splitSize" + "}}");
    Iterable<Match> matches = exp.allMatches(code);
    String tempCode = "";
    var list = matches.map( (m)  {
      tempCode += m.group(0).toString();
      return tempCode;
    });
    return list.toList();
  }
}