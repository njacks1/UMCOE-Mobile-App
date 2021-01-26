import 'package:flutter/material.dart';
import 'package:coe_mobile_app/constants/color_constant.dart';
import 'package:coe_mobile_app/constants/fonts.dart';

//Events Page

const TextStyle kEventsPage_TitleTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: fontWeightSemiBold,
    fontSize: fontSizeSubHeading,
    color: kEvent_HeadingTextColor);

const TextStyle kEventsPage_eventNameTextStyle = TextStyle(
fontFamily: font,
fontWeight: fontWeightSemiBold,
fontSize: fontSizeTitle);

const TextStyle kEventsPage_eventDescriptionTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: fontWeightLight,
    fontSize: fontSizeText);

const TextStyle kEventsPage_timeLabelTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeTitle,
    color: kEvent_BodyTextColor);

const TextStyle kEventsPage_timeTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeTitle,
    color: kEvent_TimeTextColor);

const TextStyle kEventsPage_eventDateTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: fontWeightLight,
    fontSize: fontSizeText);

//Tutoring Page
const TextStyle kTutoringPage_acroynmTextStyle = TextStyle(
fontFamily: font1,
fontWeight: fontWeightDemiBold,
fontSize: fontSizeSubHeading);


//HKN Page
const TextStyle kHknPage_tutorTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: fontWeightMediumLight,
    fontSize: fontSizeText,
    color: kHknTutorTextColor);

const TextStyle kHknPage_DayTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: fontWeightSemiBold,
    fontSize: fontSizeText,
    color: kHkn_DayTextColor);

//Setting Page
const TextStyle kSettingPage_nameTextStyle = TextStyle(
fontWeight: fontWeightSemiBold,
fontSize: fontSizeTitle,
color: kSetting_NameTextColor);

const TextStyle kSettingPage_fieldTextStyle = TextStyle(
fontSize: fontSizeText,
color: kSetting_FieldColor);

const TextStyle kSettingPage_subfieldTextStyle = TextStyle(
fontSize: fontSizeSubText,
color: kSetting_FieldSubColor);