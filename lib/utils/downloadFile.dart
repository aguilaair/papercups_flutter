import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Stream<StreamedResponse>> downloadFile(String url) async {
  var httpClient = Client();
  var request = Request('GET', Uri.parse(url));
  var response = httpClient.send(request);

  return response.asStream();
}

void downloadFileWeb(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
