import 'package:pdf/widgets.dart' as pw;

pw.Widget buildText({
  required String title,
  required String value,
  double width = double.infinity,
  pw.TextStyle? titleStyle,
  bool unite = false,
}) {
  final style = titleStyle ?? pw.TextStyle(fontWeight: pw.FontWeight.bold);

  return pw.Container(
    width: width,
    child: pw.Row(
      children: [
        pw.Expanded(child: pw.Text(title, style: style)),
        pw.Text(value, style: unite ? style : null),
      ],
    ),
  );
}
