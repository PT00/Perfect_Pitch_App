import 'dart:math';

List<String> notes = [
  "c.mp3",
  "cs.mp3",
  "d.mp3",
  "ds.mp3",
  "e.mp3",
  "f.mp3",
  "fs.mp3",
  "g.mp3",
  "gs.mp3",
  "a.mp3",
  "as.mp3",
  "b.mp3"
];

List<dynamic> randomNote() {
  var intValue = Random().nextInt(12);

  return [intValue, notes[intValue]];
}
