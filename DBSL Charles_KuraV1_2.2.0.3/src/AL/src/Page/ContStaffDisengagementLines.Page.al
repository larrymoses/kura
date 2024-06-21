#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72688 "Cont Staff Disengagement Lines"
{
    PageType = ListPart;
    SourceTable = "Contr Staff Disengagement Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Staff No";"Contractor Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name";"Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field("Disengagement Reason";"Disengagement Reason")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Disengagement Details";"Disengagement Details")
                {
                    ApplicationArea = Basic;
                }
                field("Disengagement Date";"Disengagement Date")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
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
                field("ID Number";"ID Number")
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

