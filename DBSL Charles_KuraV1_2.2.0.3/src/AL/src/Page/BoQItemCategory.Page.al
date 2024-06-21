#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72304 "BoQ Item Category"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Item Category";
    SourceTableView = where("Bill Item Group"=const(true));
    UsageCategory = Administration;

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
                field("Bill Item Group";"Bill Item Group")
                {
                    ApplicationArea = Basic;
                }
                field("Default Job Task No";"Default Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("No Of Bill Items";"No Of Bill Items")
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

