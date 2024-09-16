String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }
  if (input == 'tv') {
    return 'TV';
  }
  return input[0].toUpperCase() + input.substring(1);
}
