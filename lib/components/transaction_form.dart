import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_expenses/components/adaptative_textfield.dart';
import 'adaptative_button.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(
    String,
    double,
    DateTime,
  ) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    final date = _selectedDate;

    if (title.isEmpty || value <= 0 || date == null) {
      return;
    }
    widget.onSubmit(title, value, date);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Container(
          height: 280,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  AdaptativeTextField(
                      label: 'Título',
                      onSubmitted: (_) => _submitForm(),
                      controller: _titleController),
                  AdaptativeTextField(
                    label: 'Valor (R\$)',
                    onSubmitted: (_) => _submitForm(),
                    controller: _valueController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                  AdaptativeDatePicker(
                    selectedDate: _selectedDate,
                    onDateChanged: (newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AdaptativeButton(
                        label: 'Nova Transação',
                        onPressed: _submitForm,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
