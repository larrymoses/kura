#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72369 "Posted  Measurement Sheet"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Certificate Type";"Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Visible = "Document Type"="Document Type"::"Payment Certificate";
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID";"Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed;Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Reversal";"Reason For Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By";"Reversed By")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control44;"Measurement & Payment Line")
            {
                SubPageLink = "Document Type"=field("Document Type"),
                              "Document No"=field("Document No.");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No.";"Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name";"Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager";"Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative No.";"Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative Name";"Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID";"County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funder Name";"Funder Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Section Start Chainage";"Section Start Chainage")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Section End Chainage";"Section End Chainage")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total  Section Length (KMs)";"Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Measurement Sheet Bill Codes")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Bins;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Measurement Sheet Bill Codes";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No"=field("Document No."),
                              "Job No"=field("Project ID");
                Visible = false;
            }
            action("Import Lines")
            {
                ApplicationArea = Basic;
                Image = ImportChartOfAccounts;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Measurement Lines";
                Visible = false;
            }
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //RMSManagement.FnSuggestMeasurementLines(JobPlanningLine,Rec,Rec);

                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange("Job No.","Project ID");
                    if JobPlanningLine.FindSet then begin
                      repeat
                      MeasurementSheetBillCode.Reset;
                      MeasurementSheetBillCode.SetRange("Bill Item Category Code",JobPlanningLine."Road Activity Categories");
                      if MeasurementSheetBillCode.FindSet then begin
                        MeasurementPaymentLine.Init;
                        MeasurementPaymentLine."Document No":="Document No.";
                        MeasurementPaymentLine."Document Type":="Document Type";
                        MeasurementPaymentLine."Job No.":="Project ID";
                        MeasurementPaymentLine."Job Task No.":=JobPlanningLine."Job Task No.";
                        MeasurementPaymentLine."Line No.":=MeasurementPaymentLine.Count+100;
                        MeasurementPaymentLine.Type:=MeasurementPaymentLine.Type::Item;
                        MeasurementPaymentLine."No.":=JobPlanningLine."No.";
                        MeasurementPaymentLine.Description:=JobPlanningLine.Description;
                        MeasurementPaymentLine."Bill Item Category Code":=JobPlanningLine."Road Activity Categories";
                        MeasurementPaymentLine."Technology Type":=JobPlanningLine."Road Technology";
                        MeasurementPaymentLine."Unit of Measure Code":=JobPlanningLine."Unit of Measure";
                        MeasurementPaymentLine."Unit of Measure Code":=JobPlanningLine."Unit of Measure Code";
                        MeasurementPaymentLine.Validate("Unit of Measure Code");
                        MeasurementPaymentLine."Contract Quantity":=JobPlanningLine.Quantity;
                        MeasurementPaymentLine.Validate("Contract Quantity");
                        MeasurementPaymentLine."Direct Unit Cost (LCY)":=JobPlanningLine."Unit Cost";
                        MeasurementPaymentLine."Unit Cost (LCY)":=JobPlanningLine."Unit Cost";
                        MeasurementPaymentLine."Total Cost (LCY)":=JobPlanningLine."Total Cost";
                        MeasurementPaymentLine."Previous Measured Quantity":=JobPlanningLine."Total Cost";
                        MeasurementPaymentLine.Insert;
                         end;
                        until JobPlanningLine.Next=0;
                      end;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //RMSManagement.FnPostMeasurementSheet(MeasurementPaymentEntry,MeasurementPaymentLine,Rec);
                    ObjMPLine.Reset;
                    ObjMPLine.SetRange(ObjMPLine."Document Type","Document Type");
                    ObjMPLine.SetRange(ObjMPLine."Document No","Document No.");
                    if ObjMPLine.FindSet(true) then begin
                      repeat
                        ObjMPEntry.Init;
                        //ObjMPEntry.TRANSFERFIELDS(ObjMPLine);
                        ObjMPEntry.Reset;
                        ObjMPEntry.SetRange("Document No","Document No.");
                        ObjMPEntry.SetRange("Document Type","Document Type");
                        if  ObjMPEntry.FindLast then
                        ObjMPEntry."Entry No":=ObjMPEntry."Entry No"+100;
                        ObjMPEntry."Document No":="Document No.";
                        ObjMPEntry."Document Type":="Document Type";
                        ObjMPLine."Job No.":="Project ID";
                        ObjMPEntry."Job Task No.":=ObjMPLine."Job Task No.";
                        ObjMPEntry.Type:=ObjMPEntry.Type::Item;
                        ObjMPEntry."No.":=ObjMPLine."No.";
                        ObjMPEntry.Description:=ObjMPLine.Description;
                        ObjMPEntry."Unit of Measure Code":=ObjMPLine."Unit of Measure Code";
                        ObjMPEntry."Measurement Type":=ObjMPLine."Measurement Type";
                        ObjMPEntry."Measured Quantity":=ObjMPLine."Measured Quantity";
                        ObjMPEntry."Linear/Unit Quantity":=ObjMPLine."Linear/Unit Quantity";
                        ObjMPEntry."Length (m)":=ObjMPLine."Length (m)";
                        ObjMPEntry."Width (m)":=ObjMPLine."Width (m)";
                        ObjMPEntry."Height/Depth (m)":=ObjMPLine."Height/Depth (m)";
                        ObjMPEntry."Contract Quantity":=ObjMPLine."Contract Quantity";
                        ObjMPEntry."Direct Unit Cost (LCY)":=ObjMPLine."Direct Unit Cost (LCY)";
                        ObjMPEntry."Unit Cost (LCY)":=ObjMPLine."Unit Cost (LCY)";
                        ObjMPEntry."Total Cost (LCY)":=ObjMPLine."Total Cost (LCY)";
                        ObjMPEntry."Gen. Prod. Posting Group":=ObjMPLine."Gen. Prod. Posting Group";
                        ObjMPEntry."Technology Type":=ObjMPLine."Technology Type";
                        ObjMPEntry."Bill Item Category Code":=ObjMPLine."Bill Item Category Code";
                        ObjMPEntry."Works Start Chainage":=ObjMPLine."Works Start Chainage";
                        ObjMPEntry."Works End Chainage":=ObjMPLine."Works End Chainage";
                        ObjMPEntry."Posting Date":="Document Date";
                        ObjMPEntry."Posted By":=UpperCase(UserId);
                        ObjMPEntry."Line No.":=ObjMPLine."Line No.";
                        ObjMPEntry.Posted:=true;
                        ObjMPEntry.Insert(true);
                        until ObjMPLine.Next =0;
                        end;

                    Posted:=true;
                    Validate(Posted);
                    "Posted By":=UpperCase(UserId);
                    Modify;
                    Message('Posted Successfully');
                end;
            }
            action("Send Approval Request ")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Reverse)
            {
                ApplicationArea = Basic;
                Image = ReverseLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Reversed');
                end;
            }
        }
    }

    var
        RMSManagement: Codeunit "RMS Management";
        JobPlanningLine: Record "Job Planning Line";
        MeasurementPaymentEntry: Record "Measurement & Payment Entry";
        MeasurementPaymentLine: Record "Measurement & Payment Line";
        MeasurementSheetBillCode: Record "Measurement Sheet Bill Code";
        ObjMPLine: Record "Measurement & Payment Line";
        ObjMPEntry: Record "Measurement & Payment Entry";
}

