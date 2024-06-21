#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80461 "Budget Consolidation Entries"
{
    PageType = ListPart;
    SourceTable = "Consolidated Bugdet Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Actual Amount";"Actual Amount")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Vote id";"Vote id")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Desription";"Vote Desription")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Id";"Activity Id")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description";"Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
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

