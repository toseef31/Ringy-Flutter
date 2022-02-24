import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/user_model.dart';
import 'package:ringy_flutter/ringy/domain/entities/connect/get_user_ring.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/api_content.dart';
import 'package:ringy_flutter/ringy/presentation/core/utils/data_travel_model.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/encryption_utils.dart';
import 'package:ringy_flutter/ringy/presentation/home/connect/screens/pages/widgets/image_or_first_character.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'package:auto_route/auto_route.dart';


import '../../../../../routes/router.dart';
class UserItemTile extends StatelessWidget {
  final UsersModel model;

  UserItemTile({required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ()=> {
        nextPage(context,model),

      },
      child: ListTile(
        horizontalTitleGap: 10,
        title: Text(model.userName),
        subtitle: Text(model.latestMsg==null?"No Chat":EncryptData.decryptAES(model.latestMsg!.message, model.latestMsg!.senderId) ,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RingyColors.primaryColor),
        ),
        leading: ImageOrFirstCharacter(
            radius: 22, imageUrl: model.pImage, name: model.userName),
        trailing: const Text("12:00"),
      ),
    );
  }

   nextPage(BuildContext context,UsersModel model) {
  TmpDataTravel tmpDataTravel =  TmpDataTravel();
  tmpDataTravel.name = model.userName;
  tmpDataTravel.image = model.pImage;
  tmpDataTravel.recieverId = model.sId;


  context.pushRoute(ChatScreenRoute(dataTravel: tmpDataTravel));
  }
}