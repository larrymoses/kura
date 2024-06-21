#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72172 "RICS Existing Road Section"
{
    PageType = List;
    SourceTable = "RICS Existing Road Section";

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
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Constituency ID";"Primary Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary County ID";"Primary County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region ID";"Primary Region ID")
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
                field("Total Road Length (KMs)";"Total Road Length (KMs)")
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

