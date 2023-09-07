import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_reading_progress_model.dart';
export 'select_reading_progress_model.dart';

class SelectReadingProgressWidget extends StatefulWidget {
  const SelectReadingProgressWidget({Key? key}) : super(key: key);

  @override
  _SelectReadingProgressWidgetState createState() =>
      _SelectReadingProgressWidgetState();
}

class _SelectReadingProgressWidgetState
    extends State<SelectReadingProgressWidget> {
  late SelectReadingProgressModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectReadingProgressModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    width: 50.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '어디까지 읽으셨나요?',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.sliderValue?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    Text(
                      '%',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 0.0,
                    max: 100.0,
                    value: _model.sliderValue ??= 0.0,
                    label: _model.sliderValue.toString(),
                    divisions: 100,
                    onChanged: (newValue) {
                      newValue = double.parse(newValue.toStringAsFixed(6));
                      setState(() => _model.sliderValue = newValue);
                    },
                    onChangeEnd: (newValue) async {
                      newValue = double.parse(newValue.toStringAsFixed(6));
                      setState(() => _model.sliderValue = newValue);
                      Navigator.pop(context, _model.sliderValue);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
