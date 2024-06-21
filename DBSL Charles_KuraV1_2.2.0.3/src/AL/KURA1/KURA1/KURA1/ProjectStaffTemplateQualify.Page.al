#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72216 "Project Staff Template Qualify"
{
    Caption = 'Project Staff Template Qualify';
    PageType = List;
    SourceTable = "Project Staff Template Qualif";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key Staff Template ID";"Key Staff Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Role Code";"Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Category";"Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Min Qualification Requirements";"Min Qualification Requirements")
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

