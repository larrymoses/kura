#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72281 "Measurement Sheet Bill Codes"
{
    PageType = List;
    SourceTable = "Measurement Sheet Bill Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Planning Line No";"Planning Line No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill Item Category Line No';
                    Visible = false;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
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

