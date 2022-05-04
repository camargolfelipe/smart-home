temperature(int temperature) {
  if (temperature < 17) {
    return 'assets/lottie/air/coldest.json';
  } else if (17 >= temperature || temperature < 25) {
    return 'assets/lottie/air/cold.json';
  } else if (25 >= temperature || temperature < 32) {
    return 'assets/lottie/air/hot.json';
  } else if (32 <= temperature) {
    return 'assets/lottie/air/hotest.json';
  } else {
    return 'assets/lottie/air/cold.json';
  }
}
