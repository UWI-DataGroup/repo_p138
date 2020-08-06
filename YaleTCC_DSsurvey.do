** CHANGE THIS FOR RE-RUN ON NEW COMPUTER
cd "X:\The UWI - Cave Hill Campus\DataGroup - repo_data\data_p138\version01\1-input"


** CLOSE ANY OPEN LOG FILE AND OPEN A NEW LOG FILE
	capture log close
	log using "YaleTCC_DSsurvey.smcl", replace

**  GENERAL DO-FILE COMMENTS
//  project:      Yale-TCC Data Sharing Survey
//  author:       HAMBLETON, WHITEMAN, JEYASEELAN \ 30-JUL-2020
//  description:  Data Analysis for the Yale-TCC Data Sharing Survey

** DO-FILE SECTION 00
** DO-FILE SET UP COMMANDS
version 16
clear all

** DO-FILE SECTION 01 - Importing the data set

import delimited record_id redcap_survey_identifier response_type_timestamp response_type response_type_complete consent_timestamp consent01 consent02 consent_complete demographics_timestamp gender age_group country island organization occupation occupation_other occapation_status experience demographics_complete data_sharing_behavio_v_0 dh_01 dh_03 dh_02 ds_01a ds_01b ds_01c ds_01d ds_01e ds_01f ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 ds_11 ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29 data_sharing_behavio_v_1 data_sharing_prefere_v_2 dahp_know01 dahp_know02 dahp_know03 dahp_know04 dahp_know06 security1 security2 data_sharing_prefere_v_3 for_university_staff_timestamp fr_01 fr_02 fr_03 fr_04 for_university_staff_complete personal_data_timestamp dp_1 dp_2 dp_3 dp_4 dp_5 dp_6 dp_7 dp_8 dp_9 dp_10 dp_11 personal_data_complete end_timestamp end_01 end_02___1 end_02___2 end_03 end_complete using "YaleTCCDataSurvey202_DATA_NOHDRS_2020-07-30_1134.csv", varnames(nonames)

label data "YaleTCCDataSurvey202_DATA_NOHDRS_2020-07-30_1134.csv"

label define response_type_ 0 "I am completing this survey individually" 1 "An interviewer is asking me the survey questions" 
label define response_type_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define consent01_ 1 "I have read a survey information sheet and agree to take part" 2 "I would like to review the survey information sheet on screen" 
label define consent02_ 1 "I have read a survey information sheet and agree to take part" 2 "I DO NOT wish to take part" 
label define consent_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define gender_ 0 "Female" 1 "Male" 2 "Prefer not to say" 
label define age_group_ 0 "18 -29" 1 "30-39" 2 "40-49" 3 "50-59" 4 "60-69" 5 "70+" 
label define country_ 0 "Caribbean" 1 "North America" 2 "Central America" 3 "South America" 4 "United Kingdom" 5 "Europe" 6 "Asia" 7 "Africa" 8 "Australia / New Zealand" 9 "Pacific Islands" 
label define island_ 1 "Anguilla" 2 "Antigua and Barbuda" 3 "Bahamas" 4 "Barbados" 5 "Belize" 6 "Bermuda" 7 "British Virgin Islands" 8 "Cayman Islands" 9 "Dominica" 10 "Grenada" 11 "Guyana" 12 "Haiti" 13 "Jamaica" 14 "Montserrat" 15 "Puerto Rico" 16 "Saint Lucia" 17 "Saint Kitts and Nevis" 18 "Saint Vincent and the Grenadines" 19 "Suriname" 20 "Trinidad and Tobago" 21 "Turks and Caicos Islands" 22 "U.S Virgin Islands" 23 "Other" 
label define organization_ 0 "University" 1 "Government Organization" 2 "Non-Government Organization" 3 "Private Company" 
label define occupation_ 0 "Administration" 1 "Research Assistant" 2 "Graduate Student (PhD)" 3 "Post-Doctoral Researcher" 4 "Assistant Lecturer" 5 "Lecturer" 6 "Senior Lecturer" 7 "Associate Professor" 8 "Professor" 9 "Dean" 10 "Other" 
label define occapation_status_ 0 "Part-time" 1 "Full-time" 
label define experience_ 0 "1-3 years" 1 "3-5 years" 2 "6-10 years" 3 "11-15 years" 4 "15 + years" 
label define demographics_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define dh_01_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define dh_03_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define dh_02_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01a_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01b_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01c_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01d_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01e_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01f_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_02_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_03_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_04_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_05_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_06_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_07_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_08_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_09_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_10_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_11_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_12_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_13_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_14_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_15_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_16_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_17_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_18_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_19_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_20_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_21_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_22_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_23_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_24_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_25_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_26_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_27_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_28_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define ds_29_ 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 
label define data_sharing_behavio_v_1_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define security1_ 0 "Not at all concerned" 1 "Somewhat concerned" 2 "Moderately concerned" 3 "Very concerned" 4 "Extremely concerned" 
label define security2_ 0 "Not at all concerned" 1 "Somewhat concerned" 2 "Moderately concerned" 3 "Very concerned" 4 "Extremely concerned" 
label define data_sharing_prefere_v_3_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define fr_01_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define fr_02_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define for_university_staff_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define dp_6_ 1 "Yes" 0 "No" 
label define dp_7_ 1 "Yes" 0 "No" 
label define dp_8_ 1 "Yes" 0 "No" 
label define dp_9_ 1 "Yes" 0 "No" 
label define dp_10_ 1 "Yes" 0 "No" 
label define dp_11_ 1 "Yes" 0 "No" 
label define personal_data_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define end_01_ 1 "Yes - Im happy to leave my email address" 2 "No - I prefer not to leave my email address" 
label define end_02___1_ 0 "Unchecked" 1 "Checked" 
label define end_02___2_ 0 "Unchecked" 1 "Checked" 
label define end_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 

label values response_type response_type_
label values response_type_complete response_type_complete_
label values consent01 consent01_
label values consent02 consent02_
label values consent_complete consent_complete_
label values gender gender_
label values age_group age_group_
label values country country_
label values island island_
label values organization organization_
label values occupation occupation_
label values occapation_status occapation_status_
label values experience experience_
label values demographics_complete demographics_complete_
label values dh_01 dh_01_
label values dh_03 dh_03_
label values dh_02 dh_02_
label values ds_01a ds_01a_
label values ds_01b ds_01b_
label values ds_01c ds_01c_
label values ds_01d ds_01d_
label values ds_01e ds_01e_
label values ds_01f ds_01f_
label values ds_02 ds_02_
label values ds_03 ds_03_
label values ds_04 ds_04_
label values ds_05 ds_05_
label values ds_06 ds_06_
label values ds_07 ds_07_
label values ds_08 ds_08_
label values ds_09 ds_09_
label values ds_10 ds_10_
label values ds_11 ds_11_
label values ds_12 ds_12_
label values ds_13 ds_13_
label values ds_14 ds_14_
label values ds_15 ds_15_
label values ds_16 ds_16_
label values ds_17 ds_17_
label values ds_18 ds_18_
label values ds_19 ds_19_
label values ds_20 ds_20_
label values ds_21 ds_21_
label values ds_22 ds_22_
label values ds_23 ds_23_
label values ds_24 ds_24_
label values ds_25 ds_25_
label values ds_26 ds_26_
label values ds_27 ds_27_
label values ds_28 ds_28_
label values ds_29 ds_29_
label values data_sharing_behavio_v_1 data_sharing_behavio_v_1_
label values security1 security1_
label values security2 security2_
label values data_sharing_prefere_v_3 data_sharing_prefere_v_3_
label values fr_01 fr_01_
label values fr_02 fr_02_
label values for_university_staff_complete for_university_staff_complete_
label values dp_6 dp_6_
label values dp_7 dp_7_
label values dp_8 dp_8_
label values dp_9 dp_9_
label values dp_10 dp_10_
label values dp_11 dp_11_
label values personal_data_complete personal_data_complete_
label values end_01 end_01_
label values end_02___1 end_02___1_
label values end_02___2 end_02___2_
label values end_complete end_complete_



label variable record_id "Record ID"
label variable redcap_survey_identifier "Survey Identifier"
label variable response_type_timestamp "Survey Timestamp"
label variable response_type "W..."
label variable response_type_complete "Complete?"
label variable consent_timestamp "Survey Timestamp"
label variable consent01 "Please record your consent to take part in...on data sharing"
label variable consent02 "Please record your consent to take part in...on data sharing"
label variable consent_complete "Complete?"
label variable demographics_timestamp "Survey Timestamp"
label variable gender "Gender"
label variable age_group "Age group"
label variable country "What region do you currently reside in?"
label variable island "Which Caribbean island do you currently reside in?"
label variable organization "Which type professional organization are yo...ssociated with?"
label variable occupation "What is your current position?"
label variable occupation_other "Please specify what is  your current job title"
label variable occapation_status "Are you currently full-time or part-time?"
label variable experience "Years of Experience in the research field"
label variable demographics_complete "Complete?"
label variable data_sharing_behavio_v_0 "Survey Timestamp"
label variable dh_01 "I collect data as part of my job"
label variable dh_03 "I analyse data as part of my job"
label variable dh_02 "I manage data as part of my job"
label variable ds_01a "I share data"
label variable ds_01b "I share data with others in my department"
label variable ds_01c "I share data with others in my organization"
label variable ds_01d "I share data with people from other organizations"
label variable ds_01e "I am happy to share data with others"
label variable ds_01f "I share data via an online repository"
label variable ds_02 "I dont think there is a need to share the...have collected"
label variable ds_03 "Other people would not be interested in my data"
label variable ds_04 "Data sharing requires reliable internet"
label variable ds_05 "I am concerned that others will misinterpre...a I have shared"
label variable ds_06 "If I share my data, others will benefit fro...ll my hard work"
label variable ds_07 "If I share my data, I cannot control how th...ta are analysed"
label variable ds_08 "Data sharing is vital to allow my work to b...irmed by others"
label variable ds_09 "No-one has ever asked me to share data"
label variable ds_10 "I am regularly asked to share data "
label variable ds_11 "I do not know how to share data"
label variable ds_12 "I have all the skills I need to share data"
label variable ds_13 "I help other people share their data"
label variable ds_14 "Sharing the entire dataset is usually the s...est thing to do"
label variable ds_15 "I would like training to help me to share data"
label variable ds_16 "My organization has no-one to help me share data"
label variable ds_17 "I have no time to share data"
label variable ds_18 "I do not have the funds needed to share data"
label variable ds_19 "My organization does not have the funds to share data"
label variable ds_20 "My organization does not allow data sharing"
label variable ds_21 "My organization has a policy to guide data sharing"
label variable ds_22 "My organization has no process for sharing data"
label variable ds_23 "I have no way of securely sharing my data with colleagues"
label variable ds_24 "My organization provides a way of encryptin...to a colleague"
label variable ds_25 "I am concerned about who would access my shared data"
label variable ds_26 "I am concerned about the security of my shared data"
label variable ds_27 "I am not comfortable sharing data that cont...lth information"
label variable ds_28 "I need consent from participants before I c...hare their data"
label variable ds_29 "My data contains information that identifie...ymised dataset."
label variable data_sharing_behavio_v_1 "Complete?"
label variable data_sharing_prefere_v_2 "Survey Timestamp"
label variable dahp_know01 "Time needed to share"
label variable dahp_know02 "Funds needed to share"
label variable dahp_know03 "Data confidentiality"
label variable dahp_know04 "Permission from my employers"
label variable dahp_know06 "Concern about data misuse by others"
label variable security1 "How concerned are you regarding the security of your data?"
label variable security2 "How concerned are you regarding the security of your emails?"
label variable data_sharing_prefere_v_3 "Complete?"
label variable for_university_staff_timestamp "Survey Timestamp"
label variable fr_01 "I share research  data with study participants"
label variable fr_02 "I share research data with the community of...t from my study"
label variable fr_03 "Permission from study participants is an im...re I share data"
label variable fr_04 "Concern about recognition for my work is an...re I share data"
label variable for_university_staff_complete "Complete?"
label variable personal_data_timestamp "Survey Timestamp"
label variable dp_1 "How would you rate your knowledge of your privacy rights?"
label variable dp_2 "In general, how concerned are you about the...f your privacy?"
label variable dp_3 "Please rate the extent to which you agree o...sonal privacy."
label variable dp_4 "Please rate the extent to which you agree o...10 years ago."
label variable dp_5 "Please rate the extent to which you agree o...organizations."
label variable dp_6 "Do you use the Internet? "
label variable dp_7 "Do you use a mobile device, such as a smart phone or tablet?"
label variable dp_8 "Do you adjust settings on your smartphone o...re with others?"
label variable dp_9 "Do you read the privacy policy for apps bef...download them?"
label variable dp_10 "Do you think about the security of data whe...wifi services?"
label variable dp_11 "Do you not install, or uninstall apps if yo...ked to provide?"
label variable personal_data_complete "Complete?"
label variable end_timestamp "Survey Timestamp"
label variable end_01 "Are you happy for us to collect and securel...email address?"
label variable end_02___1 "How may we use your email address?  (choice=Please send m...this study)"
label variable end_02___2 "How may we use your email address?  (choice=You may conta...xperiences)"
label variable end_03 "You can add your email address here:"
label variable end_complete "Complete?"

order record_id redcap_survey_identifier response_type_timestamp response_type response_type_complete consent_timestamp consent01 consent02 consent_complete demographics_timestamp gender age_group country island organization occupation occupation_other occapation_status experience demographics_complete data_sharing_behavio_v_0 dh_01 dh_03 dh_02 ds_01a ds_01b ds_01c ds_01d ds_01e ds_01f ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 ds_11 ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29 data_sharing_behavio_v_1 data_sharing_prefere_v_2 dahp_know01 dahp_know02 dahp_know03 dahp_know04 dahp_know06 security1 security2 data_sharing_prefere_v_3 for_university_staff_timestamp fr_01 fr_02 fr_03 fr_04 for_university_staff_complete personal_data_timestamp dp_1 dp_2 dp_3 dp_4 dp_5 dp_6 dp_7 dp_8 dp_9 dp_10 dp_11 personal_data_complete end_timestamp end_01 end_02___1 end_02___2 end_03 end_complete 
set more off

save "X:\The UWI - Cave Hill Campus\DataGroup - repo_data\data_p138\version01\2-working\YaleTCC_DSsurvey.dta"