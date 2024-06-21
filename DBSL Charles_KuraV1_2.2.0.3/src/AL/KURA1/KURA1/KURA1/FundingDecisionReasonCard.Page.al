#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65052 "Funding Decision Reason Card"
{
    CardPageID = "Funding Decision Reason Card";
    PageType = Card;
    SourceTable = "Funding Decision Reasons";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Grant Applications";"No. of Grant Applications")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Funding Decision Details")
            {
                ApplicationArea = Basic;
                Image = SetPriorities;
                Promoted = true;
                RunObject = Page "Funding Decision List";
                RunPageLink = Code=field(Code);
            }
        }
    }
}

