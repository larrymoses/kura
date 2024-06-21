#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72180 "RICS New Road Pavement"
{
    PageType = List;
    SourceTable = "RICS Existing Road Pavement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RICS No.";"RICS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Surface Type";"Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Category";"Pavement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(KM)";"Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)";"End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Road Length (Kms)";"Road Length (Kms)")
                {
                    ApplicationArea = Basic;
                }
                field("Road Surface Condition";"Road Surface Condition")
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

