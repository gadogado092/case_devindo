import 'package:case_devindo/blocs/kategory/kategory_bloc.dart';
import 'package:case_devindo/blocs/kategory/kategory_event.dart';
import 'package:case_devindo/blocs/kategory/kategory_state.dart';
import 'package:case_devindo/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KategoryTab extends StatefulWidget {
  const KategoryTab({Key? key}) : super(key: key);

  @override
  _KategoryTabState createState() => _KategoryTabState();
}

class _KategoryTabState extends State<KategoryTab> {
  late KategoryBloc _kategoryBloc;

  @override
  void initState() {
    
    // _kategoryBloc = BlocProvider.of<KategoryBloc>(context);
    _kategoryBloc = context.read<KategoryBloc>();
    // _kategoryBloc = BlocProvider.of(this.context);
    _kategoryBloc.add(FetchKategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text('Ceritanya Search'),
        ),
        // Expanded(child: BlocBuilder<KategoryBloc, KategoryState>(
        //   builder: (context, state) {
        //     if (state is KategoryLoadSuccess) {
        //       return ListView.builder(
        //           itemCount: state.listKategory.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             return CategoryItem(state.listKategory[index]);
        //           });
        //     }

        //     return Container();
        //   },
        // ))
      ],
    );
  }
}
