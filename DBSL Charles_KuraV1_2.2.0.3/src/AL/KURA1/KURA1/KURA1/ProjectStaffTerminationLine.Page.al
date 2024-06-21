#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72224 "Project Staff Termination Line"
{
    Caption = 'Project Staff Disengagement Line';
    PageType = ListPart;
    SourceTable = "Project Staff Termination Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No.";"Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Termination  Date";"Termination  Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disengagement  Date';
                }
                field("Termination Category";"Termination Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disengagement Reason';
                }
                field("Termination Details";"Termination Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disengagement Details';
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Document No.";"Appointment Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Role Code";"Role Code")
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
            }
        }
    }

    actions
    {
    }
}

