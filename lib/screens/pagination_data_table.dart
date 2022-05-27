//               ///////////7
// import 'package:flutter/material.dart';
// import 'package:shazaflutter/model/person.dart';

// class PaginationDataTable extends StatefulWidget {
//   @override
//   PaginationDataTableState createState() => new PaginationDataTableState();
// }

// class PaginationDataTableState extends State<PaginationDataTable> {
//   List<Persons> PersonsLst=<Persons>[
//     Persons(1,"Alex","Anderson","9.00am"),
//     Persons(2,"John","Anderson","12:40am"),
//     Persons(3,"Alex","Anderson","10:27pm"),
//     Persons(4,"John","Anderson","10.00pm"),
//     Persons(5,"Alex","Anderson","02.58am"),
//     Persons(6,"John","Anderson","4:50pm"),
//     Persons(7,"Alex","Anderson","1:15pm"),
//     Persons(8,"John","Anderson","5:30am"),
//     Persons(9,"Alex","Anderson","5:30am"),
//     Persons(10,"Alex","Anderson","5:30am"),
//     Persons(11,"John","Anderson","5:30am"),
//     Persons(12,"Alex","Anderson","5:30am"),
//     Persons(12,"John","Anderson","5:30am"),
//     Persons(13,"Alex","Anderson","5:30am"),
//     Persons(14,"John","Anderson","5:30am"),
//     Persons(15,"Alex","Anderson","5:30am"),
//     Persons(16,"John","Anderson","5:30am"),
//     Persons(17,"Alex","Anderson","8:39am"),
//     Persons(18,"Alex","Anderson","5:22am"),
//     Persons(19,"John","Anderson","9:19am"),
//     Persons(20,"Alex","Anderson","5:13am"),
//     Persons(21,"John","Anderson","5:39am"),
//     Persons(22,"Alex","Anderson","5:58am"),
//     Persons(23,"John","Anderson","9:12am"),
//     Persons(24,"Alex","Anderson","6:38am"),
//     Persons(25,"John","Anderson","5:31am"),
//     Persons(26,"Alex","Anderson","9:30am"),
//     Persons(27,"Alex","Anderson","5:39am"),
//   ];


//   @override
//   void initState() {
//     super.initState();
//   }

//   refreshList() {
//     setState(() {
//       PersonsLst=PersonsLst;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return 
//       Scaffold(
//       appBar: AppBar(
//         title: Text("Client History"),
//       ),
//       body:SingleChildScrollView(
//         child: PaginatedDataTable(
//               rowsPerPage:4,
//               header :Text("Client History"),
//               columns: [
//                 DataColumn(label: Text("Count"),),
//                 DataColumn(label: Text("Name"),),
//                 DataColumn(label: Text("LastName"),),
//                 DataColumn(label: Text("Time"),),  
//               ],
//               source:UserDataTableSource(userData:PersonsLst)
//             ),
//         ),
      
//     );
//   }
// }





// class UserDataTableSource extends DataTableSource {
//   UserDataTableSource({
//     required List<Persons> userData,
//   })  : _userData = userData,
//         assert(userData != null);

//   final List<Persons> _userData;

//   @override
//   DataRow? getRow(int index) {
//     assert(index >= 0);

//     if (index >= _userData.length) {
//       return null;
//     }
//     final _user = _userData[index];

//     return DataRow.byIndex(
//       index: index,
//       cells: <DataCell>[
//         DataCell(Text('${_user.Count}')),
//         DataCell(Text('${_user.Name}')),
//         DataCell(Text('${_user.LastName}')),
//         DataCell(Text('${_user.Time}')),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => _userData.length;

//   @override
//   int get selectedRowCount => 0;


//   void sort<T>(Comparable<T> Function(Persons d) getField, bool ascending) {
//     _userData.sort((a, b) {
//       final aValue = getField(a);
//       final bValue = getField(b);
//       return ascending
//           ? Comparable.compare(aValue, bValue)
//           : Comparable.compare(bValue, aValue);
//     });

//     notifyListeners();
//   }
// }