import 'package:http/http.dart' as http;

void main() async {
  var headers = {
    'Range': 'bytes=0-524288',
    'Connection': 'close',
    'User-Agent':
        'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',
    'Accept-Encoding': 'gzip',
  };

  var res = await http.get(
      'https://twitter.com/sharifshameem/status/1284095222939451393',
      headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  // print(res.body);

  List<String> tags = res.body.split("og:");
  print(tags[1].toString());
  print(tags[2].toString());
  print(tags[3].toString());
  print(tags[4].toString());

  // RegExp exp = new RegExp("og:", caseSensitive: false, );
  // String a = exp.allMatches(res.body).first.input;

  // print(a);
  // var process = await Process.start('grep', ['-i', 'main', 'main.dart']);
  // print(process.stdout);
}
