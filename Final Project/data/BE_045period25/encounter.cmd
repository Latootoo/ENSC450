#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Tue Nov 12 12:20:55 2013                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v09.10-p004_1 (32bit) 12/02/2009 20:50 (Linux 2.6)
#@(#)CDS: NanoRoute v09.10-p020 NR091118-1115/USR62-UB (database version 2.30, 86.1.1) {superthreading v1.13}
#@(#)CDS: CeltIC v09.10-p001_1 (32bit) 11/20/2009 16:06:17 (Linux 2.6.9-78.0.25.ELsmp)
#@(#)CDS: CTE 09.10-p003_1 (32bit) Dec  2 2009 16:44:23 (Linux 2.6.9-78.ELsmp)
#@(#)CDS: CPE v09.10-p005

windowSelect -0.095 0.090 0.013 0.027
set_global report_precision 5
loadConfig inputs/RegFile.conf
set_global report_precision 5
loadConfig inputs/RegFile.conf
setCteReport
saveDesign ./DBS/01-importDesign.enc -relativePath -compress
setAnalysisMode -analysistype single -checkType setup -skew true -clockPropagation sdcControl
timeDesign -drvReports -slackReports -pathreports -expandReg2Reg -expandedViews -reportOnly -numPaths 10 -outDir results/timing/01-importDesign-timeDesign.setup
report_timing -net -format {instance arc cell slew net annotation load delay arrival} -max_paths 10 >  results/timing/01_Timing.rpt
summaryReport -outfile results/summary/01-importDesign.rpt
