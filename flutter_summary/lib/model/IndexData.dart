import 'package:flutter/material.dart';

///功能描述:
class IndexDataBean {
  Icons icons;
  String title;
  Function onTap;

  IndexDataBean({this.icons, this.title, this.onTap});
}

class IndexDatas {
  static List<IndexDataBean> datas = <IndexDataBean>[

  ];
}
