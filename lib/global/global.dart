import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_sorting_method.dart';
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
  final Map<BillCategory, Color> categoryColors = {
    BillCategory.auto: Color(0xFFffa645),
    BillCategory.entertainment: Color(0xFFf55d41),
    BillCategory.fitness: Color(0xFFf4e249),
    BillCategory.food: Color(0xFFd5e290),
    BillCategory.general: Color(0xFF86c98d),
    BillCategory.healthCare: Color(0Xff64c3a9),
    BillCategory.housing: Color(0XFFff9fa8),
    BillCategory.insurance: Color(0XFFf7617c),
    BillCategory.parking: Color(0XFF38b257),
    BillCategory.sports: Color(0XFFa37ab2),
    BillCategory.studentLoan: Color(0xFF00aab2),
    BillCategory.telephone: Color(0xFFd02272),
    BillCategory.utility: Color(0XFF655ea1),
  };
}

class _BillSorting {
  final Map<BillSortingMethod, int Function(Bill a, Bill b)> sortingBin = {
    BillSortingMethod.titleAscending: (a, b) => a.title.compareTo(b.title),
    BillSortingMethod.titleDescending: (a, b) => b.title.compareTo(a.title),
    BillSortingMethod.costAscending: (a, b) => a.cost.compareTo(b.cost),
    BillSortingMethod.costDescending: (a, b) => b.cost.compareTo(a.cost),
    BillSortingMethod.dateCreatedAscending: (a, b) =>
        a.dateCreated.compareTo(b.dateCreated),
    BillSortingMethod.dateCreatedDescending: (a, b) =>
        b.dateCreated.compareTo(a.dateCreated),
    BillSortingMethod.nextDueDateAscending: (a, b) {
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
    BillSortingMethod.nextDueDateDescending: (a, b) {
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
    BillSortingMethod.category: (a, b) =>
        a.category.name.compareTo(b.category.name)
  };
}

class _DefaultIcons {
  final Map<DefaultUtilities, IconData> utilityIcons = {
    DefaultUtilities.electricity: Icons.electric_bike,
    DefaultUtilities.gas: Icons.fire_hydrant,
  };
}
