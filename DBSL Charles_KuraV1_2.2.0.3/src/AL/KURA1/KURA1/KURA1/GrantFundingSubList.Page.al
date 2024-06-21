#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65067 "Grant Funding Sub List"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Grant Funding Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No";"Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("FOA ID";"FOA ID")
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity  Title";"Opportunity  Title")
                {
                    ApplicationArea = Basic;
                }
                field("Call Type";"Call Type")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Type";"Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center";"Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Program ID";"Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Area";"Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Grant Amount(LCY)";"Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount (LCY)";"Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
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

