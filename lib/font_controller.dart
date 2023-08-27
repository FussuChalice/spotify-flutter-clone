/// A class that manages font selection based on the script of a test word.
class FontController {
  /// The test word used to determine the script for font selection.
  final String testWord;

  /// The font list for the Latin script.
  final FontList latinFonts;

  /// The font list for another script (non-Latin).
  final FontList anotherFonts;

  /// Creates a [FontController] instance with the specified parameters.
  FontController(this.testWord, this.latinFonts, this.anotherFonts);

  /// Determines if the given word is in the Latin script.
  ///
  /// This function checks each rune in the word to determine if it falls within
  /// the Unicode ranges for Latin uppercase and lowercase letters.
  ///
  /// Returns `true` if all runes in the word are within the Latin script, otherwise `false`.
  bool isLatin(String word) {
    return word.runes.every(
        (rune) => (rune >= 65 && rune <= 90) || (rune >= 97 && rune <= 122));
  }

  /// Returns the appropriate [FontList] based on the script of the test word.
  ///
  /// If the test word is in the Latin script, the [latinFonts] font list is returned.
  /// Otherwise, the [anotherFonts] font list is returned.
  FontList getFontList() {
    return isLatin(testWord) ? latinFonts : anotherFonts;
  }
}

/// A class that represents a list of font styles.
class FontList {
  /// The font style for regular text.
  String? regular;

  /// The font style for bold text.
  String? bold;

  /// The font style for italic text.
  String? italic;

  /// The font style for book (non-bold) text.
  String? book;

  /// Creates a [FontList] instance with the specified font styles.
  FontList({
    this.regular,
    this.bold,
    this.italic,
    this.book,
  });
}