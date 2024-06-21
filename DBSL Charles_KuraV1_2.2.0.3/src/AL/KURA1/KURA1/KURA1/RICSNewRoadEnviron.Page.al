#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72182 "RICS New Road Environ"
{
    PageType = List;
    SourceTable = "RICS Existing Road Environ";

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
                field("Entry Type";"Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Environ ID";"Environ ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Environ Category";"Road Environ Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
                field("Connected to Road Link";"Connected to Road Link")
                {
                    ApplicationArea = Basic;
                }
                field("Connection Road Length (Km)";"Connection Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Location Details";"Location Details")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

