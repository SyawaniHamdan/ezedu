class Subject {
  String? id;
  String subjectName;
  String subjectDesc;
  String subjectPrice;
  String subjectSlot;

  Subject(
      {this.id = '',
      this.subjectName = '',
      this.subjectDesc = '',
      this.subjectPrice = '',
      this.subjectSlot = ''
      });
  Subject.copy(from)
      : this(
            id: from.id,
            subjectName: from.subjectName,
            subjectDesc: from.subjectDesc,
            subjectPrice: from.subjectPrice,
            subjectSlot: from.subjectSlot
            );

  Subject.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            subjectName: json['subjectName'],
            subjectDesc: json['subjectDesc'],
            subjectPrice: json['subjectPrice'],
            subjectSlot: json['subjectSlot']
            );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectName': subjectName,
        'subjectDesc': subjectDesc,
        'subjectPrice': subjectPrice,
        'subjectSlot': subjectSlot
        
      };
}
