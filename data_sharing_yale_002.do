** HEADER -----------------------------------------------------
**  DO-FILE METADATA
    //  algorithm name			data_sharing_yale_001.do
    //  project:			Analysis of YALE data sharing survey
    //  analysts:			Ian HAMBLETON
    // 	date last modified	        20-Jan-2021
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
    cap log using "`logpath'\data_sharing_yale_001", replace
** HEADER -----------------------------------------------------

** Merging the 2 surveys
** SURVEY #1: YALE
** SURVEY #2: CARPHA
tempfile carpha yale 


** -----------------------------------------------------------------
** YALE-TCC
** -----------------------------------------------------------------
use "`datapath'\version01\2-working\yale_datasharing_001", clear
gen dataset = 1
** female = 1 , male = 2
recode gender 0=1 1=2
** 1=(18-29)  2=(30-39)  3=(40-49)  4=(50+) 
recode age_group (0=1) (1=2) (2=3) (3 4 5=4)
** 1=univ   2=gov  3=non-gov  4=private 
recode organization 0=1 1=2 2=3 3=4

#delimit ; 
keep    dataset ds_01a ds_01b ds_01c ds_01d ds_01e ds_01f 
        ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 ds_11 ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29
        gender age_group organization
        dahp_know01 dahp_know02 dahp_know03 dahp_know04 dahp_know06
        security1 security2 
        fr_01 fr_02 fr_03 fr_04 
        dp_1 dp_2 dp_3 dp_4 dp_5 dp_6 dp_7 dp_8 dp_9 dp_10 dp_11 
        ;
order   dataset ds_01a ds_01b ds_01c ds_01d ds_01e ds_01f 
        ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 ds_11 ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29
        gender age_group organization
        ;
#delimit cr
save `yale', replace 


** -----------------------------------------------------------------
**#2 CARPHA
** -----------------------------------------------------------------
use "`datapath'\version01\2-working\carpha_datasharing_001", clear 
gen dataset = 2
rename d_02 gender
rename d_01 age_group
rename d_04 organization
** 1=univ   2=gov  3=non-gov  4=private 
recode organization 1=2 2=1 3=4 4=3 
label define org_ 1 "univ" 2 "gov" 3 "non-gov" 4 "private", modify 
label values organization org_

** What sector best describes the organisation for which you work?
** Recoding other into sector groups (using d_04other)
replace organization = 3 if d_04other == "Regional Health Institute"
replace organization = 1 if d_04other == "Student"
replace organization = 1 if d_04other=="public sector/government, university of Guyana, social sciences"
replace organization = 2 if d_04other=="public sector/government, University of Guyana, medical sciences" 
replace organization = 1 if d_04other=="public sector/government, University of Guyana, Medical Sciences" 
replace organization = 1 if d_04other=="public sector/government, affiliated with Georgetown Public Hospital Corporation, Guyana" 
replace organization = 1 if d_04other=="public sector/government, University of West Indies: Mona, science & technology" 
replace organization = 1 if d_04other=="public sector/government, University of West Indies: St. Augustine, Medical Sciences" 
replace organization = 1 if d_04other=="public sector/government, university of Trinidad and Tobago, humanities/education, medical sciences, social sciences, law P.H., science & technology, food & agriculture, sport" 
replace organization = 1 if d_04other=="public sector/government, University of the Trinidad and Tobago, social sciences/health sciences" 
replace organization = 1 if d_04other=="public sector/government, University of the West Indies: Cave Hill, medical sciences" 
replace organization = 1 if d_04other=="private sector, The University of the West Indies: Cave Hill, medical sciences" 
replace organization = 4 if d_04other=="private sector, The University of the West Indies: Cave Hill, medical sciences"
replace organization = 1 if d_04other=="private sector, The University of West Indies: Cave Hill, medical sciences" 
replace organization = 4 if d_04other=="private sector, The University of West Indies: Cave Hill, medical sciences" 
replace organization = 1 if d_04other=="public sector/government, University of Guyana, medical sciences" 
replace organization = 1 if d_04other=="public sector/government, The University of the West Indies: St. Augustine, food & agriculture" 
replace organization = 1 if d_04other=="public sector/government, education/research, private sector, The University of the West Indies: St. Augustine, University of Guyana/TAU for MPH" 
replace organization = 1 if d_04other=="private sector, The University of the West Indies: Mona, Medical Sciences" 
replace organization = 4 if d_04other=="private sector, The University of the West Indies: Mona, Medical Sciences" 
replace organization = 1 if d_04other=="non-profit/University of Suriname/medical sciences" 
replace organization = 1 if d_04other=="public sector/government, The University of the West Indies: Cave Hill, medical sciences" 
replace organization = 1 if d_04other=="Student "
replace organization = 2 if d_04other=="Health"
drop d_04other 

#delimit ; 
keep    dataset ds_01a ds_01b ds_01c ds_01d ds_01e ds_01f 
        ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 ds_11 ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29
        gender age_group organization
        ds_01g ds_01h 
        ;
order   dataset ds_01a ds_01b ds_01c ds_01d ds_01e ds_01f 
        ds_02 ds_03 ds_04 ds_05 ds_06 ds_07 ds_08 ds_09 ds_10 ds_11 ds_12 ds_13 ds_14 ds_15 ds_16 ds_17 ds_18 ds_19 ds_20 ds_21 ds_22 ds_23 ds_24 ds_25 ds_26 ds_27 ds_28 ds_29
        gender age_group organization
        ds_01g ds_01h 
        ;
#delimit cr
save `carpha', replace 

** Join the TWO survey datasets
use `yale', clear 
append using `carpha' 

** Joint dataset labelling 
label define dataset_ 1 "yale" 2 "carpha" 
label values dataset dataset_
label var dataset "yale=1  carpha=2"

label define gender_ 1 "female" 2 "male" , modify
label values gender gender_

label define age_group_ 1 "18-29" 2 "30-39" 3 "40-49" 4 "50+" , modify
label values age_group age_group_

label define org_ 1 "univ" 2 "gov" 3 "non-gov" 4 "private", modify 
label values organization org_

drop if ds_02==. & ds_03==. & ds_04==. & ds_05==. & ds_06==. & ds_07==. & ds_08==. & ds_09==.

** Save the joint dataset
save "`datapath'\version01\2-working\joint_datasharing_001", replace

