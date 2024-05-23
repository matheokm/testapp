// ignore: file_names
import 'package:flutter/material.dart';
import 'package:testapp/widget/scanQRWidget.dart';

class AutocompleteWidget extends StatefulWidget {
  final Future<List<String>> Function(String) fetchSuggestions;
  final String labelWidget;
  final bool showQRScanner;

  const AutocompleteWidget({
    super.key,
    required this.labelWidget,
    required this.fetchSuggestions,
    this.showQRScanner = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DynamicAutocompleteTextFieldState createState() =>
      _DynamicAutocompleteTextFieldState();
}

class _DynamicAutocompleteTextFieldState extends State<AutocompleteWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _suggestions = [];
  bool _isLoading = false;

  void _onTextChanged(String query) async {
    if (query.isEmpty) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    if (!mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    final suggestions = await widget.fetchSuggestions(query);
    setState(() {
      _suggestions = suggestions;
      _isLoading = false;
    });
  }

  void _onQRCodeScanned(String code) {
    _controller.text = code;
    _onTextChanged(code);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onTextChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: 'Buscar ${widget.labelWidget}',
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 109, 108, 108),
            ),
            border: const OutlineInputBorder(),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                if (widget.showQRScanner)
                  IconButton(
                    icon: const Icon(Icons.qr_code),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScanQRWidget(
                            onScanned: _onQRCodeScanned,
                          ),
                        ),
                      );
                      if (result != null) {
                        _onQRCodeScanned(result);
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
        if (_suggestions.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_suggestions[index]),
                  onTap: () {
                    _controller.text = _suggestions[index];
                    _focusNode.unfocus();
                    setState(() {
                      _suggestions = [];
                    });
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
