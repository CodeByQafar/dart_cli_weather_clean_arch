enum City {
  washington(38.89, -77.03),
  berlin(52.52, 13.40),
  paris(48.86, 2.35),
  london(51.51, -0.13),
  beijing(39.90, 116.40),
  tokyo(35.68, 139.69),
  moscow(55.76, 37.62),
  ankara(39.92, 32.85),
  baku(40.40, 49.87),
  istanbul(41.01, 28.97),
  canberra(-35.28, 149.13),
  ottawa(45.42, -75.69),
  madrid(40.41, -3.70),
  rome(41.90, 12.49),
  cairo(30.04, 31.24),
  newdelhi(28.61, 77.21),
  seoul(37.57, 126.98),
  brasilia(-15.83, -47.92),
  oslo(59.91, 10.75),
  stockholm(59.33, 18.06);

  final double latitude;
  final double longitude;

  const City(this.latitude, this.longitude);
}
