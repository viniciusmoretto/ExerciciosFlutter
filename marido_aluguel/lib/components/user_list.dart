import 'package:flutter/material.dart';
import 'package:marido_aluguel/models/user.dart';

class UserList extends StatelessWidget {
  final User user;
  const UserList(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.photo == null || user.photo.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.photo));

    return ListTile(
      leading: avatar,
      title: Text(user.user),
      subtitle: Text(user.email),
      trailing: Text(user.district),
    );
  }
}
