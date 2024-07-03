import 'package:base_uncia/constants/colors.dart';
import 'package:base_uncia/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonAppbar extends StatelessWidget implements PreferredSizeWidget{
  final bool isSearch;
  final Function(String)? onChanged;
  const CommonAppbar({super.key,this.isSearch = false,this.onChanged});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.appBarColor,
      elevation: 0,
      leadingWidth: 25.w,
      leading: Icon(Icons.menu_sharp,size: 35.sp,color: AppColor.white,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.iciciLogo,height: 32.h,width: 32.w,),
          Expanded(child: Container()),
          isSearch ? InkWell(
            onTap: (){

            },
            child: Icon(Icons.search,color: AppColor.white,size: 24.sp,),
          ) : Container(),
          Stack(
            children: [
              Icon(Icons.notifications_none_outlined,color: AppColor.white,size: 24.sp,),
              Positioned(
                right: 4.w,
                top: 1.h,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.green,
                  ),
                  width: 7.w,
                  height: 7.w,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}