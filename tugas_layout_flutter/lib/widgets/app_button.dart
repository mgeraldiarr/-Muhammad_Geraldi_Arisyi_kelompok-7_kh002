import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Reusable Component: tombol yang membuka URL melalui aplikasi eksternal.
class AppButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String url;
  final double height;
  final double borderRadius;

  const AppButton({
    super.key,
    required this.label,
    required this.icon,
    required this.url,
    required this.height,
    required this.borderRadius,
  });

  // Intent: buka URL di aplikasi eksternal (browser / aplikasi GitHub).
  // Khusus web: buka di tab yang sama ('_self'), bukan tab baru.
  Future<void> _openUrl() async {
    final uri = Uri.parse(url);
    final opened = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: kIsWeb ? '_self' : null,
    );
    if (!opened) {
      debugPrint('Tidak dapat membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton.icon(
        onPressed: _openUrl,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
