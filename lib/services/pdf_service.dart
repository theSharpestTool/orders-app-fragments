import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:orders_app/stores/cost_store/cost_model_store.dart';
import 'package:orders_app/stores/part_store/part_model_store.dart';
import 'package:printing/printing.dart';

class PDFService {
  final String clientName;
  final String siteName;
  final String unitName;
  final String orderNumber;
  final String completedOrderNumber;
  final String date;
  final String duration;
  final String service;
  final String subservice;
  final String fault;
  final String description;
  final String workDescription;
  final String repairerName;
  final List<PartModelStore> parts;
  final String review;
  final List<CostModelStore> costs;

  PDFService({
    this.clientName,
    this.siteName,
    this.unitName,
    this.orderNumber,
    this.completedOrderNumber,
    this.date,
    this.duration,
    this.service,
    this.subservice,
    this.fault,
    this.description,
    this.repairerName,
    this.parts,
    this.review,
    this.costs,
    this.workDescription,
  });

  Future<Uint8List> generate() async {
    final pw.Document doc = pw.Document();

    final image = await pdfImageFromImageProvider(
      pdf: doc.document,
      image: AssetImage('assets/logo/logo.png'),
    );

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.copyWith(
          marginTop: 1 * PdfPageFormat.cm,
          marginLeft: 1.4 * PdfPageFormat.cm,
          marginRight: 1.4 * PdfPageFormat.cm,
        ),
        build: (_) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _buildHeader(image),
            _buildTwoAttributes(
              _buildAttribute(key: 'Start Date', value: date),
              _buildShortAttribute(
                key: 'Repair Work no. :',
                value: completedOrderNumber,
              ),
              space: 100,
            ),
            _buildAttribute(key: 'Scheduled Meter', value: 'Actual Meter'),
            _buildAttribute(key: 'Assigned To', value: repairerName),
            _buildAttribute(key: 'Customer', value: clientName),
            _buildAttribute(key: 'Address', value: siteName),
            _buildTwoAttributes(
              _buildAttribute(key: 'Description', value: description),
              _buildAttribute(key: 'Inspection Time', value: ''),
            ),
            _buildTwoAttributes(
              _buildAttribute(key: 'SA', value: ''),
              _buildAttribute(key: 'Start Time', value: ''),
            ),
            _buildTwoAttributes(
              _buildAttribute(key: 'Project/Order', value: orderNumber),
              _buildAttribute(key: 'End Time', value: ''),
            ),
            _buildLongAttribute(
                key: 'REPLACEMENT OF WIN WIN LED BULB', value: ''),
            _buildLongAttribute(key: 'Location', value: unitName),
            //_buildLongBorderedAttribute(key: 'Work Description', value: workDescription,),
          ],
        ),
      ),
    );

    return doc.save();
  }

  pw.Row _buildTwoAttributes(pw.Widget first, pw.Widget second,
      {double space = 15}) {
    return pw.Row(
      children: [
        first,
        pw.SizedBox(width: space),
        second,
      ],
    );
  }

  pw.Container _buildAttribute({
    String key,
    String value,
  }) {
    //> 25
    return pw.Container(
      width: 250,
      //height: 20,
      child: pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(key),
              if (value.length < 25)
                pw.Text(
                  value,
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
            ],
          ),
          if (value.length >= 25)
            pw.Container(
              width: 250,
              child: pw.Text(
                value,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
          pw.SizedBox(height: 1),
          pw.Container(
            width: 250,
            height: 1,
            color: PdfColors.grey,
          ),
        ],
      ),
    );
  }

  pw.Container _buildShortAttribute({
    String key,
    String value,
  }) {
    //> 25
    return pw.Container(
      width: 160,
      //height: 20,
      child: pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(key),
              pw.Text(
                value,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Container _buildLongBorderedAttribute({
    String key,
    String value,
  }) {
    //> 25
    return pw.Container(
      width: double.infinity,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Text(key),
              pw.SizedBox(width: 20),
              pw.Container(
                width: double.infinity,
                height: 30,
                decoration: pw.BoxDecoration(
                  border: pw.BoxBorder(
                    bottom: true,
                    left: true,
                    right: true,
                    top: true,
                    color: PdfColors.grey,
                    width: 1,
                  ),
                ),
              ),
              // pw.Text(
              //   value,
              //   style: pw.TextStyle(
              //     fontWeight: pw.FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Container _buildLongAttribute({
    String key,
    String value,
  }) {
    //> 25
    return pw.Container(
      width: double.infinity,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Text(key),
              pw.SizedBox(width: 20),
              pw.Text(
                value,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 1),
          pw.Container(
            width: double.infinity,
            height: 1,
            color: PdfColors.grey,
          ),
        ],
      ),
    );
  }

  pw.Container _buildHeader(PdfImage image) {
    return pw.Container(
      height: 100,
      padding: pw.EdgeInsets.only(bottom: 10),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.SizedBox(
            width: 100,
            height: 100,
            child: pw.Image(
              image,
              fit: pw.BoxFit.contain,
            ),
          ),
          pw.SizedBox(
            width: 450,
            child: pw.Column(
              children: [
                pw.Text(
                  'OrdersApp FACILITY MANAGEMENT\nSERVICES LIMITED',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
                pw.SizedBox(height: 3),
                pw.Text(
                  '6th Floor, Iddo House, Leventis Compound, Ebute-Metta, Lagos State',
                  textAlign: pw.TextAlign.center,
                ),
                pw.SizedBox(height: 3),
                pw.Text(
                  'Web: www.ordersappfm.com     Email: info@ordersappfm.com',
                  textAlign: pw.TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
