class Tafsir {
    int code;
    String message;
    Data data;

    Tafsir({
        required this.code,
        required this.message,
        required this.data,
    });

}

class Data {
    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;
    String tempatTurun;
    String arti;
    String deskripsi;
    Map<String, String> audioFull;
    List<TafsirElement> tafsir;
    SuratSelanjutnya suratSelanjutnya;
    bool suratSebelumnya;

    Data({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
        required this.tafsir,
        required this.suratSelanjutnya,
        required this.suratSebelumnya,
    });

}

class SuratSelanjutnya {
    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;

    SuratSelanjutnya({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
    });

}

class TafsirElement {
    int ayat;
    String teks;

    TafsirElement({
        required this.ayat,
        required this.teks,
    });

}
