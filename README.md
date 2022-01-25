# Mobil Programlama Proje Backend

## Kurulum

### Veri Tabanı

Kullanılan MySQL sunucusunda (eğer yoksa Xampp kullanabilirsiniz) DB_HASTANE_TELETIP adında bir veritabanı oluşturulur ve Sorgu.sql içerisindeki sorgular çalıştırılır. Bu sayede bütün tablolar ve veriler hazır olarak gelecektir.

### NodeJS 
```
git clone https://github.com/suleyman-kutukoglu/teletip-nodejs-backend
cd teletip-nodejs-backend
npm install -i
node server.js
```

# Kullanım

### GET İstekleri

Bütün hastaları getirir.

> http://localhost:3000/api/hastalar

Bütün doktorları getirir.

> http://localhost:3000/api/doktorlar

Bütün mesajları getirir.

> http://localhost:3000/api/mesajlar

X ID'sine sahip doktoru getirir.

> http://localhost:3000/api/doktorlar/X

X ID'sine sahip hastayı getirir.

> http://localhost:3000/api/hastalar/X

X ID'sine sahip mesajı getirir.

> http://localhost:3000/api/mesajlar/X

### POST İstekleri

Uygun formatta JSON dosyası POST isteğiyle gönderildiği zaman veri tabanına mesajı ekler.

> http://localhost:3000/api/mesajlar/

Uygun formatta JSON dosyası POST isteğiyle gönderildiği zaman veri tabanına hasta ekler.

> http://localhost:3000/api/hastalar/

Uygun formatta JSON dosyası POST isteğiyle gönderildiği zaman veri tabanına doktor ekler.

> http://localhost:3000/api/doktorlar/


