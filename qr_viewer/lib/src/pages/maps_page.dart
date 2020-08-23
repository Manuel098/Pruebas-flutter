import 'package:flutter/material.dart';
import 'package:qr_viewer/src/bloc/scan_bloc.dart';
import 'package:qr_viewer/src/models/scan_model.dart';
import 'package:qr_viewer/src/utils/colors.dart';
import 'package:qr_viewer/src/utils/utils.dart' as utils;

class MapsPage extends StatelessWidget {
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scanStream,
      builder: ( BuildContext cont, AsyncSnapshot<List<ScanModel>> snapshot ){
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());

        final List<ScanModel> scans = snapshot.data;
        return scans.length == 0 ? _noData(context) : _body(scans, context);

      },
    );
  }

  Center _noData(BuildContext cont)=>Center(
    child:Column(children: <Widget>[
      Icon(Icons.error_outline, size: 100, color: getConfigColor(color: 'delete'),),
      Text('No hay información', style: Theme.of(cont).textTheme.headline2, textAlign: TextAlign.center,)
    ],crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,)
  );

  ListView _body(List<ScanModel> scans, BuildContext context) => ListView.builder(
    itemCount: scans.length,
    itemBuilder: (BuildContext cont, int i) => 
    Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => scansBloc.deleteScan(scans[i].id),
      child: Card(
        color: getConfigColor(color: 'label'),
        margin: EdgeInsets.symmetric(vertical: 3),
        elevation: 12,
        child: ListTile(
          leading: Icon(Icons.cloud_queue, color: Theme.of(cont).primaryColor,),
          title: Text(scans[i].value, style: Theme.of(cont).textTheme.bodyText1,),
          subtitle: Text('ID: ${scans[i].id}, Tipo: ${scans[i].type}'),
          trailing: Icon(
            Icons.keyboard_arrow_right, 
            color: getConfigColor(color: 'h1'), 
            size: 35),
          onTap: (){
            utils.openScan(scans[i],context);
          }
        ),
      ),
    )
  );
}