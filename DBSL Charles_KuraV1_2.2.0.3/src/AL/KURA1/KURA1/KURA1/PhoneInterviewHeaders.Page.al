#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69774 "Phone Interview Headers"
{
    Caption = 'Phone Interview Headers';
    CardPageID = "Phone Interview Header";
    PageType = List;
    SourceTable = "PreScreen Header";
    SourceTableView = where("Document Type"=filter("Phone Interview Report"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test ID";"Ability Test ID")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Test Duration(Min)";"Maximum Test Duration(Min)")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Template ID";"Phone Interview Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID";"Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation";"Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14;Outlook)
            {
            }
            systempart(Control15;Notes)
            {
            }
            systempart(Control16;MyNotes)
            {
            }
            systempart(Control17;Links)
            {
            }
        }
    }

    actions
    {
    }
}

