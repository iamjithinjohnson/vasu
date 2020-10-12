//

class Data {

  //jsonfile indoor plant
  static const jsonindoor = 'https://raw.githubusercontent.com/iamjithinjohnson/flutter/master/janathaApp/json/indoor.json';
//jsonfile outdoorplant
static const jsonoutdoor = 'https://raw.githubusercontent.com/iamjithinjohnson/flutter/master/janathaApp/json/outdoor.json';

  //janatha logo url
  static const janathaLogo =
      'https://lh3.googleusercontent.com/-ubLv_TOpPYY/X37EuqPyd7I/AAAAAAAAAio/L2I6dxeBgP8Qaxu4vGPlJcLhdbot4LrawCLcBGAsYHQ/image.png';

//facebook logo url
  static const faceLogo =
      'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19750.png';

//instagram logo url
  static const instaLogo =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/1200px-Instagram_logo_2016.svg.png';

// youtube logo url
  static const youtubeLogo =
      'https://varivanaresort.com/wp-content/themes/zermatt/images/QR/icon%20yb.png';


// youtube link opening
  static const youtubeBro =
      'https://www.youtube.com/channel/UCMf_tD6BPUicsNu6z2cRhMg?view_as=subscriber';

// facebook link opening ( temperory )
  static const faceBro = 'https://www.facebook.com/';

// instagram link opening ( temperory )
  static const instaBro = 'https://www.instagram.com/';

  //janathaData, github json
  String imgpath, name, category, id ,info;
  int price;

  Data({
    this.id,
    this.imgpath,
    this.name,
    this.price,
    this.category,
    this.info,
  });
}

List <Data> janatha(){
  return <Data>[
      Data(
      id: '3',
      category: 'agriculture',
      name: 'lucky bamboo',
      price: 300,
      imgpath:
          'https://3.imimg.com/data3/KE/PR/MY-10774892/lucky-bamboo-tree-500x500.jpg',
    ),

  ];
}

//  Data(
//       id: '1',
//       category: 'indoor plants',
//       name: 'rose',
//       price: 200,
//       imgpath:
//           'https://dp5zphk8udxg9.cloudfront.net/wp-content/uploads/2017/10/shutterstock_612686159-e1508754792624.jpg',
//     ),
//     Data(
//       id: '2',
//       category: 'Outdoor plants ',
//       name: 'money plant ',
//       price: 300,
//       imgpath:
//           'https://images-na.ssl-images-amazon.com/images/I/41YlnnYriDL.jpg',
//     ),
//     Data(
//       id: '3',
//       category: 'agriculture',
//       name: 'lucky bamboo',
//       price: 300,
//       imgpath:
//           'https://3.imimg.com/data3/KE/PR/MY-10774892/lucky-bamboo-tree-500x500.jpg',
//     ),
//     Data(
//       id: '4',
//       category: 'flower',
//       name: 'jumbo plant',
//       price: 1300,
//       imgpath:
//           'https://i.pinimg.com/originals/23/68/67/236867f7cf4a63079b877fc44ade15b2.jpg',
//     ),
//   ];
