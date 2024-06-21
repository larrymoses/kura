#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72418 "Contrac Staffing Template Line"
{
    PageType = ListPart;
    SourceTable = "Project Staff Template Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code";"Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Team Type";"Team Type")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category";"Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Min No. of Recommended Staff";"Min No. of Recommended Staff")
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
            group(Line)
            {
                Caption = 'Line';
                action("Project Staff Template Exp")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experience';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Expe";
                    RunPageLink = "Key Staff Template ID"=field("Key Staff Template ID"),
                                  "Project Role Code"=field("Staff Role Code");
                }
                action("Project Staff Template Qualif")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Qualify";
                    RunPageLink = "Key Staff Template ID"=field("Key Staff Template ID"),
                                  "Staff Role Code"=field("Staff Role Code");
                }
                action("Project Staff Functions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Functions';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "Staff Appointment Function";
                    RunPageLink = "Document No."=field("Key Staff Template ID"),
                                  "Staff Role Code"=field("Staff Role Code");
                }
            }
        }
    }
}

