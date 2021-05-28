import 'package:http/http.dart' as http;
import 'package:metadata_fetch/metadata_fetch.dart';

void main() async {
  var headers = {
    'Range': 'bytes=0-524288',
    'Connection': 'close',
    'User-Agent':
        'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',
    'Accept-Encoding': 'gzip',
  };

  var res = await http.get(
      'https://twitter.com/natmiletic/status/1397913472470376462?s=20',
      headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  // print(res.body);

  var document = responseToDocument(res);
  var data = MetadataParser.parse(document);

  print("Description is: ${data.description} \n");
  print("Image is: ${data.image} \n");
  print("Title is: ${data.title} \n");
  print("Url is: ${data.url} \n");

  // List<String> tags = res.body.split("og:");
  // for (String tag in tags) {
  //   print(tag + "\n ************** \n");
  // }

  // RegExp exp = new RegExp("og:", caseSensitive: false, );
  // String a = exp.allMatches(res.body).first.input;

  // print(a);
  // var process = await Process.start('grep', ['-i', 'main', 'main.dart']);
  // print(process.stdout);
}
