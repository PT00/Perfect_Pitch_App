import 'dart:math';

List<String> notes = [
  "sounds/c.mp3",
  "sounds/c#.mp3",
  "sounds/d.mp3",
  "sounds/d#.mp3",
  "sounds/e.mp3",
  "sounds/f.mp3",
  "sounds/f#.mp3",
  "sounds/g.mp3",
  "sounds/g#.mp3",
  "sounds/a.mp3",
  "sounds/a#.mp3",
  "sounds/b.mp3"
];

List<dynamic> randomNote() {
  var intValue = Random().nextInt(13);

  return [intValue, notes[intValue]];
}
