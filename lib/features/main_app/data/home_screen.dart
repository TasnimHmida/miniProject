class CategoryContents {
  final String image;
  final String text;

  CategoryContents({required this.image, required this.text});
}

List<CategoryContents> categoryContents = [
  CategoryContents(
    image: 'lib/core/assets/images/laptop.png',
    text: 'Development',
  ),
  CategoryContents(
    image: 'lib/core/assets/images/design.png',
    text: 'Design',
  ),
  CategoryContents(
    image: 'lib/core/assets/images/trumpet.png',
    text: 'Music',
  ),
  CategoryContents(
    image: 'lib/core/assets/images/english.png',
    text: 'Development',
  ),
];
