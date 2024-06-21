#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72700 "Appro Site Instruction SubPage"
{
    PageType = ListPart;
    SourceTable = "Site Instructions Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No";"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Category Code";"BoQ Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Item Line No.";"BoQ Item Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Category Description";"BoQ Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Item No.";"BoQ Item No.")
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

