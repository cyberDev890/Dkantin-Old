class Api {
  static const koneksi = "https://2ea9-103-144-18-70.ngrok-free.app/api";
  static const gambar = "https://2ea9-103-144-18-70.ngrok-free.app/";
  static const signUp = "$koneksi/validate/register";
  static const signIn = "$koneksi/validate/loginKantin";
  static const kantinAktif = "$koneksi/validate/editStatus";
  static const penghasilan = "$koneksi/dataPenjualan";
  static const pesananKantin = "$koneksi/transaction/listOrderKantin";
  static const konfirmasi = "$koneksi/transaction/konfirmasiPesanan";
  static const menu = "$koneksi/menu/apimenu";
  static const count = "$koneksi/transaction/count";
  static const updateAda = "$koneksi/updateada";
  static const updateHabis = "$koneksi/updatehabis";
  static const updateBuka = "$koneksi/updateBuka";
  static const updateTutup = "$koneksi/updateTutup";
  static const rph = "$koneksi/transaction/RPH";
  static const rhp = "$koneksi/transaction/RHP";
  static const riwayat = "$koneksi/transaction/riwayatKantin";
}
