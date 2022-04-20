import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/bill_type_card_sorting_method.dart';
import 'package:cashew/enum/default_utilities.dart';
import 'package:cashew/models/bill.dart';
import 'package:flutter/material.dart';

class Global {
  static final colors = _Colors();
  static final billSorting = _BillSorting();
}

class _Colors {
  final lightIconColor = const Color(0XFFE7EAEB);
  late final lightIconColorDarker =
      HSLColor.fromColor(lightIconColor).withLightness(0.55).toColor();
  final darkIconColor = const Color(0XFF323031);
  late final darkIconColorLighter =
      HSLColor.fromColor(darkIconColor).withLightness(0.75).toColor();
}

class _BillSorting {
  final Map<BillTypeCardSortingMethod, int Function(Bill a, Bill b)>
      sortingBin = {
    BillTypeCardSortingMethod.titleAscending: (a, b) =>
        a.title.compareTo(b.title),
    BillTypeCardSortingMethod.titleDescending: (a, b) =>
        b.title.compareTo(a.title),
    BillTypeCardSortingMethod.costAscending: (a, b) => a.cost.compareTo(b.cost),
    BillTypeCardSortingMethod.costDescending: (a, b) =>
        b.cost.compareTo(a.cost),
    BillTypeCardSortingMethod.dateCreatedAscending: (a, b) =>
        a.dateCreated.compareTo(b.dateCreated),
    BillTypeCardSortingMethod.dateCreatedDescending: (a, b) =>
        b.dateCreated.compareTo(a.dateCreated),
    BillTypeCardSortingMethod.nextDueDateAscending: (a, b) {
      DateTime? aTime = a.getNextPaymentDate();
      DateTime? bTime = b.getNextPaymentDate();
      if (aTime == null && bTime == null) {
        return 0;
      } else if (aTime == null) {
        return 1;
      } else if (bTime == null) {
        return -1;
      } else {
        return aTime.compareTo(bTime);
      }
    },
    BillTypeCardSortingMethod.nextDueDateDescending: (a, b) {
      DateTime? aTime = a.getNextPaymentDate();
      DateTime? bTime = b.getNextPaymentDate();
      if (aTime == null && bTime == null) {
        return 0;
      } else if (aTime == null) {
        return -1;
      } else if (bTime == null) {
        return 1;
      } else {
        return bTime.compareTo(aTime);
      }
    },
    BillTypeCardSortingMethod.category: (a, b) =>
        a.category.name.compareTo(b.category.name)
  };
}

class _DefaultIcons {
  final Map<DefaultUtilities, IconData> utilityIcons = {
    DefaultUtilities.electricity: Icons.electric_bike,
    DefaultUtilities.gas: Icons.fire_hydrant,
  };
}
