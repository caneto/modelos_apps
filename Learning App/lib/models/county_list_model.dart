
class CountriesList {
  String name;
  String flag;
  bool? isSelected;
  double percentage;

  CountriesList({
    required this.name,
    required this.flag,
    this.isSelected = false,
    required this.percentage,
  });
}
