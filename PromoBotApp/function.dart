import 'package:http/http.dart' as http;

// `fetchData` fonksiyonu, HTTP GET isteği göndermek için kullanılır.
// Bu fonksiyon, verilen URL'ye bir istek gönderir ve yanıtı alır.
// Dart'ın http paketi, ağ isteklerini kolayca yapmak için kullanılır.
// Fonksiyon, bir URL stringi alır, bu URL'yi `Uri.parse` kullanarak Uri'ye çevirir.
// Ardından, `http.get` metodu ile bu URL'ye bir HTTP GET isteği gönderir.
// `await` anahtar kelimesi, yanıtın gelmesini bekler ve bu süreç asenkron olarak işler.
// Fonksiyon, yanıtın gövdesini (`response.body`) döndürür.

fetchdata(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}
