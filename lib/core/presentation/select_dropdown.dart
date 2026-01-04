// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:coinranking/core/config/colors_constant.dart';
// import 'package:coinranking/core/presentation/custom_bottom_modal.dart';

// class SelectDropdown extends StatefulWidget {
//   final String text;

//   final Function({required String name, required String xid, required int id})?
//   onChanged;
//   const SelectDropdown({
//     super.key,
//     required this.text,
//     required this.onChanged,
//   });

//   @override
//   State<SelectDropdown> createState() => _SelectDropdownState();
// }

// class _SelectDropdownState extends State<SelectDropdown> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<XAccountCubit>().fetchXaccount();
//     });
//     super.initState();
//   }

//   void _onSenderAccountSelected({
//     required String name,
//     required String profileImage,
//     required String xid,
//     required int id,
//     required BuildContext context,
//   }) {
//     if (widget.onChanged == null) {
//       return;
//     } else {
//       widget.onChanged!(name: name, xid: xid, id: id);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: ColorsConstant.stroke),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               widget.text,
//               style: Theme.of(
//                 context,
//               ).textTheme.bodySmall?.copyWith(fontSize: 16),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               showBlurryModalBottomSheet(
//                 child: SelectSenderAccount(
//                   accountName: '',
//                   onSenderAccountSelected:
//                       ({
//                         required name,
//                         required profileImage,
//                         required xid,
//                         id,
//                       }) {
//                         _onSenderAccountSelected(
//                           name: name,
//                           profileImage: profileImage,
//                           xid: xid,
//                           id: id ?? 0,
//                           context: context,
//                         );
//                       },
//                 ),
//                 context: context,
//               );
//             },
//             child: Icon(
//               Icons.keyboard_arrow_down,
//               size: 20,
//               color: ColorsConstant.greyText,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
