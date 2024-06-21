#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95128 "Compliance Frameworks"
{
    CardPageID = "Compliance Framework";
    PageType = List;
    SourceTable = "Compliance Framework";

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Framework Category";"Framework Category")
                {
                    ApplicationArea = Basic;
                }
                field("Issued By";"Issued By")
                {
                    ApplicationArea = Basic;
                }
                field(Website;Website)
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

