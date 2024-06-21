#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72005 "Pavement Surface Types"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = TRUE;
    PageType = List;
    SourceTable = "Pavement Surface Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Category"; "Pavement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Length (Kms)"; "Road Length (Kms)")
                {
                    ApplicationArea = Basic;
                }
                field("No of Road Section"; "No of Road Section")
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

