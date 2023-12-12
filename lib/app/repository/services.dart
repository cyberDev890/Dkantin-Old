class Api {
  static const koneksi = "https://4e8f-103-175-224-81.ngrok-free.app/api";
  static const gambar = "https://4e8f-103-175-224-81.ngrok-free.app/";
  static const signUp = "$koneksi/validate/register";
  static const signIn = "$koneksi/validate/loginKantin";
  static const updateProfile = "$koneksi/validate/customerAccount";
  static const getProfile = '$koneksi/validate/profileShow';
  static const getProfilekurir = '$koneksi/validate/kurirShow';
  static const updateFoto = '$koneksi/validate/imageProfile';
  static const updateFotoKurir = '$koneksi/validate/kurirProfile';
  static const semua = "$koneksi/menu/productAll/";
  static const signInKurir = "$koneksi/validate/loginKurir";
  static const forgotPassword = "$koneksi/validate/forgotPassword";
  static const verifKode = "$koneksi/validate/verifKode";
  static const ubahPassword = "$koneksi/validate/confirmPassword";
  static const makanan = "$koneksi/menu/food/";
  static const minuman = "$koneksi/menu/drink/";
  static const diskon = "$koneksi/menu/productWithDiscount/";
  static const penghasilan = "$koneksi/dataPenjualan";
  static const pesananKantin = "$koneksi/transaction/listOrderKantin";
  static const konfirmasi = "$koneksi/transaction/konfirmasiPesanan";
}
