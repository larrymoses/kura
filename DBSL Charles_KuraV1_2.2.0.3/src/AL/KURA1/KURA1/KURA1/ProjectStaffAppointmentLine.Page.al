#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 72219 "Project Staff Appointment Line"
{
    PageType = ListPart;
    SourceTable = "Project Staff Appointment Line";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve,Post,Print,Navigate,Customer';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer"; Rec."Resident Engineer")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Appointment Details")
            {
                Caption = 'Appointment Details';
                action("Project Staff Template Exp")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experience';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Expe";
                    RunPageLink = "Key Staff Template ID" = field("Staffing Template ID"),
                                  "Project Role Code" = field("Role Code");
                }
                action("Project Staff Template Qualif")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Qualify";
                    RunPageLink = "Key Staff Template ID" = field("Staffing Template ID"),
                                  "Staff Role Code" = field("Role Code");
                }
                action("Project Staff Functions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Functions';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "Staff Appointment Function";
                    RunPageLink = "Staff Role Code" = field("Role Code");
                    //, "Document No."=field("Staffing Template ID");
                }
            }
            action(Print)
            {
                ApplicationArea = Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Rec.SetRange("Resource No.", Rec."Resource No.");
                    if Rec."Resident Engineer" then
                        Report.Run(Report::"RE Staff Appointment Letter", true, true, Rec)
                    else
                        if not Rec."Resident Engineer" then
                            Report.Run(Report::"Staff appointment lett", true, true, Rec);
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                end;
            }
        }
    }
}



