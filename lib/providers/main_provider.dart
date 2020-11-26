import 'package:cajero_automatico_app/models/validation_item.dart';
import 'package:cajero_automatico_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  ValidationItem _bill = ValidationItem('1000', null);
  ValidationItem _retirementAccount = ValidationItem(null, null);
  ValidationItem _amount = ValidationItem(null, null);

  ValidationItem get bill => _bill;
  ValidationItem get retirementAccount => _retirementAccount;
  ValidationItem get amount => _amount;

  bool get isValidTransfer {
    if (_retirementAccount.value != null &&
        _amount.value != null &&
        _bill.value != null &&
        int.parse(_bill.value) > 0 &&
        int.parse(_amount.value) < int.parse(_bill.value)) {
      return true;
    } else {
      return false;
    }
  }

  bool get isValidRetiro {
    if (_amount.value != null &&
        _bill.value != null &&
        int.parse(_bill.value) > 0 &&
        int.parse(_amount.value) < int.parse(_bill.value)) {
      return true;
    } else {
      return false;
    }
  }

  validateBill({String retirementAccount}) {
    if (retirementAccount.length == 16) {
      _retirementAccount = ValidationItem(retirementAccount, null);
    } else {
      _retirementAccount =
          ValidationItem(null, "Deberían de ser al menos 16 dígitos");
    }
    notifyListeners();
  }

  validateAmount({String amount}) {
    if (amount.length > 0) {
      _amount = ValidationItem(amount, null);
    } else {
      _amount = ValidationItem(null, "Coloque un monto");
    }
    notifyListeners();
  }

  _updating() {
    final int newbill = int.parse(_bill.value) - int.parse(_amount.value);
    _bill = ValidationItem(newbill.toString(), null);
    notifyListeners();
  }

  makeTransfer({BuildContext context}) {
    if (isValidTransfer) {
      _updating();
    } else {
      _showSnackbar(context: context);
    }
  }

  makeRetiro({BuildContext context}) {
    if (isValidRetiro) {
      _updating();
    } else {
      _showSnackbar(context: context);
    }
  }

  _showSnackbar({BuildContext context}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: kprimarycolorLight,
        content: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "Complete todos los campos correctamente 😁",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
