** HEADER -----------------------------------------------------
**  DO-FILE METADATA
    //  algorithm name			data_sharing_carpha_001.do
    //  project:				Analysis of CAIHR projects
    //  analysts:				Ian HAMBLETON
    // 	date last modified	    14-JULY-2019
    //  algorithm task			

    ** General algorithm set-up
    version 16
    clear all
    macro drop _all
    set more 1
    set linesize 80

    ** Set working directories: this is for DATASET and LOGFILE import and export
    ** DATASETS to encrypted SharePoint folder
    local datapath "X:\The University of the West Indies\DataGroup - repo_data\data_p138"
    ** LOGFILES to unencrypted OneDrive folder
    local logpath "X:\OneDrive - The University of the West Indies\repo_datagroup\repo_p138"

    ** Close any open log fileand open a new log file
    capture log close
    cap log using "`logpath'\project_analysis_001", replace
** HEADER -----------------------------------------------------

#delimit ;
    import delimited record_id redcap_survey_identifier 
    carpha_consent_timestamp consent01 consent02 carpha_consent_complete carpha_datasharing_timestamp dh_text_quant_show___1
    dh_01 dh_text_qual_show___1 dh_02 dh_text_dataman_show___1 dh_03 dh_04 dh_text_analysis_show___1
    dh_05 ds_01a ds_01b ds_01c ds_01d ds_01e ds_01f ds_01g ds_01h ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 
    ds_11 ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29 
    d_01 d_02 d_03 d_04 d_04other d_05 d_05other d_06 d_06other d_08 d_09___1 d_09___2 d_10 carpha_datasharing_complete 
    using "`datapath'\version01\1-input\CARPHADataSharing_DATA_NOHDRS_2019-07-14_0615.csv", varnames(nonames);
#delimit cr 

label data "CARPHA DataSharing Questionnaire: June 2019"

** Define variable labels 
label define consent01_ 1 "I have read a survey information sheet and agree to take part" 2 "I would like to review the survey information sheet on screen" 
label define consent02_ 1 "I have read a survey information sheet and agree to take part" 2 "I DO NOT wish to take part" 
label define carpha_consent_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define dh_text_quant_show___1_ 0 "Unchecked" 1 "Checked" 
label define dh_01_ 1 "Yes" 0 "No" 
label define dh_text_qual_show___1_ 0 "Unchecked" 1 "Checked" 
label define dh_02_ 1 "Yes" 0 "No" 
label define dh_text_dataman_show___1_ 0 "Unchecked" 1 "Checked" 
label define dh_03_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define dh_04_ 1 "Yes it is" 2 "No it isnt" 
label define dh_text_analysis_show___1_ 0 "Unchecked" 1 "Checked" 
label define dh_05_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01a_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01b_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01c_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01d_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01e_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01f_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01g_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
label define ds_01h_ 1 "Always" 2 "Very often" 3 "Sometimes" 4 "Rarely" 5 "Never" 
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
label define d_01_ 1 "18-29" 2 "30-39" 3 "40-49" 4 "50+" 
label define d_02_ 1 "Female" 2 "Male" 
label define d_03_ 1 "1-5 years" 2 "5-10 years" 3 "10+ years" 
label define d_04_ 1 "Public sector, Government" 2 "Education or Research" 3 "Private Sector" 4 "Non-profit" 5 "Other" 
label define d_05_ 1 "The University of the West Indies - Cave Hill" 2 "The University of the West Indies - Mona" 3 "The University of the West Indies - St Augustine" 4 "The University of the West Indies - Open Campus" 5 "The University of Trinidad and Tobago" 6 "University of Guyana" 7 "Other University" 8 "Other Education Institution" 
label define d_06_ 1 "Humanities and Education" 2 "Medical Sciences" 3 "Social Sciences" 4 "Law" 5 "Science & Technology" 6 "Engineering" 7 "Food & Agriculture" 8 "Sport" 9 "Other" 
label define d_08_ 1 "Yes - Im happy to leave my email address" 2 "No - I prefer not to leave my email address" 
label define d_09___1_ 0 "Unchecked" 1 "Checked" 
label define d_09___2_ 0 "Unchecked" 1 "Checked" 
label define carpha_datasharing_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 

** Attach labels to variables
label values consent01 consent01_
label values consent02 consent02_
label values carpha_consent_complete carpha_consent_complete_
label values dh_text_quant_show___1 dh_text_quant_show___1_
label values dh_01 dh_01_
label values dh_text_qual_show___1 dh_text_qual_show___1_
label values dh_02 dh_02_
label values dh_text_dataman_show___1 dh_text_dataman_show___1_
label values dh_03 dh_03_
label values dh_04 dh_04_
label values dh_text_analysis_show___1 dh_text_analysis_show___1_
label values dh_05 dh_05_
label values ds_01a ds_01a_
label values ds_01b ds_01b_
label values ds_01c ds_01c_
label values ds_01d ds_01d_
label values ds_01e ds_01e_
label values ds_01f ds_01f_
label values ds_01g ds_01g_
label values ds_01h ds_01h_
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
label values d_01 d_01_
label values d_02 d_02_
label values d_03 d_03_
label values d_04 d_04_
label values d_05 d_05_
label values d_06 d_06_
label values d_08 d_08_
label values d_09___1 d_09___1_
label values d_09___2 d_09___2_
label values carpha_datasharing_complete carpha_datasharing_complete_

** Variable labelling 
label variable record_id "Record ID"
label variable redcap_survey_identifier "Survey Identifier"
label variable carpha_consent_timestamp "Survey Timestamp"
label variable consent01 "Please record your consent to take part in our survey on data sharing"
label variable consent02 "Please record your consent to take part in our survey on data sharing"
label variable carpha_consent_complete "Complete?"
label variable carpha_datasharing_timestamp "Survey Timestamp"
label variable dh_text_quant_show___1 "Show me a definition of quantitative data (choice=)"
label variable dh_01 "I collect quantitative data as part of my job"
label variable dh_text_qual_show___1 "Show me a definition of qualitative data (choice=)"
label variable dh_02 "I collect qualitative data as part of my job"
label variable dh_text_dataman_show___1 "Show me a definition of data management (choice=)"
label variable dh_03 "I manage data"
label variable dh_04 "Managing data is a regular part of my job"
label variable dh_text_analysis_show___1 "Show me a definition of data analysis (choice=)"
label variable dh_05 "I analyse data"
label variable ds_01a "I share research data"
label variable ds_01b "I share research data with others in my department"
label variable ds_01c "I share research data with others in my organisation"
label variable ds_01d "I share research data with people from other organisations"
label variable ds_01e "I am happy to share research data with others"
label variable ds_01f "I share research data via an online repository"
label variable ds_01g "I share research data with study participants"
label variable ds_01h "I share research data with the community of interest from my study"
label variable ds_02 "There is no need to share the data I or others in my organisation have collected"
label variable ds_03 "Other people would not be interested in my data"
label variable ds_04 "Data sharing requires reliable internet"
label variable ds_05 "I am concerned that others will misinterpret the data I have shared"
label variable ds_06 "If I share my data, others will benefit from all my hard work"
label variable ds_07 "If I share my data, I cannot control how the data are analysed"
label variable ds_08 "Data sharing is vital to allow my work to be confirmed by others"
label variable ds_09 "No-one has ever asked me to share data"
label variable ds_10 "I am regularly asked to share data "
label variable ds_11 "I do not know how to share data"
label variable ds_12 "I have all the skills I need to share data"
label variable ds_13 "I help other people share their data"
label variable ds_14 "Sharing the entire dataset is usually the simplest thing to do"
label variable ds_15 "I would like training to help me to share data"
label variable ds_16 "My organisation has no-one to help me share data"
label variable ds_17 "I have no time to share data"
label variable ds_18 "I do not have the funds needed to share data"
label variable ds_19 "My organisation does not have the funds to share data"
label variable ds_20 "My organisation does not allow data sharing"
label variable ds_21 "My organisation has a policy to guide data sharing"
label variable ds_22 "My organisation has no process for sharing data"
label variable ds_23 "I have no way of securely sharing my data with colleagues"
label variable ds_24 "My organisation provides a way of encrypting my data before sending"
label variable ds_25 "I am concerned about who would access my shared data"
label variable ds_26 "I am concerned about the security of my shared data"
label variable ds_27 "I am not comfortable sharing data that contains personal health information"
label variable ds_28 "I need consent from participants before I can share their data"
label variable ds_29 "My data contains identifying information-Im not sure how to anonymise"
label variable d_01 "What is your age?"
label variable d_02 "What is your sex?"
label variable d_03 "How long have you been working in your field of expertise?"
label variable d_04 "What sector best describes the organisation for which you work?"
label variable d_04other "You selected other, please state the sector in which you work"
label variable d_05 "What University or Educational Institution are you affiliated with?"
label variable d_05other "You selected other, please enter the name of your institution"
label variable d_06 "What is your university faculty?"
label variable d_06other "You selected other, please provide your University Faculty"
label variable d_08 "Are you happy for us to collect and securely keep your email address?"
label variable d_09___1 "How may we use your email address?  (Send me the study results)"
label variable d_09___2 "How may we use your email address?  (You may contact me)"
label variable d_10 "You can add your email address here:"
label variable carpha_datasharing_complete "Complete?"

#delimit ; 
order record_id redcap_survey_identifier carpha_consent_timestamp consent01 consent02 carpha_consent_complete 
    carpha_datasharing_timestamp dh_text_quant_show___1 
    dh_01 dh_text_qual_show___1 dh_02 dh_text_dataman_show___1 dh_03 dh_04 dh_text_analysis_show___1 dh_05 ds_01a 
    ds_01b ds_01c ds_01d ds_01e ds_01f ds_01g ds_01h ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 ds_11 
    ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29 
    d_01 d_02 d_03 d_04 d_04other d_05 d_05other d_06 d_06other d_08 d_09___1 d_09___2 d_10 carpha_datasharing_complete 
    ;
#delimit cr 

set more off
describe

** Drop the incomplete entries
** Which are primarily related to TESTING the database  
drop if carpha_consent_complete==0
drop if carpha_datasharing_complete==0
** Collect quantitative data - the key variable - drop if not entered
drop if dh_01==. 
drop if d_10 == "jacqueline.campbell@cavehill.uwi.edu"
drop if d_05other == "Yale - this is Meredith please delete! "

** Save the dataset
save "`datapath'\version01\2-working\carpha_datasharing_001", replace 
