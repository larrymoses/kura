#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69339 "Advertisement Vouchers"
{
    CardPageID = "Advertisement Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Vacancy  Requisitions Table";
    SourceTableView = where("Document Type"=filter(Advert),
                            Status=filter(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Manpower Plan ID";"Manpower Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Manpower Plan Name";"Manpower Plan Name")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name";"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1";"Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Name";"Global Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2";"Global Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Name";"Global Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control19;Outlook)
            {
            }
            systempart(Control20;Notes)
            {
            }
            systempart(Control21;MyNotes)
            {
            }
            systempart(Control22;Links)
            {
            }
        }
    }

    actions
    {
    }
}

