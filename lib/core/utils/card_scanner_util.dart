import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:logger/logger.dart';

class CardScannerUtils {
  const CardScannerUtils._();

  static Future<File?> scanFromCamera() async {
    try {
      Logger().d("GDSGDSgsgsdgsd");
      // 1. Configure Options
      final options = DocumentScannerOptions(
        documentFormat: DocumentFormat.jpeg,
        // ScannerMode.filter is the "Full" mode that defaults to Manual Review
        mode: ScannerMode.full,
        isGalleryImport: true,
        pageLimit: 1,
      );

      final documentScanner = DocumentScanner(options: options);

      // 2. Start Scan
      final result = await documentScanner.scanDocument();

      // 3. Extract the file path (No regex needed!)
      if (result.images.isNotEmpty) {
        final String path = result.images.first;
        return File(path);
      }
      return null;
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }

  static String? _extractFilePathFromPagesString(String pagesString) {
    try {
      Logger().d("Extracting from pages string: $pagesString");

      // The format is: "[Page{imageUri=file:///path/to/image.jpg}]"
      // We need to extract the file path from this string

      // Method 1: Extract between "file://" and "}"
      final startIndex = pagesString.indexOf('file://');
      if (startIndex != -1) {
        final endIndex = pagesString.indexOf('}', startIndex);
        if (endIndex != -1) {
          String fullPath = pagesString.substring(startIndex, endIndex);
          String cleanPath = fullPath.replaceFirst("file://", "");
          Logger().d("Method 1 - Extracted path: $cleanPath");
          return cleanPath;
        }
      }

      // Method 2: Use regex to extract the path
      final regex = RegExp(r'file://([^}]+)');
      final match = regex.firstMatch(pagesString);
      if (match != null) {
        String fullPath = match.group(0)!; // "file:///path/to/image.jpg"
        String cleanPath = fullPath.replaceFirst("file://", "");
        Logger().d("Method 2 - Extracted path: $cleanPath");
        return cleanPath;
      }

      // Method 3: Split by 'imageUri=' and extract
      if (pagesString.contains('imageUri=')) {
        final parts = pagesString.split('imageUri=');
        if (parts.length > 1) {
          String pathPart = parts[1];
          final endIndex = pathPart.indexOf('}');
          if (endIndex != -1) {
            String fullPath = pathPart.substring(0, endIndex);
            String cleanPath = fullPath.replaceFirst("file://", "");
            Logger().d("Method 3 - Extracted path: $cleanPath");
            return cleanPath;
          }
        }
      }

      Logger().d("All extraction methods failed");
      return null;
    } catch (e) {
      Logger().e("Error extracting file path: $e");
      return null;
    }
  }
}