#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75154 "Bid Modification Notice"
{
    PageType = List;
    SourceTable = "Bid Modification Notice";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Bid Action Type";"Bid Action Type")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Date";"Notice Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No.";"Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS No.";"IFS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Action";"Reason for Action")
                {
                    ApplicationArea = Basic;
                }
                field("External Reference No";"External Reference No")
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

