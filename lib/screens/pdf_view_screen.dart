import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen();
  static const String routename = '/pdf_view_screen';

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  //final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  //PdfViewerController _pdfViewerController = PdfViewerController();
//Matrix4 pageNo. = [_pdfViewerController.currentPageNumber-1];

  @override
  Widget build(BuildContext context) {
    final PdfViewScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as PdfViewScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name, style: Theme.of(context).textTheme.bodyText1),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.keyboard_arrow_up,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       _pdfViewerController.goToPage(
        //           pageNumber: _pdfViewerController.currentPageNumber - 1);
        //     },
        //   ),
        //   IconButton(
        //     icon: Icon(
        //       Icons.keyboard_arrow_down,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       _pdfViewerController.goToPage(
        //           pageNumber: _pdfViewerController.currentPageNumber + 1);
        //     },
        //   )
        // ],
      ),
      body: FutureBuilder(
        future: DefaultCacheManager().getSingleFile(
          args.url,
        ),
        builder: (
          BuildContext context,
          AsyncSnapshot<File> snapshot,
        ) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : snapshot.hasData
                    ? PdfViewer.openFile(
                        snapshot.data!.path,
                      )
                    : const Center(
                        child: Text('Error Occured'),
                      ),
      ),
    );
  }
}

class PdfViewScreenArguments {
  PdfViewScreenArguments({
    required this.name,
    required this.url,
  });
  String url;
  String name;
}