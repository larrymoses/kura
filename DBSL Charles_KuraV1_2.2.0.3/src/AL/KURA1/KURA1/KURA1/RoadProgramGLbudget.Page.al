#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72314 "Road Program G/L budget"
{
    Editable = false;
    PageType = List;
    SourceTable = "Road Program G/L budget";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("G/L Account No.";"G/L Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name";"Budget Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Project Category";"Road Project Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budgeted Amount";"Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("G/L Budget ID";"G/L Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

