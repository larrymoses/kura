#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75240 "PRN Personnel Specification"
{
    PageType = List;
    SourceTable = "PRN Personnel Specification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; "Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation Description"; "Title/Designation Description")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; "Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Min No. of Recomm Staff"; "Min No. of Recomm Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entry No"; "Entry No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Line)
            {
                Caption = 'Line';
                action("PRN Personnel Qualification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualification Requirements';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    RunObject = Page "PRN Personnel Qualification";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                }
                action("PRN Personnel Experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Experience Requirements';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "PRN Personnel Experience";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                }
                action("Export Excel")
                {
                    ApplicationArea = Basic;
                    Image = Excel;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if not Confirm('Are you sure you want to generate an excel?') then
                            exit;

                        RowNo := 0;
                        //  RMSMgt.FnMakePrnpersonelExcelHeader();
                        PRNPersonnelSpecification.Reset;
                        PRNPersonnelSpecification.SetRange("Document No.", Rec."Document No.");
                        PRNPersonnelSpecification.SetRange("Document Type", Rec."document type"::"Purchase Requisition");
                        if PRNPersonnelSpecification.FindSet then begin
                            repeat
                                RowNo := RowNo + 1;
                            //    RMSMgt.FnCreatePrnpersonelExcelLines(Format(PRNPersonnelSpecification."Document Type"), PRNPersonnelSpecification."Document No.", Format(PRNPersonnelSpecification."Staff Role Code"), PRNPersonnelSpecification."Title/Designation Description",
                            //                                  Format(PRNPersonnelSpecification."Staff Category"), PRNPersonnelSpecification."Min No. of Recomm Staff", RowNo);
                            until PRNPersonnelSpecification.Next = 0;
                        end;
                        // RMSMgt.FnOpenExcelFile('PrnPersonelSpecification', 'PrnPersonelSpecification.xlsx');
                    end;
                }
                action("Import Excel")
                {
                    ApplicationArea = Basic;
                    Image = Excel;
                    Promoted = true;
                    PromotedCategory = Process;
                    //  RunObject = Report "Import Required Personel";
                }
            }
        }
    }

    var
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        ProgressWindow: Dialog;
        RMSMgt: Codeunit "RMS Management";
        RowNo: Integer;
}

