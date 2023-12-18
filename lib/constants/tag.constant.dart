import 'package:flutter/material.dart';
import 'package:kweshtion_basic/enum/tag.enum.dart';

class TagDisplayData {
  // has color, icon, name
  final Tag _tag;

  TagDisplayData(this._tag);

  get name {
    switch (_tag) {
      case Tag.decideForMe:
        return 'Decide for me';
      case Tag.hypothetical:
        return 'Hypothetical';
      case Tag.politicsAndLaws:
        return 'Politics and laws';
      case Tag.sports:
        return 'Sports';
      case Tag.demographics:
        return 'Demographics';
      case Tag.currentEvents:
        return 'Current events';
      case Tag.wouldYouRather:
        return 'Would you rather';
      case Tag.gaming:
        return 'Gaming';
      default:
        return 'Other';
    }
  }

  get icon {
    switch (_tag) {
      case Tag.decideForMe:
        return '🤷';
      case Tag.hypothetical:
        return '🤔';
      case Tag.politicsAndLaws:
        return '🏛️';
      case Tag.sports:
        return '🏈';
      case Tag.demographics:
        return '📊';
      case Tag.currentEvents:
        return '📰';
      case Tag.wouldYouRather:
        return '🤷';
      case Tag.gaming:
        return '🎮';
      default:
        return '🤷';
    }
  }

  get color {
    switch (_tag) {
      case Tag.decideForMe:
        // #0079d3
        return const Color.fromRGBO(0, 121, 211, 1).value;
      case Tag.hypothetical:
        return 0xFFE0E0E0;
      case Tag.politicsAndLaws:
        return 0xFFE0E0E0;
      case Tag.sports:
        return 0xFFE0E0E0;
      case Tag.demographics:
        return 0xFFE0E0E0;
      case Tag.currentEvents:
        return 0xFFE0E0E0;
      case Tag.wouldYouRather:
        return 0xFFE0E0E0;
      case Tag.gaming:
        return 0xFFE0E0E0;
      default:
        return 0xFFE0E0E0;
    }
  }
}
