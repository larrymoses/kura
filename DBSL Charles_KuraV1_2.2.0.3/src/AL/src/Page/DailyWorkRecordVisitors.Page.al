#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72445 "Daily Work Record Visitors"
{
    CardPageID = "Daily Work Record Visitor";
    PageType = List;
    SourceTable = "Daily Work Record Visitor";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Visitor Name";"Visitor Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Organization;Organization)
                {
                    ApplicationArea = Basic;
                }
                field("Time In";"Time In")
                {
                    ApplicationArea = Basic;
                }
                field("Time Out";"Time Out")
                {
                    ApplicationArea = Basic;
                }
                field("Purpose of Visit";"Purpose of Visit")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No.";"Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport No.";"ID/Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Induction Done";"Site Induction Done")
                {
                    ApplicationArea = Basic;
                    Caption = 'Site Inspection Done';
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Visitor Email";"Visitor Email")
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

