#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 99098 "Site Instructed Works"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SiteInstructedWorks.rdl';

    dataset
    {
        dataitem("Site Instructions Header"; "Site Instructions Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(DocumentNo_SiteInstructionsHeader; "Site Instructions Header"."Document No.")
            {
            }
            column(DocumentDate_SiteInstructionsHeader; "Site Instructions Header"."Document Date")
            {
            }
            column(ProjectID_SiteInstructionsHeader; "Site Instructions Header"."Project ID")
            {
            }
            column(ProjectName_SiteInstructionsHeader; "Site Instructions Header"."Project Name")
            {
            }
            column(ContractNo_SiteInstructionsHeader; "Site Instructions Header"."Contract No")
            {
            }
            column(ContractorNo_SiteInstructionsHeader; "Site Instructions Header"."Contractor No.")
            {
            }
            column(ContractorName_SiteInstructionsHeader; "Site Instructions Header"."Contractor Name")
            {
            }
            column(StartChainage_SiteInstructionsHeader; "Site Instructions Header"."Start Chainage")
            {
            }
            column(EndChainage_SiteInstructionsHeader; "Site Instructions Header"."End Chainage")
            {
            }
            column(ChainageDescription_SiteInstructionsHeader; "Site Instructions Header"."Chainage Description")
            {
            }
            column(WorksInstructionsDescriptio_SiteInstructionsHeader; "Site Instructions Header"."Works Instructions(Descriptio)")
            {
            }
            column(RegionID_SiteInstructionsHeader; "Site Instructions Header"."Region ID")
            {
            }
            column(RegionName_SiteInstructionsHeader; "Site Instructions Header"."Region Name")
            {
            }
            column(DirectorateID_SiteInstructionsHeader; "Site Instructions Header"."Directorate ID")
            {
            }
            column(DirectorateName_SiteInstructionsHeader; "Site Instructions Header"."Directorate Name")
            {
            }
            column(DepartmentID_SiteInstructionsHeader; "Site Instructions Header"."Department ID")
            {
            }
            column(DepartmentName_SiteInstructionsHeader; "Site Instructions Header"."Department Name")
            {
            }
            column(CreatedBy_SiteInstructionsHeader; "Site Instructions Header"."Created By")
            {
            }
            column(CreatedDateTime_SiteInstructionsHeader; "Site Instructions Header"."Created DateTime")
            {
            }
            column(Posted_SiteInstructionsHeader; "Site Instructions Header".Posted)
            {
            }
            column(SiteAgentNo_SiteInstructionsHeader; "Site Instructions Header"."Site Agent No.")
            {
            }
            column(SiteAgentName_SiteInstructionsHeader; "Site Instructions Header"."Site Agent Name")
            {
            }
            column(Status_SiteInstructionsHeader; "Site Instructions Header".Status)
            {
            }
            column(PortalStatus_SiteInstructionsHeader; "Site Instructions Header"."Portal Status")
            {
            }
            column(NoSeries_SiteInstructionsHeader; "Site Instructions Header"."No. Series")
            {
            }
            column(TotalAmountExclusiveVAT_SiteInstructionsHeader; "Site Instructions Header"."Total Amount Exclusive VAT")
            {
            }
            column(TotalAmountInclusiveVAT_SiteInstructionsHeader; "Site Instructions Header"."Total Amount Inclusive VAT")
            {
            }
            column(KeRRAReferenceNo_SiteInstructionsHeader; "Site Instructions Header"."Site Instruction No")
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {

            }
            column(CompanyAddress2; CompanyAddr[2])
            {

            }
            column(CompanyAddress3; CompanyAddr[3])
            {

            }
            column(CompanyAddress4; CompanyAddr[4])
            {

            }
            column(CompanyAddress5; CompanyAddr[5])
            {

            }
            column(CompanyAddress6; CompanyAddr[6])
            {

            }
            column(CompanyMotto; CompanyInformation.Motto)
            {

            }
            column(Road_Code; "Road Code")
            {

            }
            column(Road_Name; "Road Name")
            {

            }
            column(Site_Instruction_No; "Site Instruction No")
            {

            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; Format(ApproverDate[2]))
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }

            dataitem("Site Instructions Line"; "Site Instructions Line")
            {
                DataItemLink ="Document No." =field("Document No.");
                column(ReportForNavId_30; 30)

                {
                }
                column(DocumentNo_SiteInstructionsLine; "Site Instructions Line"."Document No.")
                {
                }
                column(LineNo_SiteInstructionsLine; "Site Instructions Line"."Line No.")
                {
                }
                column(BoQCategoryCode_SiteInstructionsLine; "Site Instructions Line"."BoQ Category Code")
                {
                }
                column(BoQItemLineNo_SiteInstructionsLine; "Site Instructions Line"."BoQ Item Line No.")
                {
                }
                column(Description_SiteInstructionsLine; "Site Instructions Line".Description)
                {
                }
                column(Quantity_SiteInstructionsLine; "Site Instructions Line".Quantity)
                {
                }
                column(Amount_SiteInstructionsLine; "Site Instructions Line".Amount)
                {
                }
                column(TotalAmount_SiteInstructionsLine; "Site Instructions Line"."Total Amount")
                {
                }
                column(BoQCategoryDescription_SiteInstructionsLine; "Site Instructions Line"."BoQ Category Description")
                {
                }
                column(BoQItemNo_SiteInstructionsLine; "Site Instructions Line"."BoQ Item No.")
                {
                }
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                //  FormatAddr.GetCompanyAddr("Region ID",ResponsibilityCenter,CompanyInformation,CompanyAddr);;
                FormatAddr.GetCompanyAddr("Region ID", ResponsibilityCenter, CompanyInformation, CompanyAddr);
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 72157);
                ApprovalEntries.SetRange("Document No.", "Document No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Findset() then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 4 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;

                    until
                   ApprovalEntries.Next = 0;

                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
}

