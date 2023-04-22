searchFunction(List twoDList, String word, int r, int c) {
  List<int> ind = [];
  int wlen = word.length;

  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (twoDList[i][j] == word[0]) {
        // Horizontal checking
        if (j <= c - wlen &&
            twoDList.getRange(i, i + 1).join("").contains(word)) {
          for (int k = j; k < j + wlen; k++) {
            ind.add((k * r) + i);
          }
          return ind;
        }
        // Vertical checking
        else if (i <= r - wlen &&
            (twoDList
                .map((row) => row[j])
                .toList()
                .sublist(i, i + wlen)
                .join("")
                .contains(word))) {
          for (int k = i; k < i + wlen; k++) {
            ind.add((j * r) + k);
          }
          return ind;
        }
        // Cross checking
        else if (i <= r - wlen && j <= c - wlen) {
          bool found = true;
          for (int k = 0; k < wlen; k++) {
            if (twoDList[i + k][j + k] != word[k]) {
              found = false;
              break;
            }
          }
          if (found) {
            for (int k = 0; k < wlen; k++) {
              ind.add(((j + k) * r) + (i + k));
            }
            return ind;
          }
        }
      }
    }
  }

  return ind;
}
