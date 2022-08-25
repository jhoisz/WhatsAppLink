import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WppForm extends StatefulWidget {
  const WppForm({Key? key}) : super(key: key);

  @override
  State<WppForm> createState() => _WppFormState();
}

class _WppFormState extends State<WppForm> {
  final _formKey = GlobalKey<FormState>();

  final _numberController = MaskedTextController(mask: '(00) 00000-0000');
  String? _linkNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Link'),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _linkNumber = null;
                });
                _numberController.clear();
              })
        ],
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _numberController,
              validator: (value) {
                if (_numberController.unmasked.length < 11) {
                  return 'Mínimo de 11 caracteres';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                String number = _numberController.unmasked;
                setState(() {
                  _linkNumber = "https://api.whatsapp.com/send?phone=$number";
                });
              }
            },
            child: const Text('Gerar Link'),
          ),
          if (_linkNumber != null) ...[
            Text(_linkNumber!),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _linkNumber));
                setState(() {
                  _linkNumber == null;
                });
              },
              child: const Text('Copiar link'),
            )
          ]
        ],
      ),
    );
  }
}
