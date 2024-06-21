#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 95000 "Risk Management"
{

    trigger OnRun()
    begin
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementFramework: Record "Risk Management Framework";


    procedure FnCopyRiskManagementPlanDocument(RiskMgtPlan: Record "Risk Management Plan";RiskMgtLine: Record "Risk Management Plan Line";DocumentType: Option " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;NoSeries: Code[50])
    var
        RiskManagementPlan: Record "Risk Management Plan";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
    begin
        RiskMgtPlan.Get(DocumentType,RiskMgtPlan."Document No");
        RiskManagementFramework.Get;
        RiskManagementFramework.Get;
        RiskManagementPlan.Init;
        RiskManagementPlan.TransferFields(RiskMgtPlan);
        RiskManagementPlan."Document Type":=DocumentType;
        case DocumentType of
          Documenttype::Corporate:
            begin
              NoSeries:=RiskManagementFramework."Corporate Risk Mgt Plan Nos.";
            end;
          Documenttype::"Functional (Directorate)":
            begin
               NoSeries:=RiskManagementFramework."Directorate Risk Mgt Plan Nos.";
            end;
          Documenttype::"Functional (Department)":
            begin
               NoSeries:=RiskManagementFramework."Departmenta Risk Mgt Plan Nos.";
            end;

          Documenttype::"Functional (Region)":
            begin
               NoSeries:=RiskManagementFramework."Regional Risk Mgt Plan Nos.";
            end;
          Documenttype::Project:
            begin
               NoSeries:=RiskManagementFramework."Project Risk Mgt Plan Nos.";
            end;
          end;
        RiskManagementPlan."Document No":=NoSeriesManagement.GetNextNo(NoSeries,Today,true);
        RiskManagementPlan."Document Date":=Today;
        RiskManagementPlan.Status:=RiskManagementPlan.Status::Open;
        RiskManagementPlan."Created By":=UserId;
        RiskManagementPlan."Created Date Time":=CreateDatetime(Today,Time);
        RiskManagementPlan.Insert;

        RiskMgtLine.Reset;
        RiskMgtLine.SetRange(RiskMgtLine."Document No",RiskMgtPlan."Document No");
        if RiskMgtLine.FindSet then repeat
        RiskManagementPlanLine.Init;
        RiskManagementPlanLine.TransferFields(RiskMgtLine);
        RiskManagementPlanLine."Document Type":=DocumentType;
        RiskManagementPlanLine."Document No":=RiskManagementPlan."Document No";
        RiskManagementPlanLine.Insert(true);
        until RiskMgtLine.Next=0;
        Message('Document Copied successfully and RMP %1 created',RiskManagementPlan."Document No");
    end;


    procedure FnUpdateRMPFromNRV(ObjRMPLine: Record "Risk Management Plan Line";ObjNRVH: Record "Risk M&E Header";ObjNRVLine: Record "New Risk Voucher Line";ObjRSRLine: Record "Risk Status Report Line")
    begin
        ObjNRVLine.Reset;
        ObjNRVLine.SetRange(ObjNRVLine."Document No",ObjNRVH."Document No");
        if ObjNRVLine.FindSet then begin
          repeat
            ObjRMPLine.Init;
            ObjRMPLine."Document Type":=ObjNRVH."Risk Register Type";
            ObjRMPLine."Document No":=ObjNRVH."Risk Management Plan ID";
            ObjRMPLine."Risk ID":=ObjNRVLine."Risk ID";
            ObjRMPLine."Risk Category":=ObjNRVLine."Risk Category";
            ObjRMPLine."Risk Title":=ObjNRVLine."Risk Title";
            ObjRMPLine."Risk Source ID":=ObjNRVLine."Risk Source ID";
            ObjRMPLine."Risk Likelihood Code":=ObjNRVLine."Risk Likelihood Code";
            ObjRMPLine."Risk Impact Code":=ObjNRVLine."Risk Impact Code";
            ObjRMPLine."Risk Impact Type":=ObjNRVLine."Risk Impact Type";
            ObjRMPLine."Estimate Fin. Impact (LCY)":=ObjNRVLine."Estimate Fin. Impact (LCY)";
            ObjRMPLine."Estimate Delay Impact (Days)":=ObjNRVLine."Estimate Delay Impact (Days)";
            ObjRMPLine."Gen. Risk Response Strategy":=ObjNRVLine."Gen. Risk Response Strategy";
            ObjRMPLine."Date Raised":=ObjNRVLine."Date Raised";
            ObjRMPLine."Risk Status":=ObjNRVLine."Risk Status";
            ObjRMPLine."Date Closed":=Today;
            ObjRMPLine."Risk Likelihood Rate Scale ID":=ObjNRVLine."Risk Likelihood Rate Scale ID";
            ObjRMPLine."Risk Impact Rating Scale ID":=ObjNRVLine."Risk Impact Rating Scale ID";
            ObjRMPLine."Overall Risk Rating Scale ID":=ObjNRVLine."Overall Risk Rating Scale ID";
            ObjRMPLine."Risk Appetite Rating Scale ID":=ObjNRVLine."Risk Appetite Rating Scale ID";
            ObjRMPLine."Risk Likelihood Rating":=ObjNRVLine."Risk Likelihood Rating";
            ObjRMPLine."Risk Impact Rating":=ObjNRVLine."Risk Impact Rating";
            ObjRMPLine."Overal Risk Rating":=ObjNRVLine."Overal Risk Rating";
            ObjRMPLine."Overall Risk Level Code":=ObjNRVLine."Overall Risk Level Code";
            ObjRMPLine."Risk Heat Zone":=ObjNRVLine."Risk Heat Zone";
            ObjRMPLine."New Risk Voucher ID":=ObjNRVH."Document No";
            if not ObjRMPLine.Insert(true) then
            ObjRMPLine.Modify(true);
          until ObjNRVLine.Next=0;
        //  ObjNRVH.Posted:=TRUE;
        //  ObjNRVH."Posting Date":=TODAY;
        //  ObjNRVH.MODIFY;
          end;
    end;


    procedure FnUpdateRiskOwnership(RiskMEHeader: Record "Risk M&E Header";NewRiskVoucherLine: Record "New Risk Voucher Line";RiskStatusReportLine: Record "Risk Status Report Line";NewRiskLineOwnership: Record "New Risk Line Ownership")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange(NewRiskVoucherLine."Document No",RiskMEHeader."Document No");
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineOwnership.Reset;
            NewRiskLineOwnership.SetRange(NewRiskLineOwnership."Document No",NewRiskVoucherLine."Document No");
            if NewRiskLineOwnership.FindSet then
              repeat
                RMPLineRiskOwnership.Init;
                RMPLineRiskOwnership."Document Type":=RiskMEHeader."Risk Register Type";
                RMPLineRiskOwnership."Document No":=RiskMEHeader."Risk Management Plan ID";
                RMPLineRiskOwnership."Risk ID":=NewRiskLineOwnership."Risk ID";
                RMPLineRiskOwnership."Responsibility Center ID":=NewRiskLineOwnership."Responsibility Center ID";
                RMPLineRiskOwnership.Name:=NewRiskLineOwnership.Desciption;
                RMPLineRiskOwnership."Responsible Officer No.":=NewRiskLineOwnership."Responsible Officer No.";
                if not RMPLineRiskOwnership.Insert(true) then
                  RMPLineRiskOwnership.Modify(true);
             until NewRiskLineOwnership.Next=0;
          end;
    end;


    procedure FnUpdateRiskResponseActions(RiskMEHeader: Record "Risk M&E Header";NewRiskVoucherLine: Record "New Risk Voucher Line";RiskStatusReportLine: Record "Risk Status Report Line";NewRiskLineResponseAction: Record "New Risk Line Resp. Action")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange(NewRiskVoucherLine."Document No",RiskMEHeader."Document No");
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineResponseAction.Reset;
            NewRiskLineResponseAction.SetRange(NewRiskLineResponseAction."Document No",NewRiskVoucherLine."Document No");
            if NewRiskLineResponseAction.FindSet then
              repeat
                RMPLineResponseAction.Init;
                RMPLineResponseAction."Document Type":=RiskMEHeader."Risk Register Type";
                RMPLineResponseAction."Document No":=RiskMEHeader."Risk Management Plan ID";
                RMPLineResponseAction."Risk ID":=NewRiskLineResponseAction."Risk ID";
                RMPLineResponseAction."Action ID":=NewRiskLineResponseAction."Action ID";
                RMPLineResponseAction."Activity Description":=NewRiskLineResponseAction."Activity Description";
                RMPLineResponseAction."Responsible Officer No.":=NewRiskLineResponseAction."Responsible Officer No.";
                //RMPLineResponseAction."Action Status":=NewRiskLineResponseAction.;
                //RMPLineResponseAction."Percentage Complete":=TODAY;//Change to the correct date and add the missing fields
                if not RMPLineResponseAction.Insert(true) then
                  RMPLineResponseAction.Modify(true);
             until NewRiskLineResponseAction.Next=0;
          end;
    end;


    procedure FnUpdateJobTasks(RiskMEHeader: Record "Risk M&E Header";NewRiskVoucherLine: Record "New Risk Voucher Line";RiskStatusReportLine: Record "Risk Status Report Line";NewRiskLineJobTask: Record "New Risk Line Job Task")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RMPLineJobTask: Record "RMP Line Job Task";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange(NewRiskVoucherLine."Document No",RiskMEHeader."Document No");
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineJobTask.Reset;
            NewRiskLineJobTask.SetRange(NewRiskLineJobTask."Document No",NewRiskVoucherLine."Document No");
            if NewRiskLineJobTask.FindSet then
              repeat
                RMPLineJobTask.Init;
                RMPLineJobTask."Document Type":=RiskMEHeader."Risk Register Type";
                RMPLineJobTask."Document No":=RiskMEHeader."Risk Management Plan ID";
                RMPLineJobTask."Risk ID":=NewRiskLineJobTask."Risk ID";
                RMPLineJobTask."Job No":=NewRiskLineJobTask."Job No";
                RMPLineJobTask."Job Task No":=NewRiskLineJobTask."Job Task No";
                RMPLineJobTask.Description:=NewRiskLineJobTask.Description;
                if not RMPLineJobTask.Insert(true) then
                  RMPLineJobTask.Modify(true);
             until NewRiskLineJobTask.Next=0;
          end;
    end;


    procedure FnSuggestOpenRisks(RiskStatusReportLine: Record "Risk Status Report Line";RiskMEHeader: Record "Risk M&E Header")
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
    begin
        RiskManagementPlanLine.Reset;
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No",RiskMEHeader."Risk Management Plan ID");
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk Status",RiskManagementPlanLine."risk status"::Open);
        if RiskManagementPlanLine.FindSet then
          begin
            repeat
              RiskStatusReportLine.Init;
              RiskStatusReportLine."Document Type":=RiskMEHeader."Document Type";
              RiskStatusReportLine."Document No":=RiskMEHeader."Document No";
              RiskStatusReportLine."Risk Management Plan ID":=RiskMEHeader."Risk Management Plan ID";
              RiskStatusReportLine."Risk ID":=RiskManagementPlanLine."Risk ID";
              RiskStatusReportLine."Risk Title":=RiskManagementPlanLine."Risk Title";
              RiskStatusReportLine."Risk Likelihood Code":=RiskManagementPlanLine."Risk Likelihood Code";
              RiskStatusReportLine."Risk Impact Code":=RiskManagementPlanLine."Risk Impact Code";
              RiskStatusReportLine."Risk Impact Type":=RiskManagementPlanLine."Risk Impact Type";
              RiskStatusReportLine."Gen. Risk Response Strategy":=RiskManagementPlanLine."Gen. Risk Response Strategy";
              RiskStatusReportLine."Risk Status":=RiskManagementPlanLine."Risk Status";
              RiskStatusReportLine."Date Closed":=RiskManagementPlanLine."Date Closed";
              RiskStatusReportLine."Risk Likelihood Rate Scale ID":=RiskManagementPlanLine."Risk Likelihood Rate Scale ID";
              RiskStatusReportLine."Risk Impact Rating Scale ID":=RiskManagementPlanLine."Risk Impact Rating Scale ID";
              RiskStatusReportLine."Risk Appetite Rating Scale ID":=RiskManagementPlanLine."Risk Appetite Rating Scale ID";
              RiskStatusReportLine."Overall Risk Rating Scale ID":=RiskManagementPlanLine."Overall Risk Rating Scale ID";
              RiskStatusReportLine."Risk Likelihood Rating":=RiskManagementPlanLine."Risk Likelihood Rating";
              RiskStatusReportLine."Risk Impact Rating":=RiskManagementPlanLine."Risk Impact Rating";
              RiskStatusReportLine."Overal Risk Rating":=RiskManagementPlanLine."Overal Risk Rating";
              RiskStatusReportLine."Overall Risk Level Code":=RiskManagementPlanLine."Overall Risk Level Code";
              RiskStatusReportLine."Risk Heat Zone":=RiskManagementPlanLine."Risk Heat Zone";
              if not RiskStatusReportLine.Insert(true) then
                RiskStatusReportLine.Modify(true);
            until RiskManagementPlanLine.Next=0;
          end;
    end;


    procedure FnSuggestOpenRSRRiskResponseActionStatus(RiskStatusReportLine: Record "Risk Status Report Line";RiskMEHeader: Record "Risk M&E Header";RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action")
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLineResponseAction: Record "RMP Line Response Action";
    begin
        RiskManagementPlanLine.Reset;
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No",RiskMEHeader."Risk Management Plan ID");
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk Status",RiskManagementPlanLine."risk status"::Open);
        if RiskManagementPlanLine.FindSet then
          begin
            repeat
            RMPLineResponseAction.Reset;
            RMPLineResponseAction.SetRange(RMPLineResponseAction."Document No",RiskMEHeader."Risk Management Plan ID");
            RMPLineResponseAction.SetRange(RMPLineResponseAction."Action Status",RMPLineResponseAction."action status"::Ongoing,RMPLineResponseAction."action status"::Planned);
            if RMPLineResponseAction.FindSet then
            repeat
              RiskStatusRptRespAction.Init;
              RiskStatusRptRespAction."Document Type":=RiskMEHeader."Document Type";
              RiskStatusRptRespAction."Document No":=RiskMEHeader."Document No";
              RiskStatusRptRespAction."Risk Register Type":=RiskMEHeader."Risk Register Type";
              RiskStatusRptRespAction."Risk Management Plan ID":=RiskMEHeader."Risk Management Plan ID";
              RiskStatusRptRespAction."Risk ID":=RMPLineResponseAction."Risk ID";
              RiskStatusRptRespAction."Action ID":=RMPLineResponseAction."Action ID";
              RiskStatusRptRespAction."Responsible Officer No.":=RMPLineResponseAction."Responsible Officer No.";
              RiskStatusRptRespAction."Activity Description":=RMPLineResponseAction."Activity Description";
              RiskStatusRptRespAction."Action Status":=RMPLineResponseAction."Action Status";
              RiskStatusRptRespAction."Percentage Complete":=RMPLineResponseAction."Percentage Complete";
              RiskStatusRptRespAction."Actual Date Done":=RMPLineResponseAction."Actual Date Done";
              RiskStatusRptRespAction."Planned Start Date":=RMPLineResponseAction."Planned Start Date";
              RiskStatusRptRespAction."Planned Due Date":=RMPLineResponseAction."Planned Due Date";
              RiskStatusRptRespAction."Action Type":=RMPLineResponseAction."Action Type";
              if not RiskStatusRptRespAction.Insert(true) then
                RiskStatusRptRespAction.Modify(true);
            until RMPLineResponseAction.Next=0;
            until RiskManagementPlanLine.Next=0;
          end;
    end;


    procedure FnUpdateRMPFromRSR(ObjRMPLine: Record "Risk Management Plan Line";ObjNRVH: Record "Risk M&E Header";ObjNRVLine: Record "New Risk Voucher Line";ObjRSRLine: Record "Risk Status Report Line")
    begin
        ObjRSRLine.Reset;
        ObjRSRLine.SetRange(ObjRSRLine."Document No",ObjNRVH."Document No");
        if ObjRSRLine.FindSet then begin
          repeat
            ObjRMPLine.Init;
            ObjRMPLine."Document Type":=ObjNRVH."Risk Register Type";
            ObjRMPLine."Risk Status":=ObjRSRLine."Risk Status";
            ObjRMPLine."Document No":=ObjNRVH."Risk Management Plan ID";
            ObjRMPLine."Risk ID":=ObjRMPLine.Count+1;
            ObjRMPLine."Risk Title":=ObjRSRLine."Risk Title";
            ObjRMPLine."Risk Likelihood Code":=ObjRSRLine."Risk Likelihood Code";
            ObjRMPLine."Risk Impact Code":=ObjRSRLine."Risk Impact Code";
            ObjRMPLine."Risk Impact Type":=ObjRSRLine."Risk Impact Type";
            ObjRMPLine."Estimate Fin. Impact (LCY)":=ObjRSRLine."Estimate Fin. Impact (LCY)";
            ObjRMPLine."Estimate Delay Impact (Days)":=ObjRSRLine."Estimate Delay Impact (Days)";
            ObjRMPLine."Gen. Risk Response Strategy":=ObjRSRLine."Gen. Risk Response Strategy";
            ObjRMPLine."Date Closed":=ObjRSRLine."Date Closed";
            ObjRMPLine."Risk Likelihood Rate Scale ID":=ObjRSRLine."Risk Likelihood Rate Scale ID";
            ObjRMPLine."Risk Impact Rating Scale ID":=ObjRSRLine."Risk Impact Rating Scale ID";
            ObjRMPLine."Overall Risk Rating Scale ID":=ObjRSRLine."Overall Risk Rating Scale ID";
            ObjRMPLine."Risk Appetite Rating Scale ID":=ObjRSRLine."Risk Appetite Rating Scale ID";
            ObjRMPLine."Risk Likelihood Rating":=ObjRSRLine."Risk Likelihood Rating";
            ObjRMPLine."Risk Impact Rating":=ObjRSRLine."Risk Impact Rating";
            ObjRMPLine."Overal Risk Rating":=ObjRSRLine."Overal Risk Rating";
            ObjRMPLine."Overall Risk Level Code":=ObjRSRLine."Overall Risk Level Code";
            ObjRMPLine."Risk Heat Zone":=ObjRSRLine."Risk Heat Zone";
            ObjRMPLine."New Risk Voucher ID":=ObjNRVH."Document No";
            ObjRMPLine.Insert(true);
          until ObjRSRLine.Next=0;
          end;
    end;


    procedure FnUpdateRiskResponseActionsRSR(RiskMEHeader: Record "Risk M&E Header";NewRiskVoucherLine: Record "New Risk Voucher Line";RiskStatusReportLine: Record "Risk Status Report Line";NewRiskLineResponseAction: Record "New Risk Line Resp. Action";RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
    begin
        RiskStatusReportLine.Reset;
        RiskStatusReportLine.SetRange(RiskStatusReportLine."Document No",RiskMEHeader."Document No");
        if RiskStatusReportLine.FindSet then begin
            RiskStatusRptRespAction.Reset;
            RiskStatusRptRespAction.SetRange(RiskStatusRptRespAction."Document No",RiskStatusReportLine."Document No");
            if RiskStatusRptRespAction.FindSet then
              repeat
                RMPLineResponseAction.Init;
                RMPLineResponseAction."Document Type":=RiskMEHeader."Risk Register Type";
                RMPLineResponseAction."Document No":=RiskMEHeader."Risk Management Plan ID";
                RMPLineResponseAction."Risk ID":=RiskStatusRptRespAction."Risk ID";
                RMPLineResponseAction."Action ID":=RMPLineResponseAction.Count+1;
                RMPLineResponseAction."Responsible Officer No.":=RiskStatusRptRespAction."Responsible Officer No.";
                RMPLineResponseAction."Action Status":=RiskStatusRptRespAction."Action Status";
                RMPLineResponseAction."Percentage Complete":=RiskStatusRptRespAction."Percentage Complete";
                RMPLineResponseAction."Activity Description":=RiskStatusRptRespAction."Activity Description";
                RMPLineResponseAction."Responsible Officer No.":=RiskStatusRptRespAction."Responsible Officer No.";
                RMPLineResponseAction."Task Priority":=RiskStatusRptRespAction."Task Priority";
                RMPLineResponseAction."Planned Start Date":=RiskStatusRptRespAction."Planned Start Date";
                RMPLineResponseAction."Planned Due Date":=RiskStatusRptRespAction."Planned Due Date";
                RMPLineResponseAction."Actual Date Done":=RiskStatusRptRespAction."Actual Date Done";
                RMPLineResponseAction."Action Type":=RiskStatusRptRespAction."Action Type";
                RMPLineResponseAction.Insert(true);

             until RiskStatusRptRespAction.Next=0;
          end;
    end;


    procedure FnUpdateRiskRILedgerEntry(RiskMEHeader: Record "Risk M&E Header";NewRiskVoucherLine: Record "New Risk Voucher Line";RiskStatusReportLine: Record "Risk Status Report Line";NewRiskLineResponseAction: Record "New Risk Line Resp. Action";RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";RiskStatusRptIncident: Record "Risk Status Rpt Incident")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
    begin
        RiskStatusReportLine.Reset;
        RiskStatusReportLine.SetRange(RiskStatusReportLine."Document No",RiskMEHeader."Document No");
        if RiskStatusReportLine.FindSet then begin
            RiskStatusRptIncident.Reset;
            RiskStatusRptIncident.SetRange(RiskStatusRptIncident."Document No",RiskStatusReportLine."Document No");
            if RiskStatusRptIncident.FindSet then
              repeat
                RiskIncidentLedgerEntry.Init;
                RiskIncidentLedgerEntry."Entry No":=RiskIncidentLedgerEntry.Count+1;
                RiskIncidentLedgerEntry."Posting Date":=Today;
                RiskIncidentLedgerEntry."Posted By":=UserId;
                RiskIncidentLedgerEntry."Incident Document Type":=RiskStatusRptIncident."Risk Register Type";
                RiskIncidentLedgerEntry."HSE Management Plan ID":=RiskStatusRptIncident."HSE Plan ID";
                RiskIncidentLedgerEntry."Hazard ID":=RiskStatusRptIncident."Hazard ID";
                RiskIncidentLedgerEntry."Risk Management Plan ID":=RiskStatusRptIncident."Risk Management Plan ID";
                RiskIncidentLedgerEntry."Risk ID":=RiskStatusRptIncident."Risk ID";
                RiskIncidentLedgerEntry."Risk Incident Category":=RiskStatusRptIncident."Risk Incident Category";;
                RiskIncidentLedgerEntry."Source Document Type":=RiskIncidentLedgerEntry."source document type"::"Risk Status Report";
                RiskIncidentLedgerEntry."Source Document No.":=RiskStatusRptIncident."Document No";
                RiskIncidentLedgerEntry."Incident Reference ID":=Format(RiskStatusRptIncident."Incident Line No.");
                RiskIncidentLedgerEntry."Incident Description":=RiskStatusRptIncident."Incident Description";
                RiskIncidentLedgerEntry."Severity Level":=RiskStatusRptIncident."Severity Level";
                RiskIncidentLedgerEntry."Occurrence Type":=RiskStatusRptIncident."Occurrence Type";
                RiskIncidentLedgerEntry."Incident Date":=RiskStatusRptIncident."Incident Date";
                RiskIncidentLedgerEntry."Incident Start Time":=RiskStatusRptIncident."Incident Start Time";
                RiskIncidentLedgerEntry."Incident End Time":=RiskStatusRptIncident."Incident End Time";
                RiskIncidentLedgerEntry."Incident Location Details":=RiskStatusRptIncident."Incident Location Details";
                //RiskIncidentLedgerEntry."Primary Trigger ID":=RiskStatusRptIncident."Primary Trigger ID";
                RiskIncidentLedgerEntry."Root Cause Summary":=RiskStatusRptIncident."Root Cause Summary";
                RiskIncidentLedgerEntry."Category of Person Reporting":=RiskStatusRptIncident."Category of Person Reporting";
                RiskIncidentLedgerEntry."Reported By (Name)":=RiskStatusRptIncident."Reported By (Name)";
                //RiskIncidentLedgerEntry."Incident Class":=RiskStatusRptIncident.;
                RiskIncidentLedgerEntry."Actual Financial Impact (LCY)":=RiskStatusRptIncident."Actual Financial Impact (LCY)";
                RiskIncidentLedgerEntry."Actual Schedule Delay(Days)":=RiskStatusRptIncident."Actual Schedule Delay(Days)";
                RiskIncidentLedgerEntry."Actual No. Injured Persons":=RiskStatusRptIncident."Actual No. Injured Persons";
                RiskIncidentLedgerEntry."Actual No. of Fatalities":=RiskStatusRptIncident."Actual No. of Fatalities";
                RiskIncidentLedgerEntry."Police Report Reference No.":=RiskStatusRptIncident."Police Report Reference No.";
                RiskIncidentLedgerEntry."Police Report Date":=RiskStatusRptIncident."Police Report Date";
                RiskIncidentLedgerEntry."Police Station":=RiskStatusRptIncident."Police Station";
                RiskIncidentLedgerEntry.Insert(true);
               until RiskStatusRptIncident.Next=0;
          end;
    end;
}

