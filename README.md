# PromoBot Segmentayon - Model

Ödeal için özel olarak geliştirilen PromoBot uygulamasının temel kodları `main.py` içerisindedir. Api, Flask kullanılarak oluşturulmuş olup kullanıcı sorgularına AI destekli yanıtlar sağlamaktadır. Ayrıca, kullanıcıların RFM (Recency, Frequency, Monetary) segmentasyonuna göre kişiselleştirilmiş promosyonlar sunar.

## RFM Segmantasyonu 

- **Recency**: Müşteri Güncelliği
- **Frequency**: İşlem Sayısı
- **Monetary**: İşlem Hacmi

### Segment Çeşitleri  
![image](https://github.com/aydozy/Hackathon-OdealPromoBot/assets/104395137/2e13bebe-e33f-4a8b-ba18-e64600ef2b3f)

## Model 
- LLM: OpenAI  text-davinci-003
  
<img width="694" alt="image" src="https://github.com/aydozy/Hackathon-OdealPromoBot/assets/104395137/161a7032-2f9d-4bc1-a42e-fe03ac81010f">



## Özellikler
- **RFM Segmentasyonu**: Müşteriler, alışveriş sıklıkları ve harcama tutarlarına göre çeşitli segmentlere ayrılır.
- **AI Destekli Yanıtlar**: Kullanıcı sorgularına yapay zeka destekli, özelleştirilmiş yanıtlar sunar.
- **Dinamik Promosyon Sunumu**: Kullanıcı segmentlerine göre özelleştirilmiş promosyonlar sunar.

## Kullanılan Teknolojiler
- **Python ve Flask**: Sunucu tarafı işlemleri ve API servisleri için kullanılır.
- **OpenAI ve LangChain**: Yapay zeka destekli sohbet botu işlevselliği için kullanılır.



# PromoBot App
## Proje Hakkında 
PromoBot, kullanıcıların onunla etkileşim kurarak kendilerine özel promosyonlar ve kampanyalar hakkında bilgi almasını sağlar. Modern UI/UX tasarım ilkeleri ile geliştirilen PromoBot, kullanıcılara akıcı ve anlaşılır bir deneyim sunar.

## Ana Özellikler
- **Kullanıcı Girişi**: Kullanıcılar, benzersiz ID'leri ile güvenli bir şekilde giriş yapabilir.
- **Sohbet Arayüzü**: PromoBot ile gerçek zamanlı sohbet ve kişiye özel promosyon ve kampanya bilgileri.
- **Asenkron Veri İşleme**: HTTP istekleri aracılığıyla sunucudan asenkron veri alışverişi.

## Kullanılan Teknolojiler
- **Flutter ve Dart**: Mobil arayüz geliştirmede kullanılır.
- **Python ve Flask**: Backend API servislerini geliştirmede kullanılır. Bu servisler, uygulamanın veri alışverişini ve iş mantığını sağlar.
- **HTTP Paketi**: Dart içinde, sunucudan veri alışverişi için kullanılır.

## Uygulama Görselleri 

### Splash Ekran

![splash (2)](https://github.com/aydozy/Hackathon-OdealPromoBot/assets/104395137/541bda77-f13c-4223-9c0c-29f2322936dd)

### Ana Ekran 

![ana ekran (1)](https://github.com/aydozy/Hackathon-OdealPromoBot/assets/104395137/bb2db8cd-a8fe-4f66-8822-e6471e5e9495)

### Chat Ekranı

![chat screen (1)](https://github.com/aydozy/Hackathon-OdealPromoBot/assets/104395137/f2a394b4-dadb-4280-ba9b-8f0c2bb88742)

## Demo

[](https://github.com/aydozy/Hackathon-OdealPromoBot/assets/104395137/4a63ee1e-91e0-4b46-a3fc-5905b45b89dc)





