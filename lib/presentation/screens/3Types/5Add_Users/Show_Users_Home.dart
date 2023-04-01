import 'package:admin/business_logic/Types/6Get_Users/Get_Users_State.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/6Get_Users/Get_Users_Cubit.dart';
import '../../../../shared/components/1Tooles/5Custom_Navigate.dart';
import 'Add_User_Home.dart';

class Show_Users_Screen extends StatelessWidget {
  const Show_Users_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            navigateTo(context, AddUserTasksScreen());
          },
        ),
        body: BlocProvider(
          create: (context) => Get_Users_Cubit()..fetchAllUsers(),
          child: BlocBuilder<Get_Users_Cubit, Get_Users_States>(
            builder: (context, state) {
              Get_Users_Cubit cubit = Get_Users_Cubit.get(context);

              return ListView.builder(
                itemCount: cubit.users.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons
                              .person), // icon to display on the left side of the tile
                          title: Text(cubit.users[index].name
                              .toString()), // main text to display in the tile
                          subtitle: Text(cubit.users[index].email
                              .toString()), // secondary text to display below the main text
                          trailing: Container(
                            width: 150,
                            height: 50,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Text(cubit.users[index].token!
                                      .toSet()
                                      .length
                                      .toString()),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    cubit.DeleteUsers(
                                        Id: cubit.users[index].uId.toString());
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ), // icon to display on the right side of the tile
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 3,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ));
  }
}
