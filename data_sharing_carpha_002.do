** HEADER -----------------------------------------------------
**  DO-FILE METADATA
    //  algorithm name			data_sharing_carpha_002.do
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
    cap log using "`logpath'\project_analysis_002", replace
** HEADER -----------------------------------------------------

** Load the dataset prepared in "data_sharing_CARPHA_001.do"
use "`datapath'\version01\2-working\carpha_datasharing_001", clear 


** ---------------------------------------------------
** TABLE 1. Data-Handling characteristics
** ---------------------------------------------------

** Age in groups
tab d_01 

** Sex
tab d_02 

** Years in field of expertise? 
tab d_03 

** What sector best describes the organisation for which you work?
** Recoding other into sector groups (using d_04other)
tab d_04 , gen(sector)
replace sector1 = 1 if d_04other == "Regional Health Institute"
replace sector2 = 1 if d_04other == "Student"
replace sector2 = 1 if d_04other=="public sector/government, university of Guyana, social sciences"
replace sector1 = 1 if d_04other=="public sector/government, University of Guyana, medical sciences" 
replace sector2 = 1 if d_04other=="public sector/government, University of Guyana, Medical Sciences" 
replace sector2 = 1 if d_04other=="public sector/government, affiliated with Georgetown Public Hospital Corporation, Guyana" 
replace sector2 = 1 if d_04other=="public sector/government, University of West Indies: Mona, science & technology" 
replace sector2 = 1 if d_04other=="public sector/government, University of West Indies: St. Augustine, Medical Sciences" 
replace sector2 = 1 if d_04other=="public sector/government, university of Trinidad and Tobago, humanities/education, medical sciences, social sciences, law P.H., science & technology, food & agriculture, sport" 
replace sector2 = 1 if d_04other=="public sector/government, University of the Trinidad and Tobago, social sciences/health sciences" 
replace sector2 = 1 if d_04other=="public sector/government, University of the West Indies: Cave Hill, medical sciences" 
replace sector2 = 1 if d_04other=="private sector, The University of the West Indies: Cave Hill, medical sciences" 
replace sector3 = 1 if d_04other=="private sector, The University of the West Indies: Cave Hill, medical sciences"
replace sector2 = 1 if d_04other=="private sector, The University of West Indies: Cave Hill, medical sciences" 
replace sector3 = 1 if d_04other=="private sector, The University of West Indies: Cave Hill, medical sciences" 
replace sector2 = 1 if d_04other=="public sector/government, University of Guyana, medical sciences" 
replace sector2 = 1 if d_04other=="public sector/government, The University of the West Indies: St. Augustine, food & agriculture" 
replace sector2 = 1 if d_04other=="public sector/government, education/research, private sector, The University of the West Indies: St. Augustine, University of Guyana/TAU for MPH" 
replace sector2 = 1 if d_04other=="private sector, The University of the West Indies: Mona, Medical Sciences" 
replace sector3 = 1 if d_04other=="private sector, The University of the West Indies: Mona, Medical Sciences" 
replace sector2 = 1 if d_04other=="non-profit/University of Suriname/medical sciences" 
replace sector2 = 1 if d_04other=="public sector/government, The University of the West Indies: Cave Hill, medical sciences" 

tab1 sector1 sector2 sector3 sector4


** If Education - what university 
tab d_05
tab d_05other 

** If University - what Faculty 
tab d_06 
tab d_06other 

** How many left an email address
tab d_08 

** DH_01. I collect quantitative data
tab dh_01 

** DH_02. I collect qualitative data
tab dh_02 

** DH_01 and DH_02. I collect Quantitative AND Qualitative data
tab dh_01 dh_02, cell 

** dh_03. FILTER: I manage data
** dh_04. Managing data is a regular part of my job
tab dh_03
tab dh_04

** dh_05. I analyse data
tab dh_05

** ds_01a. I share research data
** ds_01b  ... with others in my department
** ds_01c  ... with others in my organisation
** ds_01d  ... with people from other organisations
** ds_01e  ... happy to share with others
** ds_01f  ... I share via an online repository
** ds_01g  ... I share data with study participants
** ds_01h  ... I share data with the community of interest from my study
foreach var in a b c d e f g h {
    tab ds_01`var'
}


** ---------------------------------------------------
** TABLE 2. Attitudes and Behaviors on data-sharing
** ---------------------------------------------------

** Likert scale answers 
** Attitudes to data sharing
** ds_02   There is no need to share the data I or others in my organisation have collected
** ds_03   Other people would not be interested in my data
** ds_04   Data sharing requires reliable internet
** ds_05   I am concerned that others will misinterpret the data I have shared
** ds_06   If I share my data, others will benefit from all my hard work
** ds_07   If I share my data, I cannot control how the data are analysed
** ds_08   Data sharing is vital to allow my work to be confirmed by others
** ds_09   No-one has ever asked me to share data
** ds_10   I am regularly asked to share data
** ds_11   I do not know how to share data
** ds_12   I have all the skills I need to share data
** ds_13   I help other people share their data
** ds_14   Sharing the entire dataset is usually the simplest thing to do
** ds_15   I would like training to help me to share data
** ds_16   My organisation has no-one to help me share data
** ds_17   I have no time to share data
** ds_18   I do not have the funds needed to share data
** ds_19   My organisation does not have the funds to share data
** ds_20   My organisation does not allow data sharing
** ds_21   My organisation has a policy to guide data sharing
** ds_22   My organisation has no process for sharing data
** ds_23   I have no way of securely sharing my data with colleagues
** ds_24   My organisation provides a way of encrypting my data before sending
** ds_25   I am concerned about who would access my shared data
** ds_26   I am concerned about the security of my shared data
** ds_27   I am not comfortable sharing data that contains personal health information
** ds_28   I need consent from participants before I can share their data
** ds_29   My data contains identifying information-Im not sure how to anonymise

** Data sharing practices 
** These run from ALWAYS to NEVER 
** So will be inappropriately labelled 
** Just want the average score though for Table 1 
rename ds_01a ds_30 
rename ds_01b ds_31 
rename ds_01c ds_32 
rename ds_01d ds_33 
rename ds_01e ds_34 
rename ds_01f ds_35 
rename ds_01g ds_36 
rename ds_01h ds_37 
order ds_30 ds_31 ds_32 ds_33 ds_34 ds_35 ds_36 ds_37, after(ds_29) 

keep record_id  ds_02 - ds_37
forval x = 2(1)9 {
    rename ds_0`x' ds_`x' 
}
forval x = 2(1)37 {
    replace ds_`x' = 6 if ds_`x'==. 
    label define extra 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 6 "not answered", modify  
    label values ds_`x' extra 
}
reshape long ds_, i(record_id) j(question)
gen attitude = 1 
collapse (count) attitude, by(question ds_)
fillin question ds_
replace attitude = 0 if attitude==.
drop _fillin
drop if ds_ == 6

** Score for each question 
gen score = ds_ * attitude 
bysort question: egen tscore = sum(score)
bysort question: egen total = sum(attitude)
gen fscore = tscore/total 
collapse (mean) final_score = fscore, by(question) 

gen y = 1 

** Color scheme from : colorbrewer.org
** NINE-level color gradient 
** from RED
** 165 0 38
** 215 48 39
** 244 109 67
** 253 174 97
** 254 224 139
** 217 239 139
** 166 217 106
** 102 189 99
** 26 152 80
** 0 104 55
** to GREEN

gen EY1 = 1
gen EX1 = 0
gen EX2 = 0.55
gen EX3 = 1.11
gen EX4 = 1.66
gen EX5 = 2.22
gen EX6 = 2.77
gen EX7 = 3.33
gen EX8 = 3.88
gen EX9 = 4.44
gen EX10 = 5

** Reverse the following questions
gen final_score_rev = final_score
local questions = "4 8 10 12 13 14 15 21 24 26 27 28 30 31 32 33 34 35 36 37"
foreach x of numlist `questions' {
        replace final_score_rev = 5 - final_score if question==`x'
}

forval x = 2(1)29 {
    #delimit ;
	gr twoway
        (sc EY EX1 if question==2,  msize(125) m(s) mlc(gs10) mfc("165 0 38") mlw(none))
        (sc EY EX2 if question==2,  msize(125) m(s) mlc(gs10) mfc("215 48 39") mlw(none))
        (sc EY EX3 if question==2,  msize(125) m(s) mlc(gs10) mfc("244 109 67") mlw(none))
        (sc EY EX4 if question==2,  msize(125) m(s) mlc(gs10) mfc("253 174 97") mlw(none))
        (sc EY EX5 if question==2,  msize(125) m(s) mlc(gs10) mfc("254 224 139") mlw(none))
        (sc EY EX6 if question==2,  msize(125) m(s) mlc(gs10) mfc("217 239 139") mlw(none))
        (sc EY EX7 if question==2,  msize(125) m(s) mlc(gs10) mfc("166 217 106") mlw(none))
        (sc EY EX8 if question==2,  msize(125) m(s) mlc(gs10) mfc("102 189 99") mlw(none))
        (sc EY EX9 if question==2,  msize(125) m(s) mlc(gs10) mfc("26 152 80") mlw(none))
        (sc EY EX10 if question==2,  msize(125) m(s) mlc(gs10) mfc("0 104 55") mlw(none))

        (sc y final_score_rev if question==`x',  msize(75) m(o) mlc(gs0) mfc(gs0%45) mlw(3))
            ,
			graphregion(color(gs16) margin(zero))
            plotregion(margin(-100 -100 -100 -100)) 
            ysize(1) xsize(9)
			xlab(-0.5(0.5)5.5)
			xscale(off noline range(-1(0.1)6))
			xtitle("", size(2.5) color(gs0) margin(zero))
			ylab(, nogrid glc(gs16) angle(0) format(%9.0f))
			yscale(off noline)
			ytitle("", size(2.5) margin(zero))
            legend(off)
			name(ds_`x')
            ;
#delimit cr
}
