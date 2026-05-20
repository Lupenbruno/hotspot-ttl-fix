# TTL Fix — Hotspot TTL Düzeltici

Windows'un varsayılan **TTL** (Time To Live) değerini `65` yaparak, telefon hotspot'u (tethering) üzerinden bağlanan bir bilgisayarın trafiğinin **doğrudan telefondan çıkıyormuş gibi** görünmesini sağlar.

## Neden 65?

- Telefonlar (Android / iOS) kendi paketlerini **TTL = 64** ile gönderir.
- Telefonu hotspot yapıp bir cihaz bağladığında, telefon yönlendirici (router) gibi davranır ve geçen paketin TTL'ini **1 azaltır**.
- Bilgisayar paketi **65** ile gönderirse, telefondan çıkarken **64**'e iner → operatör için telefonun kendi trafiğinden ayırt edilemez.
- Windows varsayılanı **128**'dir; bu durumda paket **127** ile gider ve "bu bir bilgisayar" olarak kolayca tespit edilir.

## Kullanım

1. `ttl-65-ayarla.bat` dosyasına çift tıkla (yönetici iznini kendisi ister, **Evet** de).
2. Bilgisayarı **yeniden başlat** (değişikliğin etkili olması için şart).

### Eski haline getirmek

`ttl-eski-haline-getir.bat` çalıştır → registry değeri silinir, Windows varsayılan `128`'e döner → yeniden başlat.

## Birden Fazla Cihaz

TTL ayarı **cihaz başınadır**. Telefona bağlanan her cihaz kendi TTL'ini ayarlamalıdır:

- 5 bilgisayarın 5'i de bu script'i çalıştırırsa → hepsinin trafiği operatöre **TTL = 64** olarak ulaşır, hepsi telefon trafiği gibi görünür.
- Ayarlanmayan cihaz `128 → 127` ile gider ve **yalnızca o cihaz** yakalanır (diğerlerini etkilemez).
- **Android / iPhone / macOS / Linux** varsayılanı zaten `64`'tür; onlarda da `65`'e çekilmelidir.

> İpucu: Telefon **root**'luysa, telefonda `iptables` ile yönlendirilen tüm paketlerin TTL'i sabitlenebilir; o zaman cihazlara tek tek dokunmaya gerek kalmaz.

## ⚠️ Uyarı

TTL, operatörlerin tethering tespiti için kullandığı **tek yöntem değildir**, sadece en yaygın olanıdır. Operatörler ayrıca DPI (HTTP User-Agent, TLS parmak izi), DNS sorguları ve trafik hacmi/deseni gibi yöntemlere de bakabilir. Bu yüzden TTL=65 birçok durumda yeterli olsa da **%100 garanti değildir**.

Bu araç eğitim amaçlıdır ve **kendi cihazlarınızda / kendi internet bağlantınızda** kullanım içindir. Operatörünüzle yaptığınız sözleşmeye uyup uymadığını kendiniz değerlendirmelisiniz.

## Katkı Sağlayanlar

- [@Lupenbruno](https://github.com/Lupenbruno) — Fikir, yazar
- **Claude (Anthropic)** — Script ve dokümantasyon

## Destek Verenler

_(Henüz yok — destek olmak isteyenler için ayrılmıştır.)_

## Lisans

[MIT](LICENSE)
